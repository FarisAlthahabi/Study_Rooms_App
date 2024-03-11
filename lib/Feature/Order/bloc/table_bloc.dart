import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_reservations/Core/Domain/Model/Base_model.dart';
import 'package:my_reservations/Core/Domain/Model/Error_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Reservation_Model.dart';
import 'package:my_reservations/Core/Domain/Model/Table_model.dart';
import 'package:my_reservations/Core/Domain/Service/Table_Service.dart';
import 'package:my_reservations/Feature/Order/bloc/room_bloc.dart';

part 'table_event.dart';
part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableBloc() : super(TableInitial()) {
    on<GetAllTablesEvent>((event, emit) async {
      emit(LoadingTablesState());
      BaseModel result = await TableService().getAllTables();
      if (result is TablesModel) {
        emit(SuccessToGetAllTablesState(tables: result));
      } else if (result is ErrorModel) {
        emit(FailedToGetAllTablesState(error: result));
      }
    });
    on<ReservetableEvent>((event, emit) async {
      emit(LoadingToReserveTableState());
      BaseModel result = await TableService().ReserveTable(event.reserveTable);
      if (result is TableReservationModel) {
        emit(SuccessToReserveTableState(tableReservation: result));
      } else if (result is ErrorModel) {
        emit(FailedToGetAllTablesState(error: result));
      }
    });

    on<GetAllTableReservationsEvent>((event, emit) async {
      emit(LoadingTableReservationsState());
      BaseModel result = await TableService().getAllTableReservations();
      if (result is TableReservationsModel) {
        emit(SuccessToGetAllTableReservationsState(tableReservations: result));
      } else if (result is ErrorModel) {
        emit(FailedToGetAllTableReservationsState(error: result));
      }
    });

    on<CancelMyTableReservationEvent>((event, emit) async {
      emit(LoadingToCancelMyTableReservationState());
      BaseModel result = await TableService().cancelTableReservation(event.myTableReservationId);
      if (result is DeleteResultModel) {
        emit(SuccessToCancelMyTableReservationState(cancelationResult: result.DeleteResult));
      } else if (result is ErrorModel) {
        emit(FailedToCancelMyTableReservationState(error: result));
      }
    });
  }
}
