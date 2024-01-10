import 'package:json_annotation/json_annotation.dart';
part 'all_user_data.g.dart';


@JsonSerializable()
class AllUserData {
  int? page;
  int? perPage;
  int? totalrecord;
  int? totalPages;
  List<Datum>? data;

  AllUserData({
    this.page,
    this.perPage,
    this.totalrecord,
    this.totalPages,
    this.data,
  });

  AllUserData copyWith({
    int? page,
    int? perPage,
    int? totalrecord,
    int? totalPages,
    List<Datum>? data,
  }) =>
      AllUserData(
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        totalrecord: totalrecord ?? this.totalrecord,
        totalPages: totalPages ?? this.totalPages,
        data: data ?? this.data,
      );

  factory AllUserData.fromJson(Map<String, dynamic> json) =>
      _$AllUserDataFromJson(json);
  Map<String, dynamic> toJson() => _$AllUserDataToJson(this);
}

@JsonSerializable()
class Datum {
  int? id;
  String? name;
  String? email;
  String? profilepicture;
  String? location;
  DateTime? createdat;

  Datum({
    this.id,
    this.name,
    this.email,
    this.profilepicture,
    this.location,
    this.createdat,
  });

  Datum copyWith({
    int? id,
    String? name,
    String? email,
    String? profilepicture,
    String? location,
    DateTime? createdat,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        profilepicture: profilepicture ?? this.profilepicture,
        location: location ?? this.location,
        createdat: createdat ?? this.createdat,
      );

  factory Datum.fromJson(Map<String, dynamic> json) =>
      _$DatumFromJson(json);
  Map<String, dynamic> toJson() => _$DatumToJson(this);
}