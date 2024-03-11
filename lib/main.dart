import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_reservations/Core/Config/Bloc_Observer.dart';
import 'package:my_reservations/Core/Domain/Model/Reservation_Model.dart';
import 'package:my_reservations/Core/Domain/Service/Place_Service.dart';
import 'package:my_reservations/Core/Domain/Service/Room_Service.dart';
import 'package:my_reservations/Core/Domain/Service/Table_Service.dart';
import 'package:my_reservations/Core/Resources/String.dart';
import 'package:my_reservations/Feature/Auth/First_Page.dart';
import 'package:my_reservations/Feature/Auth/pagesForTest/First_Page_test.dart';

void main() async {

  for (int i = 0; i < 5; i++) {
      if (timeProperty[i].length == 1) {
        timeSpace[i] = '0';
      }
    }
    print(
        '${time.year}-${timeSpace[0]}${time.month}-${timeSpace[1]}${time.day}T${timeSpace[2]}${time.hour}:${timeSpace[3]}${time.minute}:${timeSpace[4]}${time.second}');

  // print(await RoomService().getRooms());
  //print(await RoomService().getRoomById('1'));
  // print(await RoomService().getRoomsByCategory('1'));  Roomcategories
  //print(await RoomService().getAllRoomsCategories());
  //print(await RoomService().getRoomCategoryById('1'));
  //print(await RoomService().getAllRoomReservations());   Roomreservation
  // print(await RoomService().getAllRoomReservationsByTime());
  //print(await RoomService().ReserveRoom('2024-05-01T16:47:00', 5, 2, 1));
  //print(await RoomService().cancelRoomReservation('13'));

  //print(await PlaceService().getAllPlaces());
  //print(await PlaceService().getPlaceById('1'));

  //print(await TableService().getAllTables());
  //print(await TableService().getTableById('1'));
  //print(await TableService().getAllTableCategories()); TableCategory
  //print(await TableService().getTableCategoryById('1'));
  //print(await TableService().getAllTableReservations()); Tablereservation
  //print(await TableService().getAllTableReservationsAtTime());
  // ReserveTableModel reserveTable = ReserveTableModel(
  //     time: '2024-05-01T17:21:13',
  //     num_of_seats: 1,
  //     table_id: 1,
  //     period_of_reservations: 1);
  // print(await TableService().ReserveTable(reserveTable));

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return FirstPageTest();
  }
}
