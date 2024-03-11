// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_reservations/Core/Domain/Model/Reservation_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Room_model.dart';
import 'package:my_reservations/Core/Resources/String.dart';
import 'package:my_reservations/Feature/Order/bloc/room_bloc.dart';
import 'package:my_reservations/Feature/Order/bloc/table_bloc.dart';
import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

//!example of Room Reservation Time: 2024-04-01T23:47:00///

late int periodOfReservation;
TextEditingController periodOfReservationController = TextEditingController();
TextEditingController RoomNumberController = TextEditingController();
TextEditingController NumberOfSeatsController = TextEditingController();

class BookRoomPage extends StatelessWidget {
  RoomModel room;
  BookRoomPage({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    periodOfReservationController.text = '1';
    periodOfReservation = int.parse(periodOfReservationController.text);

    return BlocProvider(
      create: (context) => RoomBloc(),
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          if (state is LoadingToReserveRoomState) {
            return Scaffold(
              appBar: AppBar(
                title: BlocListener<RoomBloc, RoomState>(
                  listener: (context, state) {
                    if (state is SuccessToReserveRoomState) {
                      isRoomReserved = true;
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Room Is Booked Successfully'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Failed to book this room'),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                  child: Container(),
                ),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is SuccessToReserveRoomState) {
            myRoomReservationId = state.roomReservation.id.toString();

            return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: WelcomeToCoselText(
                    appBarText: 'Room Reservation',
                  ),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 30),
                    child: Container(
                      height: 190,
                      width: 450,
                      decoration: BoxDecoration(
                        //color: Colors.amber,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            'lib/Core/Resources/assets/Mask Group.png',
                            scale: 0.8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: 109,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      '${room.id}',
                                      //'Book Now',
                                      style: TextStyle(
                                          color: Color.fromRGBO(24, 24, 41, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${room.max_num_of_chairs}',
                                  //'Coffee Shop',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${room.status == 1 ? 'Available' : room.status == 2 ? 'Reserved' : 'Full'}',
                                  // 'Check Our Menu',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Enter Your Options',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(14, 15, 15, 1)),
                        ),
                      ),
                      //trailing: Icon(Icons.arrow_downward),
                    ),
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Room Number',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(14, 15, 15, 1)),
                      ),
                    ),
                    trailing: Container(
                      // color: Colors.black,
                      width: 180,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                        //  borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: RoomNumberController,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Number Of Seats',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(14, 15, 15, 1)),
                      ),
                    ),
                    trailing: Container(
                      // color: Colors.black,
                      width: 180,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: NumberOfSeatsController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Period Of Reservation',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(14, 15, 15, 1)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Room Reservation',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(14, 15, 15, 1)),
                          ),
                        ),
                        trailing: StatefulBuilder(
                          builder: (context, setState) => SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          if (periodOfReservation > 1) {
                                            periodOfReservation = int.parse(periodOfReservationController.text);
                                            periodOfReservation--;
                                            periodOfReservationController.text =
                                                periodOfReservation.toString();
                                          }
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.minimize),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                  height: 50,
                                  child: TextField(
                                    controller: periodOfReservationController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),

                                // Text(
                                //   '$periodOfReservation',
                                //   style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w500,
                                //       color: Color.fromRGBO(14, 15, 15, 1)),
                                // ),
                                IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        periodOfReservation = int.parse(periodOfReservationController.text);
                                        periodOfReservation++;
                                        periodOfReservationController.text =
                                                periodOfReservation.toString();
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          ReserveRoomModel reserveRoom = ReserveRoomModel(
                              time:
                                  '${time.year}-${timeSpace[0]}${time.month}-${timeSpace[1]}${time.day}T${timeSpace[2]}${time.hour}:${timeSpace[3]}${time.minute}:${timeSpace[4]}${time.second}',
                              // ReservationTimeController.text,
                              num_of_seats:
                                  int.parse(NumberOfSeatsController.text),
                              room_id: int.parse(RoomNumberController.text),
                              period_of_reservations: int.parse(
                                  periodOfReservationController.text));
                          BlocProvider.of<RoomBloc>(context)
                              .add(ReserveRoomEvent(reserveRoom: reserveRoom));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: BookNowBottom(),
                        ),
                      )),
                ],
              ),
              bottomNavigationBar: NavigationBar(destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.favorite_border), label: 'Like'),
                NavigationDestination(
                    icon: Icon(Icons.notifications_none_rounded),
                    label: 'Notifications'),
                NavigationDestination(
                    icon: Icon(Icons.person), label: 'Profile'),
              ]),
            );
          } else if (state is FailedToReserveRoomState) {
            return Scaffold(
              body: Center(child: Text('${state.error}')),
            );
          } else {
            // Scaffold(
            //   body: Center(child: Text('Error')),
            // );
            return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: WelcomeToCoselText(
                    appBarText: 'Room Reservation',
                  ),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 30),
                    child: Container(
                      height: 190,
                      width: 450,
                      decoration: BoxDecoration(
                        //color: Colors.amber,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            'lib/Core/Resources/assets/Mask Group.png',
                            scale: 0.8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: 109,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Text(
                                      '${room.id}',
                                      //'Book Now',
                                      style: TextStyle(
                                          color: Color.fromRGBO(24, 24, 41, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${room.max_num_of_chairs}',
                                  //'Coffee Shop',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${room.status == 1 ? 'Available' : room.status == 2 ? 'Reserved' : 'Full'}',
                                  // 'Check Our Menu',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Enter Your Options',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(14, 15, 15, 1)),
                        ),
                      ),
                      //trailing: Icon(Icons.arrow_downward),
                    ),
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Room Number',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(14, 15, 15, 1)),
                      ),
                    ),
                    trailing: Container(
                      // color: Colors.black,
                      width: 180,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                        //  borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: RoomNumberController,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Number Of Seats',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(14, 15, 15, 1)),
                      ),
                    ),
                    trailing: Container(
                      // color: Colors.black,
                      width: 180,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                        // borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: NumberOfSeatsController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Period Of Reservation',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(14, 15, 15, 1)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Room Reservation',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(14, 15, 15, 1)),
                          ),
                        ),
                        trailing: StatefulBuilder(
                          builder: (context, setState) => SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          if (periodOfReservation > 1) {
                                            periodOfReservation = int.parse(periodOfReservationController.text);
                                            periodOfReservation--;
                                            periodOfReservationController.text =
                                                periodOfReservation.toString();
                                          }
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.minimize),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                  height: 50,
                                  child: TextField(
                                    controller: periodOfReservationController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                // Text(
                                //   '$periodOfReservation',
                                //   style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w500,
                                //       color: Color.fromRGBO(14, 15, 15, 1)),
                                // ),
                                IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        periodOfReservation = int.parse(periodOfReservationController.text);
                                        periodOfReservation++;
                                        periodOfReservationController.text =
                                                periodOfReservation.toString();
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          ReserveRoomModel reserveRoom = ReserveRoomModel(
                              time:
                                  '${time.year}-${timeSpace[0]}${time.month}-${timeSpace[1]}${time.day}T${timeSpace[2]}${time.hour}:${timeSpace[3]}${time.minute}:${timeSpace[4]}${time.second}',
                              // ReservationTimeController.text,
                              num_of_seats:
                                  int.parse(NumberOfSeatsController.text),
                              room_id: int.parse(RoomNumberController.text),
                              period_of_reservations: int.parse(
                                  periodOfReservationController.text));
                          BlocProvider.of<RoomBloc>(context)
                              .add(ReserveRoomEvent(reserveRoom: reserveRoom));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: BookNowBottom(),
                        ),
                      )),
                ],
              ),
              bottomNavigationBar: NavigationBar(destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.favorite_border), label: 'Like'),
                NavigationDestination(
                    icon: Icon(Icons.notifications_none_rounded),
                    label: 'Notifications'),
                NavigationDestination(
                    icon: Icon(Icons.person), label: 'Profile'),
              ]),
            );
          }
        },
      ),
    );
  }
}
