// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'table_bloc.dart';

@immutable
sealed class TableState {}

final class TableInitial extends TableState {}

class LoadingTablesState extends TableState {}

class SuccessToGetAllTablesState extends TableState {
  TablesModel tables;
  SuccessToGetAllTablesState({
    required this.tables,
  });
}

class FailedToGetAllTablesState extends TableState {
  ErrorModel error;
  FailedToGetAllTablesState({
    required this.error,
  });
}

class LoadingToReserveTableState extends TableState {}

class SuccessToReserveTableState extends TableState {
  TableReservationModel tableReservation;
  SuccessToReserveTableState({
    required this.tableReservation,
  });
}

class FailedToReserveTableState extends TableState {
  ErrorModel error;
  FailedToReserveTableState({
    required this.error,
  });
}

class LoadingTableReservationsState extends TableState {}

class SuccessToGetAllTableReservationsState extends TableState {
  TableReservationsModel tableReservations;
  SuccessToGetAllTableReservationsState({
    required this.tableReservations,
  });
}

class FailedToGetAllTableReservationsState extends TableState {
  ErrorModel error;
  FailedToGetAllTableReservationsState({
    required this.error,
  });
}

class LoadingToCancelMyTableReservationState extends TableState {}

class SuccessToCancelMyTableReservationState extends TableState {
  dynamic cancelationResult;
  SuccessToCancelMyTableReservationState({
    required this.cancelationResult,
  });
}

class FailedToCancelMyTableReservationState extends TableState {
  ErrorModel error;
  FailedToCancelMyTableReservationState({
    required this.error,
  });
}

