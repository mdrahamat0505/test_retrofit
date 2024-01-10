import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  int? code;
  String? message;
  Data? data;

  UserData({
    this.code,
    this.message,
    this.data,
  });

  UserData copyWith({
    int? code,
    String? message,
    Data? data,
  }) =>
      UserData(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Data {
  int? Id;
  String? Name;
  String? Email;
  String? Token;

  Data({
    this.Id,
    this.Name,
    this.Email,
    this.Token,
  });

  Data copyWith({
    int? Id,
    String? Name,
    String? Email,
    String? Token,
  }) =>
      Data(
        Id: Id ?? this.Id,
        Name: Name ?? this.Name,
        Email: Email ?? this.Email,
        Token: Token ?? this.Token,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
