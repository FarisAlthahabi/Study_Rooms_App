import 'package:my_reservations/Core/Domain/Model/Base_model.dart';
import 'package:my_reservations/Core/Domain/Model/Error_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Reservation_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Table_Category_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Table_model.dart';
import 'package:my_reservations/Core/Domain/Service/Base_service.dart';

class TableService extends baseService {
  Future<BaseModel> getAllTables() async {
    response = await dio.get(getAllTablesURL);
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        TablesModel tables = TablesModel.fromMap(data);
        return tables;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getTableById(String id) async {
    response = await dio.get(getTableByIdURL + '$id');
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        TableModel table = TableModel.fromMap(data);
        return table;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getAllTableCategories() async {
    response = await dio.get(getAllTableCategoriesURL);
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        TableCategoriesModel tableCategories =
            TableCategoriesModel.fromMap(data);
        return tableCategories;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getTableCategoryById(String id) async {
    response = await dio.get(getTableCategoryByIdURL + '$id');
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        TableCategoryModel tableCategory = TableCategoryModel.fromMap(data);
        return tableCategory;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getAllTableReservations() async {
    response = await dio.get(getAllTableReservationsURL);
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;

        TableReservationsModel tableReservations =
            TableReservationsModel.fromMap(data);
        return tableReservations;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> getAllTableReservationsAtTime() async {
    response = await dio.get(getAllTableReservationsAtTimeURL);
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;

        TableReservationsModel tableReservations =
            TableReservationsModel.fromMap(data);
        return data;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future<BaseModel> ReserveTable(
    ReserveTableModel reserveTable
    // String time, int num_of_seats, int table_id,
    //   int period_of_reservations
      ) async {
    // ReserveTableModel reserveTable = ReserveTableModel(
    //     time: time,
    //     num_of_seats: num_of_seats,
    //     table_id: table_id,
    //     period_of_reservations: period_of_reservations);

    response = await dio.post(ReserveTableURL , data:reserveTable.toMap());
    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;

        TableReservationModel tableReservation =
            TableReservationModel.fromMap(data);
        return tableReservation;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

    Future<BaseModel> cancelTableReservation(String id) async {
    response = await dio.delete(cancelTableReservationURL + '$id');

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



