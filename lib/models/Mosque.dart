/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Mosque type in your schema. */
@immutable
class Mosque extends Model {
  static const classType = const _MosqueModelType();
  final String id;
  final String mosque_name;
  final String about;
  final bool is_verified;
  final String sect;
  final String mosque_photos_list;
  final String mosque_facility_list;
  final String contact_description;
  final String phone;
  final String email;
  final String url;
  final String house_number;
  final String street;
  final String city;
  final String postcode;
  final String country;
  final List<Posts> Mosque_Posts;
  final List<MosquePhotos> Mosque_Photos;
  final List<MosqueUsers> Mosque_Users;
  final List<MosquePrayers> Mosque_Prayers;
  final List<MosqueFollowers> Mosque_Followers;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Mosque._internal(
      {@required this.id,
      @required this.mosque_name,
      this.about,
      this.is_verified,
      this.sect,
      this.mosque_photos_list,
      this.mosque_facility_list,
      this.contact_description,
      this.phone,
      this.email,
      this.url,
      this.house_number,
      this.street,
      this.city,
      this.postcode,
      this.country,
      this.Mosque_Posts,
      this.Mosque_Photos,
      this.Mosque_Users,
      this.Mosque_Prayers,
      this.Mosque_Followers});

  factory Mosque(
      {String id,
      @required String mosque_name,
      String about,
      bool is_verified,
      String sect,
      String mosque_photos_list,
      String mosque_facility_list,
      String contact_description,
      String phone,
      String email,
      String url,
      String house_number,
      String street,
      String city,
      String postcode,
      String country,
      List<Posts> Mosque_Posts,
      List<MosquePhotos> Mosque_Photos,
      List<MosqueUsers> Mosque_Users,
      List<MosquePrayers> Mosque_Prayers,
      List<MosqueFollowers> Mosque_Followers}) {
    return Mosque._internal(
        id: id == null ? UUID.getUUID() : id,
        mosque_name: mosque_name,
        about: about,
        is_verified: is_verified,
        sect: sect,
        mosque_photos_list: mosque_photos_list,
        mosque_facility_list: mosque_facility_list,
        contact_description: contact_description,
        phone: phone,
        email: email,
        url: url,
        house_number: house_number,
        street: street,
        city: city,
        postcode: postcode,
        country: country,
        Mosque_Posts: Mosque_Posts != null
            ? List.unmodifiable(Mosque_Posts)
            : Mosque_Posts,
        Mosque_Photos: Mosque_Photos != null
            ? List.unmodifiable(Mosque_Photos)
            : Mosque_Photos,
        Mosque_Users: Mosque_Users != null
            ? List.unmodifiable(Mosque_Users)
            : Mosque_Users,
        Mosque_Prayers: Mosque_Prayers != null
            ? List.unmodifiable(Mosque_Prayers)
            : Mosque_Prayers,
        Mosque_Followers: Mosque_Followers != null
            ? List.unmodifiable(Mosque_Followers)
            : Mosque_Followers);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mosque &&
        id == other.id &&
        mosque_name == other.mosque_name &&
        about == other.about &&
        is_verified == other.is_verified &&
        sect == other.sect &&
        mosque_photos_list == other.mosque_photos_list &&
        mosque_facility_list == other.mosque_facility_list &&
        contact_description == other.contact_description &&
        phone == other.phone &&
        email == other.email &&
        url == other.url &&
        house_number == other.house_number &&
        street == other.street &&
        city == other.city &&
        postcode == other.postcode &&
        country == other.country &&
        DeepCollectionEquality().equals(Mosque_Posts, other.Mosque_Posts) &&
        DeepCollectionEquality().equals(Mosque_Photos, other.Mosque_Photos) &&
        DeepCollectionEquality().equals(Mosque_Users, other.Mosque_Users) &&
        DeepCollectionEquality().equals(Mosque_Prayers, other.Mosque_Prayers) &&
        DeepCollectionEquality()
            .equals(Mosque_Followers, other.Mosque_Followers);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Mosque {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("mosque_name=" + "$mosque_name" + ", ");
    buffer.write("about=" + "$about" + ", ");
    buffer.write("is_verified=" +
        (is_verified != null ? is_verified.toString() : "null") +
        ", ");
    buffer.write("sect=" + "$sect" + ", ");
    buffer.write("mosque_photos_list=" + "$mosque_photos_list" + ", ");
    buffer.write("mosque_facility_list=" + "$mosque_facility_list" + ", ");
    buffer.write("contact_description=" + "$contact_description" + ", ");
    buffer.write("phone=" + "$phone" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("url=" + "$url" + ", ");
    buffer.write("house_number=" + "$house_number" + ", ");
    buffer.write("street=" + "$street" + ", ");
    buffer.write("city=" + "$city" + ", ");
    buffer.write("postcode=" + "$postcode" + ", ");
    buffer.write("country=" + "$country");
    buffer.write("}");

    return buffer.toString();
  }

  Mosque copyWith(
      {String id,
      String mosque_name,
      String about,
      bool is_verified,
      String sect,
      String mosque_photos_list,
      String mosque_facility_list,
      String contact_description,
      String phone,
      String email,
      String url,
      String house_number,
      String street,
      String city,
      String postcode,
      String country,
      List<Posts> Mosque_Posts,
      List<MosquePhotos> Mosque_Photos,
      List<MosqueUsers> Mosque_Users,
      List<MosquePrayers> Mosque_Prayers,
      List<MosqueFollowers> Mosque_Followers}) {
    return Mosque(
        id: id ?? this.id,
        mosque_name: mosque_name ?? this.mosque_name,
        about: about ?? this.about,
        is_verified: is_verified ?? this.is_verified,
        sect: sect ?? this.sect,
        mosque_photos_list: mosque_photos_list ?? this.mosque_photos_list,
        mosque_facility_list: mosque_facility_list ?? this.mosque_facility_list,
        contact_description: contact_description ?? this.contact_description,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        url: url ?? this.url,
        house_number: house_number ?? this.house_number,
        street: street ?? this.street,
        city: city ?? this.city,
        postcode: postcode ?? this.postcode,
        country: country ?? this.country,
        Mosque_Posts: Mosque_Posts ?? this.Mosque_Posts,
        Mosque_Photos: Mosque_Photos ?? this.Mosque_Photos,
        Mosque_Users: Mosque_Users ?? this.Mosque_Users,
        Mosque_Prayers: Mosque_Prayers ?? this.Mosque_Prayers,
        Mosque_Followers: Mosque_Followers ?? this.Mosque_Followers);
  }

  Mosque.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mosque_name = json['mosque_name'],
        about = json['about'],
        is_verified = json['is_verified'],
        sect = json['sect'],
        mosque_photos_list = json['mosque_photos_list'],
        mosque_facility_list = json['mosque_facility_list'],
        contact_description = json['contact_description'],
        phone = json['phone'],
        email = json['email'],
        url = json['url'],
        house_number = json['house_number'],
        street = json['street'],
        city = json['city'],
        postcode = json['postcode'],
        country = json['country'],
        Mosque_Posts = json['Mosque_Posts'] is List
            ? (json['Mosque_Posts'] as List)
                .map((e) => Posts.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        Mosque_Photos = json['Mosque_Photos'] is List
            ? (json['Mosque_Photos'] as List)
                .map((e) =>
                    MosquePhotos.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        Mosque_Users = json['Mosque_Users'] is List
            ? (json['Mosque_Users'] as List)
                .map((e) =>
                    MosqueUsers.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        Mosque_Prayers = json['Mosque_Prayers'] is List
            ? (json['Mosque_Prayers'] as List)
                .map((e) =>
                    MosquePrayers.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        Mosque_Followers = json['Mosque_Followers'] is List
            ? (json['Mosque_Followers'] as List)
                .map((e) =>
                    MosqueFollowers.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'mosque_name': mosque_name,
        'about': about,
        'is_verified': is_verified,
        'sect': sect,
        'mosque_photos_list': mosque_photos_list,
        'mosque_facility_list': mosque_facility_list,
        'contact_description': contact_description,
        'phone': phone,
        'email': email,
        'url': url,
        'house_number': house_number,
        'street': street,
        'city': city,
        'postcode': postcode,
        'country': country,
        'Mosque_Posts': Mosque_Posts?.map((e) => e?.toJson())?.toList(),
        'Mosque_Photos': Mosque_Photos?.map((e) => e?.toJson())?.toList(),
        'Mosque_Users': Mosque_Users?.map((e) => e?.toJson())?.toList(),
        'Mosque_Prayers': Mosque_Prayers?.map((e) => e?.toJson())?.toList(),
        'Mosque_Followers': Mosque_Followers?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "mosque.id");
  static final QueryField MOSQUE_NAME = QueryField(fieldName: "mosque_name");
  static final QueryField ABOUT = QueryField(fieldName: "about");
  static final QueryField IS_VERIFIED = QueryField(fieldName: "is_verified");
  static final QueryField SECT = QueryField(fieldName: "sect");
  static final QueryField MOSQUE_PHOTOS_LIST =
      QueryField(fieldName: "mosque_photos_list");
  static final QueryField MOSQUE_FACILITY_LIST =
      QueryField(fieldName: "mosque_facility_list");
  static final QueryField CONTACT_DESCRIPTION =
      QueryField(fieldName: "contact_description");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField URL = QueryField(fieldName: "url");
  static final QueryField HOUSE_NUMBER = QueryField(fieldName: "house_number");
  static final QueryField STREET = QueryField(fieldName: "street");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField POSTCODE = QueryField(fieldName: "postcode");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField MOSQUE_POSTS = QueryField(
      fieldName: "Mosque_Posts",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Posts).toString()));
  static final QueryField MOSQUE_PHOTOS = QueryField(
      fieldName: "Mosque_Photos",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (MosquePhotos).toString()));
  static final QueryField MOSQUE_USERS = QueryField(
      fieldName: "Mosque_Users",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (MosqueUsers).toString()));
  static final QueryField MOSQUE_PRAYERS = QueryField(
      fieldName: "Mosque_Prayers",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (MosquePrayers).toString()));
  static final QueryField MOSQUE_FOLLOWERS = QueryField(
      fieldName: "Mosque_Followers",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (MosqueFollowers).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Mosque";
    modelSchemaDefinition.pluralName = "Mosques";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.MOSQUE_NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.ABOUT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.IS_VERIFIED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.SECT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.MOSQUE_PHOTOS_LIST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.MOSQUE_FACILITY_LIST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.CONTACT_DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.PHONE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.URL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.HOUSE_NUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.STREET,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.CITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.POSTCODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.COUNTRY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Mosque.MOSQUE_POSTS,
        isRequired: false,
        ofModelName: (Posts).toString(),
        associatedKey: Posts.MOSQUESID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Mosque.MOSQUE_PHOTOS,
        isRequired: false,
        ofModelName: (MosquePhotos).toString(),
        associatedKey: MosquePhotos.MOSQUEID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Mosque.MOSQUE_USERS,
        isRequired: false,
        ofModelName: (MosqueUsers).toString(),
        associatedKey: MosqueUsers.MOSQUEID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Mosque.MOSQUE_PRAYERS,
        isRequired: false,
        ofModelName: (MosquePrayers).toString(),
        associatedKey: MosquePrayers.MOSQUEID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Mosque.MOSQUE_FOLLOWERS,
        isRequired: false,
        ofModelName: (MosqueFollowers).toString(),
        associatedKey: MosqueFollowers.MOSQUEID));
  });
}

class _MosqueModelType extends ModelType<Mosque> {
  const _MosqueModelType();

  @override
  Mosque fromJson(Map<String, dynamic> jsonData) {
    return Mosque.fromJson(jsonData);
  }
}
