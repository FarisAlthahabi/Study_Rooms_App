// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'room_bloc.dart';

@immutable
sealed class RoomState {}

final class RoomInitial extends RoomState {}

class LoadingRoomsState extends RoomState {}

class SuccessToGetAllRoomsState extends RoomState {
  RoomsModel rooms;
  SuccessToGetAllRoomsState({
    required this.rooms,
  });
}

class FailedToGetAllRoomsState extends RoomState {
  ErrorModel error;
  FailedToGetAllRoomsState({
    required this.error,
  });
}

class LoadingToReserveRoomState extends RoomState {}

class SuccessToReserveRoomState extends RoomState {
  RoomReservationModel roomReservation;
  SuccessToReserveRoomState({
    required this.roomReservation,
  });
}

class FailedToReserveRoomState extends RoomState {
  ErrorModel error;
  FailedToReserveRoomState({
    required this.error,
  });
}

class LoadingRoomReservationsState extends RoomState {}

class SuccessToGetAllRoomReservationsState extends RoomState {
  ReservationsModel roomReservations;
  SuccessToGetAllRoomReservationsState({
    required this.roomReservations,
  });
}

class FailedToGetAllRoomReservationsState extends RoomState {
  ErrorModel error;
  FailedToGetAllRoomReservationsState({
    required this.error,
  });
}

class LoadingToCancelMyRoomReservationState extends RoomState {}

class SuccessToCancelMyRoomReservationState extends RoomState {
  dynamic cancelationResult;
  SuccessToCancelMyRoomReservationState({
    required this.cancelationResult,
  });
}

class FailedToCancelMyRoomReservationState extends RoomState {
  ErrorModel error;
  FailedToCancelMyRoomReservationState({
    required this.error,
  });
}
