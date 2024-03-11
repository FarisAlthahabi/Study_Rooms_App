// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'room_bloc.dart';

@immutable
sealed class RoomEvent {}

class GetAllRoomsEvent extends RoomEvent {}

class ReserveRoomEvent extends RoomEvent {
  ReserveRoomModel reserveRoom;
  ReserveRoomEvent({
    required this.reserveRoom,
  });
}

class GetAllRoomReservationsEvent extends RoomEvent {}

class CancelMyRoomReservationEvent extends RoomEvent {
  String myRoomReservationId;
  CancelMyRoomReservationEvent({
    required this.myRoomReservationId,
  });
}
