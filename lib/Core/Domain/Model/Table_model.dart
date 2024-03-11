// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_reservations/Core/Domain/Model/Base_model.dart';

class TableModel extends BaseModel {
  int id;
  int? available_seats;
  int? status;
  TableModel({
    required this.id,
    required this.available_seats,
    required this.status,
  });

  TableModel copyWith({
    int? id,
    int? available_seats,
    int? status,
  }) {
    return TableModel(
      id: id ?? this.id,
      available_seats: available_seats ?? this.available_seats,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'available_seats': available_seats,
      'status': status,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      id: map['id'] as int,
      available_seats: map['available_seats'] as int?,
      status: map['status'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory TableModel.fromJson(String source) =>
      TableModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TableModel(id: $id, available_seats: $available_seats, status: $status)';

  @override
  bool operator ==(covariant TableModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.available_seats == available_seats &&
        other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ available_seats.hashCode ^ status.hashCode;
}

class TablesModel extends BaseModel {
  List<TableModel> tables;
  TablesModel({
    required this.tables,
  });

  TablesModel copyWith({
    List<TableModel>? tables,
  }) {
    return TablesModel(
      tables: tables ?? this.tables,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tables': tables.map((x) => x.toMap()).toList(),
    };
  }

  factory TablesModel.fromMap(List<dynamic> map) {
    return TablesModel(
      tables: List.generate(map.length, (index) => TableModel.fromMap(map[index]))
    );
  }

  String toJson() => json.encode(toMap());

  factory TablesModel.fromJson(String source) => TablesModel.fromMap(json.decode(source) as List<dynamic>);

  @override
  String toString() => 'TablesModel(tables: $tables)';

  @override
  bool operator ==(covariant TablesModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.tables, tables);
  }

  @override
  int get hashCode => tables.hashCode;
}
