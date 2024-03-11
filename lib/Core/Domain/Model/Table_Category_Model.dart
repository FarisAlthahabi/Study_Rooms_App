// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_reservations/Core/Domain/Model/Base_model.dart';

class TableCategoryModel extends BaseModel {
  int id;
  List<dynamic> tables;
  String? Shape;
  int num_of_seats = 4;
  TableCategoryModel({
    required this.id,
    required this.tables,
    required this.Shape,
    required this.num_of_seats,
  });

  TableCategoryModel copyWith({
    int? id,
    List<dynamic>? tables,
    String? Shape,
    int? num_of_seats,
  }) {
    return TableCategoryModel(
      id: id ?? this.id,
      tables: tables ?? this.tables,
      Shape: Shape ?? this.Shape,
      num_of_seats: num_of_seats ?? this.num_of_seats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tables': tables,
      'Shape': Shape,
      'num_of_seats': num_of_seats,
    };
  }

  factory TableCategoryModel.fromMap(Map<String, dynamic> map) {
    return TableCategoryModel(
      id: map['id'] as int,
      tables: map['tables'] as List<dynamic>,
      Shape: map['Shape'] as String?,
      num_of_seats: map['num_of_seats'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TableCategoryModel.fromJson(String source) =>
      TableCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TableCategoryModel(id: $id, tables: $tables, Shape: $Shape, num_of_seats: $num_of_seats)';
  }

  @override
  bool operator ==(covariant TableCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.tables, tables) &&
        other.Shape == Shape &&
        other.num_of_seats == num_of_seats;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tables.hashCode ^
        Shape.hashCode ^
        num_of_seats.hashCode;
  }
}

class TableCategoriesModel extends BaseModel {
  List<TableCategoryModel> TableCategories;
  TableCategoriesModel({
    required this.TableCategories,
  });

  TableCategoriesModel copyWith({
    List<TableCategoryModel>? TableCategories,
  }) {
    return TableCategoriesModel(
      TableCategories: TableCategories ?? this.TableCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TableCategories': TableCategories.map((x) => x.toMap()).toList(),
    };
  }

  factory TableCategoriesModel.fromMap(List<dynamic> map) {
    return TableCategoriesModel(
      TableCategories: List.generate(map.length, (index) => TableCategoryModel.fromMap(map[index]))
    );
  }

  String toJson() => json.encode(toMap());

  factory TableCategoriesModel.fromJson(String source) => TableCategoriesModel.fromMap(json.decode(source) as List<dynamic>);

  @override
  String toString() => 'TableCategoriesModel(TableCategories: $TableCategories)';

  @override
  bool operator ==(covariant TableCategoriesModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.TableCategories, TableCategories);
  }

  @override
  int get hashCode => TableCategories.hashCode;
}
