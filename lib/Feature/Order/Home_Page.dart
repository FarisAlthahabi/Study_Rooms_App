import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_reservations/Feature/Order/Show_All_Room_Categories_Page.dart';
import 'package:my_reservations/Feature/Order/Show_All_Room_Reservations_Page.dart';
import 'package:my_reservations/Feature/Order/Show_All_Rooms_Page.dart';
import 'package:my_reservations/Feature/Order/Show_All_Halls_Page.dart';
import 'package:my_reservations/Feature/Order/Show_All_Table_Categories_Page.dart';
import 'package:my_reservations/Feature/Order/Show_All_Table_Reservations_Page.dart';
import 'package:my_reservations/Feature/Order/Show_All_Tables_Page.dart';
import 'package:my_reservations/Feature/Shared_pages/Shared_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                title: Center(
                  child: WelcomeToCoselText(
                                appBarText: 'Welcome to Study Home',
                              ),
                )),
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Text(
                      'Options',
                      style: TextStyle(fontSize: 25),
                    ),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(241, 101, 141, 1)),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Show All Room Reservations'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowAllRoomReservationsPage()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Show All Table Reservations'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowAllTableReservationsPage()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Show All Room Categories'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowAllRoomCategoriesPage()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Show All Table Categories'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShowAllTableCategoriesPage()));
                    },
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  ListTile(
                    //tileColor: Color.fromRGBO(241, 101, 141, 1),
                    title: Text(
                      'Close drawer',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TabBar(tabs: [
                    Container(
                      width: 108,
                      height: 115,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(244, 143, 172, 0.62),
                          Color.fromRGBO(241, 101, 141, 1)
                        ]),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 70,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Image.asset(
                                    'lib/Core/Resources/assets/soccer.png'),
                              ),
                              Text(
                                'Halls',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 108,
                      height: 115,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(239, 239, 242, 1),
                        //gradient:LinearGradient(colors: [Color.fromRGBO(244, 143, 172, 0.62),Color.fromRGBO(241, 101, 141, 1)]),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 70,
                          child: Column(
                            children: [
                              Image.asset(
                                  'lib/Core/Resources/assets/Group.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Rooms',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(49, 56, 79, 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 108,
                      height: 115,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(239, 239, 242, 1),
                        // gradient:LinearGradient(colors: [Color.fromRGBO(244, 143, 172, 0.62),Color.fromRGBO(241, 101, 141, 1)]),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 70,
                          child: Column(
                            children: [
                              Image.asset(
                                  'lib/Core/Resources/assets/study.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  'Tables',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(49, 56, 79, 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 400,
                    height: 470,
                    child: TabBarView(children: [
                      Container(
                        child: ShowHallsPage(),
                      ),
                      Container(
                        child: ShowRoomsPage(),
                      ),
                      Container(
                        child: StudyRoomPage(),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: NavigationBar(destinations: [
                    NavigationDestination(
                        icon: Icon(Icons.home), label: 'Home'),
                    NavigationDestination(
                        icon: Icon(Icons.favorite_border), label: 'Like'),
                    NavigationDestination(
                        icon: Icon(Icons.notifications_none_rounded),
                        label: 'Notifications'),
                    NavigationDestination(
                        icon: Icon(Icons.person), label: 'Profile'),
                  ]),
                )
              ],
            )));
  }
}
