import 'package:my_reservations/Core/Domain/Model/Base_model.dart';
import 'package:my_reservations/Core/Domain/Model/Error_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Place_model.dart';
import 'package:my_reservations/Core/Domain/Service/Base_service.dart';

class PlaceService extends baseService {
  Future <BaseModel>getAllPlaces() async {
    response = await dio.get(getAllPlacesURL);

    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        PlacesModel places = PlacesModel.fromMap(data);
        return places;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }

  Future <BaseModel>getPlaceById(String id) async {
    response = await dio.get(getPlaceByIdURL+'$id');

    try {
      if (response.statusCode == 200) {
        dynamic data = response.data;
        PlaceModel place = PlaceModel.fromMap(data);
        return place;
      } else {
        return ErrorModel(error: response.statusMessage);
      }
    } on Exception catch (e) {
      return ErrorModel(error: e.toString());
    }
  }
}
