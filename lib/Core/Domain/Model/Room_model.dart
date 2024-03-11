// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:my_reservations/Core/Domain/Model/Base_model.dart';

class RoomModel extends BaseModel {
  num id;
  int max_num_of_chairs;
  int status;
  RoomModel({
    required this.id,
    required this.max_num_of_chairs,
    required this.status,
  });

  RoomModel copyWith({
    num? id,
    int? max_num_of_chairs,
    int? status,
  }) {
    return RoomModel(
      id: id ?? this.id,
      max_num_of_chairs: max_num_of_chairs ?? this.max_num_of_chairs,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'max_num_of_chairs': max_num_of_chairs,
      'status': status,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      id: map['id'] as num,
      max_num_of_chairs: map['max_num_of_chairs'] as int,
      status: map['status'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RoomModel(id: $id, max_num_of_chairs: $max_num_of_chairs, status: $status)';

  @override
  bool operator ==(covariant RoomModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.max_num_of_chairs == max_num_of_chairs &&
        other.status == status;
  }

  @override
  int get hashCode =>
      id.hashCode ^ max_num_of_chairs.hashCode ^ status.hashCode;
}

class RoomsModel extends BaseModel {
  List<RoomModel> rooms;
  RoomsModel({
    required this.rooms,
  });

  RoomsModel copyWith({
    List<RoomModel>? rooms,
  }) {
    return RoomsModel(
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rooms': rooms.map((x) => x.toMap()).toList(),
    };
  }

  factory RoomsModel.fromMap(List<dynamic> map) {
    return RoomsModel(
      rooms: List.generate(map.length, (index) => RoomModel.fromMap(map[index]))
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomsModel.fromJson(String source) => RoomsModel.fromMap(json.decode(source) as List<dynamic>);

  @override
  String toString() => 'RoomsModel(rooms: $rooms)';

  @override
  bool operator ==(covariant RoomsModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.rooms, rooms);
  }

  @override
  int get hashCode => rooms.hashCode;
}
