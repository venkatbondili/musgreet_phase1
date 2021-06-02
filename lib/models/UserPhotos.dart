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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the UserPhotos type in your schema. */
@immutable
class UserPhotos extends Model {
  static const classType = const _UserPhotosModelType();
  final String id;
  final String photo_type;
  final String photo_path;
  final String usersID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserPhotos._internal(
      {@required this.id,
      @required this.photo_type,
      @required this.photo_path,
      @required this.usersID});

  factory UserPhotos(
      {String id,
      @required String photo_type,
      @required String photo_path,
      @required String usersID}) {
    return UserPhotos._internal(
        id: id == null ? UUID.getUUID() : id,
        photo_type: photo_type,
        photo_path: photo_path,
        usersID: usersID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPhotos &&
        id == other.id &&
        photo_type == other.photo_type &&
        photo_path == other.photo_path &&
        usersID == other.usersID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserPhotos {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("photo_type=" + "$photo_type" + ", ");
    buffer.write("photo_path=" + "$photo_path" + ", ");
    buffer.write("usersID=" + "$usersID");
    buffer.write("}");

    return buffer.toString();
  }

  UserPhotos copyWith(
      {String id, String photo_type, String photo_path, String usersID}) {
    return UserPhotos(
        id: id ?? this.id,
        photo_type: photo_type ?? this.photo_type,
        photo_path: photo_path ?? this.photo_path,
        usersID: usersID ?? this.usersID);
  }

  UserPhotos.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        photo_type = json['photo_type'],
        photo_path = json['photo_path'],
        usersID = json['usersID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'photo_type': photo_type,
        'photo_path': photo_path,
        'usersID': usersID
      };

  static final QueryField ID = QueryField(fieldName: "userPhotos.id");
  static final QueryField PHOTO_TYPE = QueryField(fieldName: "photo_type");
  static final QueryField PHOTO_PATH = QueryField(fieldName: "photo_path");
  static final QueryField USERSID = QueryField(fieldName: "usersID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserPhotos";
    modelSchemaDefinition.pluralName = "UserPhotos";

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
        key: UserPhotos.PHOTO_TYPE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserPhotos.PHOTO_PATH,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserPhotos.USERSID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserPhotosModelType extends ModelType<UserPhotos> {
  const _UserPhotosModelType();

  @override
  UserPhotos fromJson(Map<String, dynamic> jsonData) {
    return UserPhotos.fromJson(jsonData);
  }
}
