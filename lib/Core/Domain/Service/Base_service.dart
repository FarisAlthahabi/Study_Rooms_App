import 'package:dio/dio.dart';

class baseService {
  Dio dio = Dio();
  String getUserInfoURL = '';
  String registerURL = '';

// Room URLs.................................................
  String getRoomsURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/rooms/1/AllRooms';
  String getRoomsByCategoryURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/rooms/1/showByCategory/';
  String getAllRoomsCategoriesURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/roomCategories/1/allRoomCategories';
  String getRoomByIdURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/rooms/1/show/';
  String getRoomCategoryByIdURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/roomCategories/1/show/';
  String getAllRoomReservationsURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/room-reservations/1/get-all';
  String getAllRoomReservationsByTimeURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/room-reservations/1/get-all-by-time?time=2024-03-01T16:52:00';
  String reserveRoomURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/room-reservations/1/reserve-room';
  String cancelRoomReservationURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/room-reservations/1/cancel-reservation/';

// Place URLs ..............................................
  String getAllPlacesURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/places/allplaces';
  String getPlaceByIdURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/places/show/';

  //Table URLs.....................................
  String getAllTablesURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/tables/1/AllTables';
  String getTableByIdURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/tables/';
  String getAllTableCategoriesURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/table-category/1/AllTables';
  String getTableCategoryByIdURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/table-category/1/view-table-category/';
  String getAllTableReservationsURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/table-reservations/1/get-all';
  String getAllTableReservationsAtTimeURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/table-reservations/1/get-all-by-time?time=2024-03-01T17:10:00';
  String ReserveTableURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/table-reservations/1/reserve-table';
  String cancelTableReservationURL =
      'https://place-admininstration-spring-system-1.onrender.com/api/v1/table-reservations/1/cancel-reservation/';

  late Response response;
}
