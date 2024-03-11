// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BaseModel {}


class DeleteResultModel extends BaseModel {
  dynamic DeleteResult;
  DeleteResultModel({
    required this.DeleteResult,
  });

  DeleteResultModel copyWith({
    dynamic? DeleteResult,
  }) {
    return DeleteResultModel(
      DeleteResult: DeleteResult ?? this.DeleteResult,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'DeleteResult': DeleteResult,
    };
  }

  factory DeleteResultModel.fromMap(Map<String, dynamic> map) {
    return DeleteResultModel(
      DeleteResult: map['DeleteResult'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteResultModel.fromJson(String source) => DeleteResultModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeleteResultModel(DeleteResult: $DeleteResult)';

  @override
  bool operator ==(covariant DeleteResultModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.DeleteResult == DeleteResult;
  }

  @override
  int get hashCode => DeleteResult.hashCode;
}
