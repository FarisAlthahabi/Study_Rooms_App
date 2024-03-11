// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reservations/Core/Domain/Model/Reservation_Model.dart';
import 'package:my_reservations/Core/Resources/String.dart';
import 'package:my_reservations/Feature/Order/bloc/table_bloc.dart';

import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

//! example for Table reservation Time: 2024-05-01T23:20:13

late int periodOfReservation;
TextEditingController periodOfReservationController = TextEditingController();
TextEditingController TableNumberController = TextEditingController();
TextEditingController NumberOfSeatsController = TextEditingController();

class BookTablePage extends StatelessWidget {
  String text;
  LinearGradient gradient;
  BookTablePage({
    Key? key,
    required this.text,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    periodOfReservationController.text = '1';
    periodOfReservation = int.parse(periodOfReservationController.text);

    return BlocProvider(
      create: (context) => TableBloc(),
      child: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          if (state is LoadingToReserveTableState) {
            return Scaffold(
              appBar: AppBar(
                title: BlocListener<TableBloc, TableState>(
                  listener: (context, state) {
                    if (state is SuccessToReserveTableState) {
                      isTableReserved = true;
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Table is booked successfully'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Failed to book this table'),
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
          } else if (state is SuccessToReserveTableState) {
            myTableReservationId = state.tableReservation.id.toString();
            return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: WelcomeToCoselText(
                    appBarText: '$text Pass',
                  ),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: Container(
                      width: 319,
                      height: 161,
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('lib/Core/Resources/assets/image.png'),
                          Text(
                            '1 $text Pass',
                            style: TextStyle(
                                fontSize: 21.33,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1)),
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
                        'Table Number',
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
                        controller: TableNumberController,
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
                            '$text Pass',
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
                          ReserveTableModel reserveTable = ReserveTableModel(
                              time:
                                  '${time.year}-${timeSpace[0]}${time.month}-${timeSpace[1]}${time.day}T${timeSpace[2]}${time.hour}:${timeSpace[3]}${time.minute}:${timeSpace[4]}${time.second}',
                              //ReservationTimeController.text,
                              num_of_seats:
                                  int.parse(NumberOfSeatsController.text),
                              table_id: int.parse(TableNumberController.text),
                              period_of_reservations: int.parse(
                                  periodOfReservationController.text));
                          BlocProvider.of<TableBloc>(context).add(
                              ReservetableEvent(reserveTable: reserveTable));
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
          } else if (state is FailedToReserveTableState) {
            return Scaffold(
              body: Center(child: Text('${state.error}')),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: WelcomeToCoselText(
                    appBarText: '$text Pass',
                  ),
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 10),
                    child: Container(
                      width: 319,
                      height: 161,
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('lib/Core/Resources/assets/image.png'),
                          Text(
                            '1 $text Pass',
                            style: TextStyle(
                                fontSize: 21.33,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1)),
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
                        'Table Number',
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
                        controller: TableNumberController,
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
                            '$text Pass',
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
                          ReserveTableModel reserveTable = ReserveTableModel(
                              time:
                                  '${time.year}-${timeSpace[0]}${time.month}-${timeSpace[1]}${time.day}T${timeSpace[2]}${time.hour}:${timeSpace[3]}${time.minute}:${timeSpace[4]}${time.second}',
                              //ReservationTimeController.text,
                              num_of_seats:
                                  int.parse(NumberOfSeatsController.text),
                              table_id: int.parse(TableNumberController.text),
                              period_of_reservations: int.parse(
                                  periodOfReservationController.text));
                          BlocProvider.of<TableBloc>(context).add(
                              ReservetableEvent(reserveTable: reserveTable));
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
