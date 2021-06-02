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

/** This is an auto generated class representing the Users type in your schema. */
@immutable
class Users extends Model {
  static const classType = const _UsersModelType();
  final String id;
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String phone;
  final String age;
  final String gender;
  final String parent_email;
  final String house_number;
  final String street;
  final String city;
  final String postcode;
  final String country;
  final String latitude;
  final String longitude;
  final bool parent_consent_form_agree;
  final bool terms_privacy_policy_agree;
  final bool community_promise_agree;
  final bool email_verification;
  final bool phone_verification;
  final bool parent_verification;
  final bool address_verification;
  final bool photo_verification;
  final TemporalDate joined_date;
  final bool active_status;
  final List<Posts> User_Posts;
  final List<PostComments> User_Comments;
  final List<PostLikes> User_PostLikes;
  final List<MosqueFollowers> User_MosqueFollowers;
  final List<Friends> User_Friends;
  final List<UserPhotos> User_Photos;
  final List<UserEducation> User_Educations;
  final List<UserProfile> User_Profiles;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Users._internal(
      {@required this.id,
      @required this.first_name,
      @required this.last_name,
      @required this.email,
      @required this.password,
      this.phone,
      this.age,
      this.gender,
      this.parent_email,
      this.house_number,
      this.street,
      this.city,
      this.postcode,
      this.country,
      this.latitude,
      this.longitude,
      this.parent_consent_form_agree,
      this.terms_privacy_policy_agree,
      this.community_promise_agree,
      this.email_verification,
      this.phone_verification,
      this.parent_verification,
      this.address_verification,
      this.photo_verification,
      this.joined_date,
      this.active_status,
      this.User_Posts,
      this.User_Comments,
      this.User_PostLikes,
      this.User_MosqueFollowers,
      this.User_Friends,
      this.User_Photos,
      this.User_Educations,
      this.User_Profiles});

  factory Users(
      {String id,
      @required String first_name,
      @required String last_name,
      @required String email,
      @required String password,
      String phone,
      String age,
      String gender,
      String parent_email,
      String house_number,
      String street,
      String city,
      String postcode,
      String country,
      String latitude,
      String longitude,
      bool parent_consent_form_agree,
      bool terms_privacy_policy_agree,
      bool community_promise_agree,
      bool email_verification,
      bool phone_verification,
      bool parent_verification,
      bool address_verification,
      bool photo_verification,
      TemporalDate joined_date,
      bool active_status,
      List<Posts> User_Posts,
      List<PostComments> User_Comments,
      List<PostLikes> User_PostLikes,
      List<MosqueFollowers> User_MosqueFollowers,
      List<Friends> User_Friends,
      List<UserPhotos> User_Photos,
      List<UserEducation> User_Educations,
      List<UserProfile> User_Profiles}) {
    return Users._internal(
        id: id == null ? UUID.getUUID() : id,
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: password,
        phone: phone,
        age: age,
        gender: gender,
        parent_email: parent_email,
        house_number: house_number,
        street: street,
        city: city,
        postcode: postcode,
        country: country,
        latitude: latitude,
        longitude: longitude,
        parent_consent_form_agree: parent_consent_form_agree,
        terms_privacy_policy_agree: terms_privacy_policy_agree,
        community_promise_agree: community_promise_agree,
        email_verification: email_verification,
        phone_verification: phone_verification,
        parent_verification: parent_verification,
        address_verification: address_verification,
        photo_verification: photo_verification,
        joined_date: joined_date,
        active_status: active_status,
        User_Posts:
            User_Posts != null ? List.unmodifiable(User_Posts) : User_Posts,
        User_Comments: User_Comments != null
            ? List.unmodifiable(User_Comments)
            : User_Comments,
        User_PostLikes: User_PostLikes != null
            ? List.unmodifiable(User_PostLikes)
            : User_PostLikes,
        User_MosqueFollowers: User_MosqueFollowers != null
            ? List.unmodifiable(User_MosqueFollowers)
            : User_MosqueFollowers,
        User_Friends: User_Friends != null
            ? List.unmodifiable(User_Friends)
            : User_Friends,
        User_Photos:
            User_Photos != null ? List.unmodifiable(User_Photos) : User_Photos,
        User_Educations: User_Educations != null
            ? List.unmodifiable(User_Educations)
            : User_Educations,
        User_Profiles: User_Profiles != null
            ? List.unmodifiable(User_Profiles)
            : User_Profiles);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Users &&
        id == other.id &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        email == other.email &&
        password == other.password &&
        phone == other.phone &&
        age == other.age &&
        gender == other.gender &&
        parent_email == other.parent_email &&
        house_number == other.house_number &&
        street == other.street &&
        city == other.city &&
        postcode == other.postcode &&
        country == other.country &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        parent_consent_form_agree == other.parent_consent_form_agree &&
        terms_privacy_policy_agree == other.terms_privacy_policy_agree &&
        community_promise_agree == other.community_promise_agree &&
        email_verification == other.email_verification &&
        phone_verification == other.phone_verification &&
        parent_verification == other.parent_verification &&
        address_verification == other.address_verification &&
        photo_verification == other.photo_verification &&
        joined_date == other.joined_date &&
        active_status == other.active_status &&
        DeepCollectionEquality().equals(User_Posts, other.User_Posts) &&
        DeepCollectionEquality().equals(User_Comments, other.User_Comments) &&
        DeepCollectionEquality().equals(User_PostLikes, other.User_PostLikes) &&
        DeepCollectionEquality()
            .equals(User_MosqueFollowers, other.User_MosqueFollowers) &&
        DeepCollectionEquality().equals(User_Friends, other.User_Friends) &&
        DeepCollectionEquality().equals(User_Photos, other.User_Photos) &&
        DeepCollectionEquality()
            .equals(User_Educations, other.User_Educations) &&
        DeepCollectionEquality().equals(User_Profiles, other.User_Profiles);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Users {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("first_name=" + "$first_name" + ", ");
    buffer.write("last_name=" + "$last_name" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("password=" + "$password" + ", ");
    buffer.write("phone=" + "$phone" + ", ");
    buffer.write("age=" + "$age" + ", ");
    buffer.write("gender=" + "$gender" + ", ");
    buffer.write("parent_email=" + "$parent_email" + ", ");
    buffer.write("house_number=" + "$house_number" + ", ");
    buffer.write("street=" + "$street" + ", ");
    buffer.write("city=" + "$city" + ", ");
    buffer.write("postcode=" + "$postcode" + ", ");
    buffer.write("country=" + "$country" + ", ");
    buffer.write("latitude=" + "$latitude" + ", ");
    buffer.write("longitude=" + "$longitude" + ", ");
    buffer.write("parent_consent_form_agree=" +
        (parent_consent_form_agree != null
            ? parent_consent_form_agree.toString()
            : "null") +
        ", ");
    buffer.write("terms_privacy_policy_agree=" +
        (terms_privacy_policy_agree != null
            ? terms_privacy_policy_agree.toString()
            : "null") +
        ", ");
    buffer.write("community_promise_agree=" +
        (community_promise_agree != null
            ? community_promise_agree.toString()
            : "null") +
        ", ");
    buffer.write("email_verification=" +
        (email_verification != null ? email_verification.toString() : "null") +
        ", ");
    buffer.write("phone_verification=" +
        (phone_verification != null ? phone_verification.toString() : "null") +
        ", ");
    buffer.write("parent_verification=" +
        (parent_verification != null
            ? parent_verification.toString()
            : "null") +
        ", ");
    buffer.write("address_verification=" +
        (address_verification != null
            ? address_verification.toString()
            : "null") +
        ", ");
    buffer.write("photo_verification=" +
        (photo_verification != null ? photo_verification.toString() : "null") +
        ", ");
    buffer.write("joined_date=" +
        (joined_date != null ? joined_date.format() : "null") +
        ", ");
    buffer.write("active_status=" +
        (active_status != null ? active_status.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Users copyWith(
      {String id,
      String first_name,
      String last_name,
      String email,
      String password,
      String phone,
      String age,
      String gender,
      String parent_email,
      String house_number,
      String street,
      String city,
      String postcode,
      String country,
      String latitude,
      String longitude,
      bool parent_consent_form_agree,
      bool terms_privacy_policy_agree,
      bool community_promise_agree,
      bool email_verification,
      bool phone_verification,
      bool parent_verification,
      bool address_verification,
      bool photo_verification,
      TemporalDate joined_date,
      bool active_status,
      List<Posts> User_Posts,
      List<PostComments> User_Comments,
      List<PostLikes> User_PostLikes,
      List<MosqueFollowers> User_MosqueFollowers,
      List<Friends> User_Friends,
      List<UserPhotos> User_Photos,
      List<UserEducation> User_Educations,
      List<UserProfile> User_Profiles}) {
    return Users(
        id: id ?? this.id,
        first_name: first_name ?? this.first_name,
        last_name: last_name ?? this.last_name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        parent_email: parent_email ?? this.parent_email,
        house_number: house_number ?? this.house_number,
        street: street ?? this.street,
        city: city ?? this.city,
        postcode: postcode ?? this.postcode,
        country: country ?? this.country,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        parent_consent_form_agree:
            parent_consent_form_agree ?? this.parent_consent_form_agree,
        terms_privacy_policy_agree:
            terms_privacy_policy_agree ?? this.terms_privacy_policy_agree,
        community_promise_agree:
            community_promise_agree ?? this.community_promise_agree,
        email_verification: email_verification ?? this.email_verification,
        phone_verification: phone_verification ?? this.phone_verification,
        parent_verification: parent_verification ?? this.parent_verification,
        address_verification: address_verification ?? this.address_verification,
        photo_verification: photo_verification ?? this.photo_verification,
        joined_date: joined_date ?? this.joined_date,
        active_status: active_status ?? this.active_status,
        User_Posts: User_Posts ?? this.User_Posts,
        User_Comments: User_Comments ?? this.User_Comments,
        User_PostLikes: User_PostLikes ?? this.User_PostLikes,
        User_MosqueFollowers: User_MosqueFollowers ?? this.User_MosqueFollowers,
        User_Friends: User_Friends ?? this.User_Friends,
        User_Photos: User_Photos ?? this.User_Photos,
        User_Educations: User_Educations ?? this.User_Educations,
        User_Profiles: User_Profiles ?? this.User_Profiles);
  }

  Users.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        first_name = json['first_name'],
        last_name = json['last_name'],
        email = json['email'],
        password = json['password'],
        phone = json['phone'],
        age = json['age'],
        gender = json['gender'],
        parent_email = json['parent_email'],
        house_number = json['house_number'],
        street = json['street'],
        city = json['city'],
        postcode = json['postcode'],
        country = json['country'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        parent_consent_form_agree = json['parent_consent_form_agree'],
        terms_privacy_policy_agree = json['terms_privacy_policy_agree'],
        community_promise_agree = json['community_promise_agree'],
        email_verification = json['email_verification'],
        phone_verification = json['phone_verification'],
        parent_verification = json['parent_verification'],
        address_verification = json['address_verification'],
        photo_verification = json['photo_verification'],
        joined_date = json['joined_date'] != null
            ? TemporalDate.fromString(json['joined_date'])
            : null,
        active_status = json['active_status'],
        User_Posts = json['User_Posts'] is List
            ? (json['User_Posts'] as List)
                .map((e) => Posts.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        User_Comments = json['User_Comments'] is List
            ? (json['User_Comments'] as List)
                .map((e) =>
                    PostComments.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        User_PostLikes = json['User_PostLikes'] is List
            ? (json['User_PostLikes'] as List)
                .map(
                    (e) => PostLikes.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        User_MosqueFollowers = json['User_MosqueFollowers'] is List
            ? (json['User_MosqueFollowers'] as List)
                .map((e) =>
                    MosqueFollowers.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        User_Friends = json['User_Friends'] is List
            ? (json['User_Friends'] as List)
                .map((e) => Friends.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        User_Photos = json['User_Photos'] is List
            ? (json['User_Photos'] as List)
                .map((e) =>
                    UserPhotos.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        User_Educations = json['User_Educations'] is List
            ? (json['User_Educations'] as List)
                .map((e) =>
                    UserEducation.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        User_Profiles = json['User_Profiles'] is List
            ? (json['User_Profiles'] as List)
                .map((e) =>
                    UserProfile.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'password': password,
        'phone': phone,
        'age': age,
        'gender': gender,
        'parent_email': parent_email,
        'house_number': house_number,
        'street': street,
        'city': city,
        'postcode': postcode,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
        'parent_consent_form_agree': parent_consent_form_agree,
        'terms_privacy_policy_agree': terms_privacy_policy_agree,
        'community_promise_agree': community_promise_agree,
        'email_verification': email_verification,
        'phone_verification': phone_verification,
        'parent_verification': parent_verification,
        'address_verification': address_verification,
        'photo_verification': photo_verification,
        'joined_date': joined_date?.format(),
        'active_status': active_status,
        'User_Posts': User_Posts?.map((e) => e?.toJson())?.toList(),
        'User_Comments': User_Comments?.map((e) => e?.toJson())?.toList(),
        'User_PostLikes': User_PostLikes?.map((e) => e?.toJson())?.toList(),
        'User_MosqueFollowers':
            User_MosqueFollowers?.map((e) => e?.toJson())?.toList(),
        'User_Friends': User_Friends?.map((e) => e?.toJson())?.toList(),
        'User_Photos': User_Photos?.map((e) => e?.toJson())?.toList(),
        'User_Educations': User_Educations?.map((e) => e?.toJson())?.toList(),
        'User_Profiles': User_Profiles?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "users.id");
  static final QueryField FIRST_NAME = QueryField(fieldName: "first_name");
  static final QueryField LAST_NAME = QueryField(fieldName: "last_name");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField PASSWORD = QueryField(fieldName: "password");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField AGE = QueryField(fieldName: "age");
  static final QueryField GENDER = QueryField(fieldName: "gender");
  static final QueryField PARENT_EMAIL = QueryField(fieldName: "parent_email");
  static final QueryField HOUSE_NUMBER = QueryField(fieldName: "house_number");
  static final QueryField STREET = QueryField(fieldName: "street");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField POSTCODE = QueryField(fieldName: "postcode");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField LATITUDE = QueryField(fieldName: "latitude");
  static final QueryField LONGITUDE = QueryField(fieldName: "longitude");
  static final QueryField PARENT_CONSENT_FORM_AGREE =
      QueryField(fieldName: "parent_consent_form_agree");
  static final QueryField TERMS_PRIVACY_POLICY_AGREE =
      QueryField(fieldName: "terms_privacy_policy_agree");
  static final QueryField COMMUNITY_PROMISE_AGREE =
      QueryField(fieldName: "community_promise_agree");
  static final QueryField EMAIL_VERIFICATION =
      QueryField(fieldName: "email_verification");
  static final QueryField PHONE_VERIFICATION =
      QueryField(fieldName: "phone_verification");
  static final QueryField PARENT_VERIFICATION =
      QueryField(fieldName: "parent_verification");
  static final QueryField ADDRESS_VERIFICATION =
      QueryField(fieldName: "address_verification");
  static final QueryField PHOTO_VERIFICATION =
      QueryField(fieldName: "photo_verification");
  static final QueryField JOINED_DATE = QueryField(fieldName: "joined_date");
  static final QueryField ACTIVE_STATUS =
      QueryField(fieldName: "active_status");
  static final QueryField USER_POSTS = QueryField(
      fieldName: "User_Posts",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Posts).toString()));
  static final QueryField USER_COMMENTS = QueryField(
      fieldName: "User_Comments",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (PostComments).toString()));
  static final QueryField USER_POSTLIKES = QueryField(
      fieldName: "User_PostLikes",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (PostLikes).toString()));
  static final QueryField USER_MOSQUEFOLLOWERS = QueryField(
      fieldName: "User_MosqueFollowers",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (MosqueFollowers).toString()));
  static final QueryField USER_FRIENDS = QueryField(
      fieldName: "User_Friends",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Friends).toString()));
  static final QueryField USER_PHOTOS = QueryField(
      fieldName: "User_Photos",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserPhotos).toString()));
  static final QueryField USER_EDUCATIONS = QueryField(
      fieldName: "User_Educations",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserEducation).toString()));
  static final QueryField USER_PROFILES = QueryField(
      fieldName: "User_Profiles",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserProfile).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Users";
    modelSchemaDefinition.pluralName = "Users";

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
        key: Users.FIRST_NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.LAST_NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.EMAIL,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.PASSWORD,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.PHONE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.AGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.GENDER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.PARENT_EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.HOUSE_NUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.STREET,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.CITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.POSTCODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.COUNTRY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.LATITUDE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.LONGITUDE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.PARENT_CONSENT_FORM_AGREE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.TERMS_PRIVACY_POLICY_AGREE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.COMMUNITY_PROMISE_AGREE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.EMAIL_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.PHONE_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.PARENT_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.ADDRESS_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.PHOTO_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.JOINED_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Users.ACTIVE_STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Users.USER_POSTS,
        isRequired: false,
        ofModelName: (Posts).toString(),
        associatedKey: Posts.USERSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Users.USER_COMMENTS,
        isRequired: false,
        ofModelName: (PostComments).toString(),
        associatedKey: PostComments.USERSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Users.USER_POSTLIKES,
        isRequired: false,
        ofModelName: (PostLikes).toString(),
        associatedKey: PostLikes.USERSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Users.USER_MOSQUEFOLLOWERS,
        isRequired: false,
        ofModelName: (MosqueFollowers).toString(),
        associatedKey: MosqueFollowers.USERSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Users.USER_FRIENDS,
        isRequired: false,
        ofModelName: (Friends).toString(),
        associatedKey: Friends.USERSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Users.USER_PHOTOS,
        isRequired: false,
        ofModelName: (UserPhotos).toString(),
        associatedKey: UserPhotos.USERSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Users.USER_EDUCATIONS,
        isRequired: false,
        ofModelName: (UserEducation).toString(),
        associatedKey: UserEducation.USERSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Users.USER_PROFILES,
        isRequired: false,
        ofModelName: (UserProfile).toString(),
        associatedKey: UserProfile.USERSID));
  });
}

class _UsersModelType extends ModelType<Users> {
  const _UsersModelType();

  @override
  Users fromJson(Map<String, dynamic> jsonData) {
    return Users.fromJson(jsonData);
  }
}
