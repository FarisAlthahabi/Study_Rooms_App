// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_reservations/Core/Domain/Model/Base_model.dart';

class PlaceModel extends BaseModel {
  num id;
  String name;
  String location;
  List<dynamic> rooms;
  List<dynamic> tableCategories;

  PlaceModel({
    required this.id,
    required this.name,
    required this.location,
    required this.rooms,
    required this.tableCategories,
  });

  PlaceModel copyWith({
    num? id,
    String? name,
    String? location,
    List<dynamic>? rooms,
    List<dynamic>? tableCategories,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      rooms: rooms ?? this.rooms,
      tableCategories: tableCategories ?? this.tableCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location,
      'rooms': rooms,
      'tableCategories': tableCategories,
    };
  }

  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
      id: map['id'] as num,
      name: map['name'] as String,
      location: map['location'] as String,
      rooms: map['rooms'] as List<dynamic>,
      tableCategories: map['tableCategories'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceModel.fromJson(String source) =>
      PlaceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlaceModel(id: $id, name: $name, location: $location, rooms: $rooms, tableCategories: $tableCategories)';
  }

  @override
  bool operator ==(covariant PlaceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.location == location &&
        listEquals(other.rooms, rooms) &&
        listEquals(other.tableCategories, tableCategories);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        location.hashCode ^
        rooms.hashCode ^
        tableCategories.hashCode;
  }
}

class PlacesModel extends BaseModel {
  List<PlaceModel> places;
  PlacesModel({
    required this.places,
  });

  PlacesModel copyWith({
    List<PlaceModel>? places,
  }) {
    return PlacesModel(
      places: places ?? this.places,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'places': places.map((x) => x.toMap()).toList(),
    };
  }

  factory PlacesModel.fromMap(List<dynamic> map) {
    return PlacesModel(
      places: List.generate(map.length, (index) => PlaceModel.fromMap(map[index])),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlacesModel.fromJson(String source) => PlacesModel.fromMap(json.decode(source) as List<dynamic>);

  @override
  String toString() => 'PlacesModel(places: $places)';

  @override
  bool operator ==(covariant PlacesModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.places, places);
  }

  @override
  int get hashCode => places.hashCode;
}
