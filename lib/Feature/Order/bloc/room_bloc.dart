import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_reservations/Core/Domain/Model/Base_model.dart';
import 'package:my_reservations/Core/Domain/Model/Error_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Reservation_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Room_model.dart';
import 'package:my_reservations/Core/Domain/Service/Room_Service.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomInitial()) {
    on<GetAllRoomsEvent>((event, emit) async {
      emit(LoadingRoomsState());
      BaseModel result = await RoomService().getRooms();
      if (result is RoomsModel) {
        emit(SuccessToGetAllRoomsState(rooms: result));
      } else if (result is ErrorModel) {
        emit(FailedToGetAllRoomsState(error: result));
      }
    });

    on<ReserveRoomEvent>((event, emit) async {
      emit(LoadingToReserveRoomState());
      BaseModel result = await RoomService().ReserveRoom(event.reserveRoom);
      if (result is RoomReservationModel) {
        emit(SuccessToReserveRoomState(roomReservation:result ));
      } else if (result is ErrorModel) {
        emit(FailedToReserveRoomState(error: result));
      }
    });

    on<GetAllRoomReservationsEvent>((event, emit) async {
      emit(LoadingRoomReservationsState());
      BaseModel result = await RoomService().getAllRoomReservations();
      if (result is ReservationsModel) {
        emit(SuccessToGetAllRoomReservationsState(roomReservations: result));
      } else if (result is ErrorModel) {
        emit(FailedToGetAllRoomReservationsState(error: result));
      }
    });

    on<CancelMyRoomReservationEvent>((event, emit) async {
      emit(LoadingToCancelMyRoomReservationState());
      BaseModel result = await RoomService().cancelRoomReservation(event.myRoomReservationId);
      if (result is DeleteResultModel) {
        emit(SuccessToCancelMyRoomReservationState(cancelationResult: result.DeleteResult));
      } else if (result is ErrorModel) {
        emit(FailedToCancelMyRoomReservationState(error: result));
      }
    });
  }
}
