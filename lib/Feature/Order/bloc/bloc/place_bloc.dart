import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_reservations/Core/Domain/Model/Base_model.dart';
import 'package:my_reservations/Core/Domain/Model/Error_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Place_model.dart';
import 'package:my_reservations/Core/Domain/Service/Place_Service.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  PlaceBloc() : super(PlaceInitial()) {
    on<GetPlacesEvent>((event, emit) async{
      emit(LoadingState());
      BaseModel data =await PlaceService().getAllPlaces();
      if (data is ErrorModel) {
        emit(FailedToLoadPlacesState(error: ErrorModel(error: data.error)));
      } else if(data is PlacesModel){
        emit(SuccessToGetPlacesState(places: data));
      }
    });
  }
}
