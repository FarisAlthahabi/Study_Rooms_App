import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_reservations/Feature/Order/Book_Table_Page.dart';
import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

class ShowStudyRoomsPage extends StatelessWidget {
  const ShowStudyRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WelcomeToCoselText(
          appBarText: 'Studying Rooms',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Choose your Plan',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(49, 56, 79, 1)),
            ),
          ),
          Container(
            height: 570,
            // color: Colors.black12,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                String text;
                LinearGradient gradient;
                if (index == 0) {
                  text = 'Day';
                  gradient = LinearGradient(colors: [
                    Color.fromRGBO(242, 232, 255, 1),
                    Color.fromRGBO(208, 174, 251, 1)
                  ]);
                } else if (index == 1) {
                  text = 'Week';
                  gradient = LinearGradient(colors: [
                    Color.fromRGBO(203, 227, 255, 1),
                    Color.fromRGBO(203, 227, 255, 1)
                  ]);
                } else {
                  text = 'Month';
                  gradient = LinearGradient(colors: [
                    Color.fromRGBO(255, 243, 182, 1),
                    Color.fromRGBO(255, 243, 182, 1)
                  ]);
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookTablePage(
                                  text: text,
                                  gradient: gradient,
                                ))),
                    child: Container(
                      width: 343,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(width: 1, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 12),
                              blurRadius: 24,
                              color: Color.fromRGBO(0, 0, 0, 0.012))
                        ],
                        //color: Colors.amber
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 170,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16)),
                                  color: index == 0
                                      ? Color.fromRGBO(242, 232, 255, 1)
                                      : index == 1
                                          ? Color.fromRGBO(203, 227, 255, 1)
                                          : Color.fromRGBO(255, 243, 182, 1),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                        'lib/Core/Resources/assets/image.png'),
                                    Text(
                                      '1 $text Pass',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(0, 0, 0, 1)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      '$text Pass',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(25, 29, 33, 1)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 25),
                                    child: Text(
                                      'Good for one day in the\n downstaire room',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(131, 135, 149, 1)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: NavigationBar(destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border), label: 'Like'),
              NavigationDestination(
                  icon: Icon(Icons.notifications_none_rounded),
                  label: 'Notifications'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            ]),
          )
        ],
      ),
    );
  }
}
