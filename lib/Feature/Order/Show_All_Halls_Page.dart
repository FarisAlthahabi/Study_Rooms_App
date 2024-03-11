import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reservations/Feature/Order/bloc/bloc/place_bloc.dart';
import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

class ShowHallsPage extends StatelessWidget {
  const ShowHallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceBloc()..add(GetPlacesEvent()),
      child: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is SuccessToGetPlacesState) {
            return Scaffold(
                body: Container(
              height: 470,
              child: ListView.builder(
                itemCount: state.places.places.length,
                itemBuilder: (context, index) => Container(
                  height: 470,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 30),
                        child: Container(
                          height: 161,
                          width: 350,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(123, 157, 226, 1),
                              Color.fromRGBO(59, 59, 192, 1)
                            ]),
                            boxShadow: [BoxShadow()],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 109,
                                    height: 23,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                      child: Text(
                                        '${state.places.places[index].id}',
                                      //  '12 Spots available',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(24, 24, 41, 1),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${state.places.places[index].name}',
                                  //  'Looking for a safe \n stuying place ?',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${state.places.places[index].location}',
                                   // 'Welcome to COSEL',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Image.asset(
                                  'lib/Core/Resources/assets/image 13.png'),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'COSEL creates studying spaces that help \n students go further, faster by building a positive\n community dreaming of a better tomorrow.',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(131, 135, 149, 1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Row(
                          children: [
                            Icon(Icons.wifi),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Hight speed internet',
                                style: TextStyle(
                                    color: Color.fromRGBO(49, 56, 79, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Row(
                          children: [
                            Icon(Icons.radio),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Projector',
                                style: TextStyle(
                                    color: Color.fromRGBO(49, 56, 79, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 30),
                        child: Row(
                          children: [
                            Icon(Icons.picture_in_picture_sharp),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Withe Board',
                                style: TextStyle(
                                    color: Color.fromRGBO(49, 56, 79, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 30),
                      //   child: BookNowBottom(),
                      // ),
                    ],
                  ),
                ),
              ),
            )

                //bottomNavigationBar: NavigationBar(destinations: destinations),
                );
          } else if (state is FailedToLoadPlacesState) {
            return Scaffold(
              body: Center(child: Text('${state.error}')),
            );
          }
          else{
            return Scaffold(
              body: Center(child: Text('Error')),
            );
          }
        },
      ),
    );
  }
}
