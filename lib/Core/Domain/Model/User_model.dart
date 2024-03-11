// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_reservations/Core/Domain/Model/Base_model.dart';

class UserModel extends BaseModel {
  String UserName;
  String role;
  num phoneNumber;
  String password;
  UserModel({
    required this.UserName,
    required this.role,
    required this.phoneNumber,
    required this.password,
  });


  UserModel copyWith({
    String? UserName,
    String? role,
    num? phoneNumber,
    String? password,
  }) {
    return UserModel(
      UserName: UserName ?? this.UserName,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'UserName': UserName,
      'role': role,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      UserName: map['UserName'] as String,
      role: map['role'] as String,
      phoneNumber: map['phoneNumber'] as num,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(UserName: $UserName, role: $role, phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.UserName == UserName &&
      other.role == role &&
      other.phoneNumber == phoneNumber &&
      other.password == password;
  }

  @override
  int get hashCode {
    return UserName.hashCode ^
      role.hashCode ^
      phoneNumber.hashCode ^
      password.hashCode;
  }
}
