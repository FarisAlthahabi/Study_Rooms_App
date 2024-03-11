import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reservations/Core/Domain/Model/Room_model.dart';
import 'package:my_reservations/Feature/Order/Book_Room_Page.dart';
import 'package:my_reservations/Feature/Order/bloc/room_bloc.dart';
import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

class ShowRoomsPage extends StatelessWidget {
  const ShowRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    RoomModel room;
    return BlocProvider(
      create: (context) => RoomBloc()..add(GetAllRoomsEvent()),
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          if (state is LoadingRoomsState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is SuccessToGetAllRoomsState) {
            return Scaffold(
              body: Container(
                height: 470,
                child: ListView.builder(
                    itemCount: state.rooms.rooms.length,
                    itemBuilder: (context, index) {
                      room = state.rooms.rooms[index];
                      return Container(
                        height: 470,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 30),
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
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Center(
                                              child: Text(
                                                '${room.id}',
                                                // 'Book Now',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        24, 24, 41, 1),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                            '${room.id == 1 ? 'Available' : state.rooms.rooms[index].id == 2 ? 'Reserved' : 'Full'}',
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
                              padding: const EdgeInsets.only(top: 50),
                              child: Text(
                                'Celebrate the irrisistible flavor of coffee in our\n range of espresso , cocktails and ice drinks',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(131, 135, 149, 1)),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 15),
                            //   child: Stack(children: [
                            //     Padding(
                            //       padding: const EdgeInsets.only(left: 15),
                            //       child: Image.asset(
                            //         'lib/Core/Resources/assets/image 14.png',
                            //       ),
                            //     ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 70, right: 15),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BookRoomPage(
                                                  room: room,
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25,right : 25),
                                    child: BookNowBottom(),
                                  )),
                            ),
                            //   ]),
                            // ),
                          ],
                        ),
                      );
                    }),
              ),
            );
          } else if (state is FailedToGetAllRoomsState) {
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
