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

/** This is an auto generated class representing the MasterIntrests type in your schema. */
@immutable
class MasterIntrests extends Model {
  static const classType = const _MasterIntrestsModelType();
  final String id;
  final String photo_path;
  final String intrest_name;
  final String decription;
  final String category_name;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MasterIntrests._internal(
      {@required this.id,
      this.photo_path,
      this.intrest_name,
      this.decription,
      this.category_name});

  factory MasterIntrests(
      {String id,
      String photo_path,
      String intrest_name,
      String decription,
      String category_name}) {
    return MasterIntrests._internal(
        id: id == null ? UUID.getUUID() : id,
        photo_path: photo_path,
        intrest_name: intrest_name,
        decription: decription,
        category_name: category_name);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MasterIntrests &&
        id == other.id &&
        photo_path == other.photo_path &&
        intrest_name == other.intrest_name &&
        decription == other.decription &&
        category_name == other.category_name;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MasterIntrests {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("photo_path=" + "$photo_path" + ", ");
    buffer.write("intrest_name=" + "$intrest_name" + ", ");
    buffer.write("decription=" + "$decription" + ", ");
    buffer.write("category_name=" + "$category_name");
    buffer.write("}");

    return buffer.toString();
  }

  MasterIntrests copyWith(
      {String id,
      String photo_path,
      String intrest_name,
      String decription,
      String category_name}) {
    return MasterIntrests(
        id: id ?? this.id,
        photo_path: photo_path ?? this.photo_path,
        intrest_name: intrest_name ?? this.intrest_name,
        decription: decription ?? this.decription,
        category_name: category_name ?? this.category_name);
  }

  MasterIntrests.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        photo_path = json['photo_path'],
        intrest_name = json['intrest_name'],
        decription = json['decription'],
        category_name = json['category_name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'photo_path': photo_path,
        'intrest_name': intrest_name,
        'decription': decription,
        'category_name': category_name
      };

  static final QueryField ID = QueryField(fieldName: "masterIntrests.id");
  static final QueryField PHOTO_PATH = QueryField(fieldName: "photo_path");
  static final QueryField INTREST_NAME = QueryField(fieldName: "intrest_name");
  static final QueryField DECRIPTION = QueryField(fieldName: "decription");
  static final QueryField CATEGORY_NAME =
      QueryField(fieldName: "category_name");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MasterIntrests";
    modelSchemaDefinition.pluralName = "MasterIntrests";

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
        key: MasterIntrests.PHOTO_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MasterIntrests.INTREST_NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MasterIntrests.DECRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MasterIntrests.CATEGORY_NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MasterIntrestsModelType extends ModelType<MasterIntrests> {
  const _MasterIntrestsModelType();

  @override
  MasterIntrests fromJson(Map<String, dynamic> jsonData) {
    return MasterIntrests.fromJson(jsonData);
  }
}
