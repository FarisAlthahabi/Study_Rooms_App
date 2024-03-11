import 'package:my_reservations/Core/Domain/Model/Base_model.dart';
import 'package:my_reservations/Core/Domain/Model/Error_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Reservation_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Room_Category_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Room_model.dart';
import 'package:my_reservations/Core/Domain/Service/Base_service.dart';

class RoomService extends baseService {
  Future<BaseModel> getRooms() async {
    response = await dio.get(getRoomsURL);

    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        //print(data);
        RoomsModel rooms = RoomsModel.fromMap(data);
        return rooms;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getRoomsByCategory(String category) async {
    response = await dio.get(getRoomsByCategoryURL + '$category');
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        RoomsModel rooms = RoomsModel.fromMap(data);
        return rooms;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getAllRoomsCategories() async {
    response = await dio.get(getAllRoomsCategoriesURL);

    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        RoomCategoriesModel roomCategories = RoomCategoriesModel.fromMap(data);
        return roomCategories;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getRoomById(String id) async {
    response = await dio.get(getRoomByIdURL + '$id');
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        RoomModel room = RoomModel.fromMap(data);
        return room;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getRoomCategoryById(String id) async {
    response = await dio.get(getRoomCategoryByIdURL + '$id');
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        RoomCategoryModel roomCategory = RoomCategoryModel.fromMap(data);
        return roomCategory;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getAllRoomReservations() async {
    response = await dio.get(getAllRoomReservationsURL);

    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        ReservationsModel reservations = ReservationsModel.fromMap(data);
        return reservations;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getAllRoomReservationsByTime() async {
    response = await dio.get(getAllRoomReservationsByTimeURL);

    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        ReservationsModel reservations = ReservationsModel.fromMap(data);
        return reservations;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> ReserveRoom(
    ReserveRoomModel reserveRoom
    // String time, int num_of_seats, int room_id,
    //   int period_of_reservations
      ) async {
    // ReserveRoomModel reserveRoom = ReserveRoomModel(
    //     time: time,
    //     num_of_seats: num_of_seats,
    //     room_id: room_id,
    //     period_of_reservations: period_of_reservations);
    response = await dio.post(reserveRoomURL, data: reserveRoom.toMap());

    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        RoomReservationModel roomReservation = RoomReservationModel.fromMap(data);
        return roomReservation;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> cancelRoomReservation(String id) async {
    response = await dio.delete(cancelRoomReservationURL + id);

    try {
      if (response.statusCode == 200) {
        // print(response.data);
        dynamic data = response.data;
        //print(data);
        DeleteResultModel deleteResult = DeleteResultModel(DeleteResult: data);
        // print(deleteResult);
        return deleteResult;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }
}
