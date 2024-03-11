// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'table_bloc.dart';

@immutable
sealed class TableEvent {}

class GetAllTablesEvent extends TableEvent {}

class ReservetableEvent extends TableEvent {
  ReserveTableModel reserveTable;
  ReservetableEvent({
    required this.reserveTable,
  });
}

class GetAllTableReservationsEvent extends TableEvent {}

class CancelMyTableReservationEvent extends TableEvent {
  String myTableReservationId;
  CancelMyTableReservationEvent({
    required this.myTableReservationId,
  });
}