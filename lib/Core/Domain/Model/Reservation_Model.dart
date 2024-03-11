// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_reservations/Core/Domain/Model/Base_model.dart';
import 'package:my_reservations/Core/Domain/Model/Place_model.dart';
import 'package:my_reservations/Core/Domain/Model/Room_model.dart';
import 'package:my_reservations/Core/Domain/Model/Table_model.dart';

class RoomReservationModel extends BaseModel {
  num id;
  PlaceModel place;
  RoomModel room;
  int status;
  int? number_of_seats;
  List<dynamic> time;
  num period_of_reservations;
  RoomReservationModel({
    required this.id,
    required this.place,
    required this.room,
    required this.status,
    required this.number_of_seats,
    required this.time,
    required this.period_of_reservations,
  });

  RoomReservationModel copyWith({
    num? id,
    PlaceModel? place,
    RoomModel? room,
    int? status,
    int? number_of_seats,
    List<dynamic>? time,
    num? period_of_reservations,
  }) {
    return RoomReservationModel(
      id: id ?? this.id,
      place: place ?? this.place,
      room: room ?? this.room,
      status: status ?? this.status,
      number_of_seats: number_of_seats ?? this.number_of_seats,
      time: time ?? this.time,
      period_of_reservations:
          period_of_reservations ?? this.period_of_reservations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'place': place.toMap(),
      'room': room.toMap(),
      'status': status,
      'number_of_seats': number_of_seats,
      'time': time,
      'period_of_reservations': period_of_reservations,
    };
  }

  factory RoomReservationModel.fromMap(Map<String, dynamic> map) {
    return RoomReservationModel(
      id: map['id'] as num,
      place: PlaceModel.fromMap(map['place'] as Map<String, dynamic>),
      room: RoomModel.fromMap(map['room'] as Map<String, dynamic>),
      status: map['status'] as int,
      number_of_seats: map['number_of_seats'] as int?,
      time: map['time'] as List<dynamic>,
      period_of_reservations: map['period_of_reservations'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomReservationModel.fromJson(String source) =>
      RoomReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoomReservationModel(id: $id, place: $place, room: $room, status: $status, number_of_seats: $number_of_seats, time: $time, period_of_reservations: $period_of_reservations)';
  }

  @override
  bool operator ==(covariant RoomReservationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.place == place &&
        other.room == room &&
        other.status == status &&
        other.number_of_seats == number_of_seats &&
        listEquals(other.time, time) &&
        other.period_of_reservations == period_of_reservations;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        place.hashCode ^
        room.hashCode ^
        status.hashCode ^
        number_of_seats.hashCode ^
        time.hashCode ^
        period_of_reservations.hashCode;
  }
}

class ReservationsModel extends BaseModel {
  List<RoomReservationModel> reservations;
  ReservationsModel({
    required this.reservations,
  });

  ReservationsModel copyWith({
    List<RoomReservationModel>? reservations,
  }) {
    return ReservationsModel(
      reservations: reservations ?? this.reservations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reservations': reservations.map((x) => x.toMap()).toList(),
    };
  }

  factory ReservationsModel.fromMap(List<dynamic> map) {
    return ReservationsModel(
        reservations: List.generate(
            map.length, (index) => RoomReservationModel.fromMap(map[index])));
  }

  String toJson() => json.encode(toMap());

  factory ReservationsModel.fromJson(String source) =>
      ReservationsModel.fromMap(json.decode(source) as List<dynamic>);

  @override
  String toString() => 'ReservationsModel(reservations: $reservations)';

  @override
  bool operator ==(covariant ReservationsModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.reservations, reservations);
  }

  @override
  int get hashCode => reservations.hashCode;
}

class ReserveRoomModel extends BaseModel {
  String time;
  int num_of_seats;
  int room_id;
  int period_of_reservations;
  ReserveRoomModel({
    required this.time,
    required this.num_of_seats,
    required this.room_id,
    required this.period_of_reservations,
  });

  ReserveRoomModel copyWith({
    String? time,
    int? num_of_seats,
    int? room_id,
    int? period_of_reservations,
  }) {
    return ReserveRoomModel(
      time: time ?? this.time,
      num_of_seats: num_of_seats ?? this.num_of_seats,
      room_id: room_id ?? this.room_id,
      period_of_reservations:
          period_of_reservations ?? this.period_of_reservations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'num_of_seats': num_of_seats,
      'room_id': room_id,
      'period_of_reservations': period_of_reservations,
    };
  }

  factory ReserveRoomModel.fromMap(Map<String, dynamic> map) {
    return ReserveRoomModel(
      time: map['time'] as String,
      num_of_seats: map['num_of_seats'] as int,
      room_id: map['room_id'] as int,
      period_of_reservations: map['period_of_reservations'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReserveRoomModel.fromJson(String source) =>
      ReserveRoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReserveRoomModel(time: $time, num_of_seats: $num_of_seats, room_id: $room_id, period_of_reservations: $period_of_reservations)';
  }

  @override
  bool operator ==(covariant ReserveRoomModel other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.num_of_seats == num_of_seats &&
        other.room_id == room_id &&
        other.period_of_reservations == period_of_reservations;
  }

  @override
  int get hashCode {
    return time.hashCode ^
        num_of_seats.hashCode ^
        room_id.hashCode ^
        period_of_reservations.hashCode;
  }
}

class TableReservationModel extends BaseModel {
  int id;
  PlaceModel place;
  TableModel table;
  int status;
  int? num_of_seats;
  List<dynamic> time;
  int period_of_reservations;
  TableReservationModel({
    required this.id,
    required this.place,
    required this.table,
    required this.status,
    this.num_of_seats,
    required this.time,
    required this.period_of_reservations,
  });

  TableReservationModel copyWith({
    int? id,
    PlaceModel? place,
    TableModel? table,
    int? status,
    int? num_of_seats,
    List<dynamic>? time,
    int? period_of_reservations,
  }) {
    return TableReservationModel(
      id: id ?? this.id,
      place: place ?? this.place,
      table: table ?? this.table,
      status: status ?? this.status,
      num_of_seats: num_of_seats ?? this.num_of_seats,
      time: time ?? this.time,
      period_of_reservations:
          period_of_reservations ?? this.period_of_reservations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'place': place.toMap(),
      'table': table.toMap(),
      'status': status,
      'num_of_seats': num_of_seats,
      'time': time,
      'period_of_reservations': period_of_reservations,
    };
  }

  factory TableReservationModel.fromMap(Map<String, dynamic> map) {
    return TableReservationModel(
      id: map['id'] as int,
      place: PlaceModel.fromMap(map['place'] as Map<String, dynamic>),
      table: TableModel.fromMap(map['table'] as Map<String, dynamic>),
      status: map['status'] as int,
      num_of_seats:
          map['num_of_seats'] != null ? map['num_of_seats'] as int : null,
      time: map['time'] as List<dynamic>,
      period_of_reservations: map['period_of_reservations'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TableReservationModel.fromJson(String source) =>
      TableReservationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TableReservationModel(id: $id, place: $place, table: $table, status: $status, num_of_seats: $num_of_seats, time: $time, period_of_reservations: $period_of_reservations)';
  }

  @override
  bool operator ==(covariant TableReservationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.place == place &&
        other.table == table &&
        other.status == status &&
        other.num_of_seats == num_of_seats &&
        listEquals(other.time, time) &&
        other.period_of_reservations == period_of_reservations;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        place.hashCode ^
        table.hashCode ^
        status.hashCode ^
        num_of_seats.hashCode ^
        time.hashCode ^
        period_of_reservations.hashCode;
  }
}

class TableReservationsModel extends BaseModel {
  List<TableReservationModel> tableReservations;
  TableReservationsModel({
    required this.tableReservations,
  });

  TableReservationsModel copyWith({
    List<TableReservationModel>? tableReservations,
  }) {
    return TableReservationsModel(
      tableReservations: tableReservations ?? this.tableReservations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tableReservations': tableReservations.map((x) => x.toMap()).toList(),
    };
  }

  factory TableReservationsModel.fromMap(List<dynamic> map) {
    return TableReservationsModel(
      tableReservations: List.generate(map.length, (index) => TableReservationModel.fromMap(map[index]))
    );
  }

  String toJson() => json.encode(toMap());

  factory TableReservationsModel.fromJson(String source) => TableReservationsModel.fromMap(json.decode(source) as List<dynamic>);

  @override
  String toString() => 'TableReservationsModel(tableReservations: $tableReservations)';

  @override
  bool operator ==(covariant TableReservationsModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.tableReservations, tableReservations);
  }

  @override
  int get hashCode => tableReservations.hashCode;
}

class ReserveTableModel extends BaseModel {
String time;
  int num_of_seats;
  int table_id;
  int period_of_reservations;
  ReserveTableModel({
    required this.time,
    required this.num_of_seats,
    required this.table_id,
    required this.period_of_reservations,
  });

  ReserveTableModel copyWith({
    String? time,
    int? num_of_seats,
    int? table_id,
    int? period_of_reservations,
  }) {
    return ReserveTableModel(
      time: time ?? this.time,
      num_of_seats: num_of_seats ?? this.num_of_seats,
      table_id: table_id ?? this.table_id,
      period_of_reservations: period_of_reservations ?? this.period_of_reservations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'num_of_seats': num_of_seats,
      'table_id': table_id,
      'period_of_reservations': period_of_reservations,
    };
  }

  factory ReserveTableModel.fromMap(Map<String, dynamic> map) {
    return ReserveTableModel(
      time: map['time'] as String,
      num_of_seats: map['num_of_seats'] as int,
      table_id: map['table_id'] as int,
      period_of_reservations: map['period_of_reservations'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReserveTableModel.fromJson(String source) => ReserveTableModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReserveTableModel(time: $time, num_of_seats: $num_of_seats, table_id: $table_id, period_of_reservations: $period_of_reservations)';
  }

  @override
  bool operator ==(covariant ReserveTableModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.time == time &&
      other.num_of_seats == num_of_seats &&
      other.table_id == table_id &&
      other.period_of_reservations == period_of_reservations;
  }

  @override
  int get hashCode {
    return time.hashCode ^
      num_of_seats.hashCode ^
      table_id.hashCode ^
      period_of_reservations.hashCode;
  }
}
