// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUserData _$AllUserDataFromJson(Map<String, dynamic> json) => AllUserData(
      page: json['page'] as int?,
      perPage: json['perPage'] as int?,
      totalrecord: json['totalrecord'] as int?,
      totalPages: json['totalPages'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllUserDataToJson(AllUserData instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'totalrecord': instance.totalrecord,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profilepicture: json['profilepicture'] as String?,
      location: json['location'] as String?,
      createdat: json['createdat'] == null
          ? null
          : DateTime.parse(json['createdat'] as String),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profilepicture': instance.profilepicture,
      'location': instance.location,
      'createdat': instance.createdat?.toIso8601String(),
    };
