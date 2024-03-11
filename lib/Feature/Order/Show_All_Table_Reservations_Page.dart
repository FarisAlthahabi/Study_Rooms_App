import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reservations/Core/Resources/String.dart';
import 'package:my_reservations/Feature/Order/bloc/room_bloc.dart';
import 'package:my_reservations/Feature/Order/bloc/table_bloc.dart';
import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

class ShowAllTableReservationsPage extends StatelessWidget {
  const ShowAllTableReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableBloc()..add(GetAllTableReservationsEvent()),
      child: BlocBuilder<TableBloc, TableState>(
        builder: (context, state) {
          if (state is LoadingTableReservationsState ||
              state is LoadingToCancelMyTableReservationState) {
            return Scaffold(
              appBar: AppBar(
                title: BlocListener<TableBloc, TableState>(
                  listener: (context, state) {
                    if (state is SuccessToCancelMyTableReservationState) {
                      isTableReserved = false;
                      BlocProvider.of<TableBloc>(context)
                          .add(GetAllTableReservationsEvent());
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        duration: Duration(seconds: 3),
                        content:
                            Text('Your Reservation is canceled Successfully'),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ));
                    } else if (state is FailedToCancelMyTableReservationState) {
                      BlocProvider.of<TableBloc>(context)
                          .add(GetAllTableReservationsEvent());
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
          } else if (state is SuccessToGetAllTableReservationsState) {
            return Scaffold(
              appBar: AppBar(
                  title: Center(
                child: WelcomeToCoselText(
                  appBarText: 'All Table Reservations',
                ),
              )),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Divider(thickness: 2, color: Colors.black,),
                  Container(
                    height: 500,
                    child:
                    GridView.builder(
                          itemCount: state.tableReservations.tableReservations.length,
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
                                      '${state.tableReservations.tableReservations[index].id}',
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
                                    '${state.tableReservations.tableReservations[index].num_of_seats}',
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
                                        '${state.tableReservations.tableReservations[index].period_of_reservations}',
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
                                        '${state.tableReservations.tableReservations[index].time}',
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
                                        '${state.tableReservations.tableReservations[index].status == 1 ? 'Available' : state.tableReservations.tableReservations[index].status == 2 ? 'Reserved' : 'Full'}',
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
                      if (isTableReserved == true) {
                        BlocProvider.of<TableBloc>(context).add(
                            CancelMyTableReservationEvent(
                                myTableReservationId: myTableReservationId));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text('You dont have a table reservation'),
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
                        child: Text('Cancel My Table Reservation'),
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
          } else if (state is FailedToGetAllTableReservationsState) {
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
