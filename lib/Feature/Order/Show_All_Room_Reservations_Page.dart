import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reservations/Core/Domain/Service/Room_Service.dart';
import 'package:my_reservations/Core/Resources/String.dart';
import 'package:my_reservations/Feature/Order/bloc/room_bloc.dart';
import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

class ShowAllRoomReservationsPage extends StatelessWidget {
  const ShowAllRoomReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomBloc()..add(GetAllRoomReservationsEvent()),
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          if (state is LoadingRoomReservationsState ||
              state is LoadingToCancelMyRoomReservationState) {
            return Scaffold(
              appBar: AppBar(
                title: BlocListener<RoomBloc, RoomState>(
                  listener: (context, state) {
                    if (state is SuccessToCancelMyRoomReservationState) {
                      isRoomReserved = false;
                      BlocProvider.of<RoomBloc>(context)
                          .add(GetAllRoomReservationsEvent());
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content:
                            Text('Your Reservation is canceled Successfully'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ));
                    } else if (state is FailedToCancelMyRoomReservationState) {
                      BlocProvider.of<RoomBloc>(context)
                          .add(GetAllRoomReservationsEvent());
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Failed to cancel your reservation'),
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
          } else if (state is SuccessToGetAllRoomReservationsState) {
            return Scaffold(
              appBar: AppBar(
                  title: Center(
                child: WelcomeToCoselText(
                  appBarText: 'All Room Reservations',
                ),
              )),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Divider(thickness: 2, color: Colors.black,),
                  Container(
                      // color: Colors.black12,
                      height: 500,
                      child: GridView.builder(
                          itemCount: state.roomReservations.reservations.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1),
                          itemBuilder: (context, index) {
                            return Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                     
                                    Card(
                                      child: ListTile(
                                        leading: Text(
                                      'Number of reservation',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                                                        ),
                                        trailing:Text(
                                      '${state.roomReservations.reservations[index].id}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                                                        ), 
                                      ),
                                    ),
                                    Divider(),
                                    Card(
                                      child: ListTile(
                                        leading: Text(
                                      'Number of seats in room',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                                                        ),
                                        trailing:Text(
                                    '${state.roomReservations.reservations[index].number_of_seats}',
                                    //  index.toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                      ),
                                    ),
                                    Divider(),
                                    Card(
                                      child: ListTile(
                                        leading: Text(
                                      'Period of reservation',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                                                        ),
                                        trailing:Text(
                                        '${state.roomReservations.reservations[index].period_of_reservations}',
                                        //  index.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      ),
                                    ),
                                     Divider(),
                                      Card(
                                      child: ListTile(
                                        leading: Text(
                                      'Date of reservation',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                                                        ),
                                        trailing:Text(
                                        '${state.roomReservations.reservations[index].time}',
                                        //  index.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      ),
                                    ),
                                    Divider(),
                                    Card(
                                      child: ListTile(
                                        leading: Text(
                                      'Status of room',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                                                        ),
                                        trailing:Text(
                                        '${state.roomReservations.reservations[index].status == 1 ? 'Available' : state.roomReservations.reservations[index].status == 2 ? 'Reserved' : 'Full'}',
                                        //  index.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      ),
                                    ),
                                    Divider(thickness: 2, color: Colors.black,),
                                      
                                      
                                  ],
                                ),
                              ),
                            );
                          })
                    
                      ),
                  InkWell(
                    onTap: () {
                      // RoomService().cancelRoomReservation(myRoomReservationId);
                      if (isRoomReserved == true) {
                        BlocProvider.of<RoomBloc>(context).add(
                            CancelMyRoomReservationEvent(
                                myRoomReservationId: myRoomReservationId));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text('You dont have a room reservation'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ));
                      }
                    },
                    child: Container(
                      width: 311,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(240, 89, 132, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text('Cancel My Room Reservation'),
                      ),
                    ),
                  )
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
          } else if (state is FailedToGetAllRoomReservationsState) {
            return Scaffold(
              body: Center(child: Text('${state.error}')),
            );
          } else {
            return Scaffold(
              body: Center(child: Text('Error')),
            );
          }
        },
      ),
    );
  }
}
