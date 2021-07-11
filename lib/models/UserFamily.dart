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

/** This is an auto generated class representing the UserFamily type in your schema. */
@immutable
class UserFamily extends Model {
  static const classType = const _UserFamilyModelType();
  final String id;
  final String name;
  final String relationship;
  final String user_id;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserFamily._internal(
      {@required this.id, this.name, this.relationship, this.user_id});

  factory UserFamily(
      {String id, String name, String relationship, String user_id}) {
    return UserFamily._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        relationship: relationship,
        user_id: user_id);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserFamily &&
        id == other.id &&
        name == other.name &&
        relationship == other.relationship &&
        user_id == other.user_id;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserFamily {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("relationship=" + "$relationship" + ", ");
    buffer.write("user_id=" + "$user_id");
    buffer.write("}");

    return buffer.toString();
  }

  UserFamily copyWith(
      {String id, String name, String relationship, String user_id}) {
    return UserFamily(
        id: id ?? this.id,
        name: name ?? this.name,
        relationship: relationship ?? this.relationship,
        user_id: user_id ?? this.user_id);
  }

  UserFamily.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        relationship = json['relationship'],
        user_id = json['user_id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'relationship': relationship,
        'user_id': user_id
      };

  static final QueryField ID = QueryField(fieldName: "userFamily.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField RELATIONSHIP = QueryField(fieldName: "relationship");
  static final QueryField USER_ID = QueryField(fieldName: "user_id");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserFamily";
    modelSchemaDefinition.pluralName = "UserFamilies";

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
        key: UserFamily.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserFamily.RELATIONSHIP,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserFamily.USER_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserFamilyModelType extends ModelType<UserFamily> {
  const _UserFamilyModelType();

  @override
  UserFamily fromJson(Map<String, dynamic> jsonData) {
    return UserFamily.fromJson(jsonData);
  }
}
