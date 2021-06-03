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

/** This is an auto generated class representing the Facilitiesmaster type in your schema. */
@immutable
class Facilitiesmaster extends Model {
  static const classType = const _FacilitiesmasterModelType();
  final String id;
  final String icon_path;
  final String facility_header;
  final String description;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Facilitiesmaster._internal(
      {@required this.id,
      this.icon_path,
      this.facility_header,
      this.description});

  factory Facilitiesmaster(
      {String id,
      String icon_path,
      String facility_header,
      String description}) {
    return Facilitiesmaster._internal(
        id: id == null ? UUID.getUUID() : id,
        icon_path: icon_path,
        facility_header: facility_header,
        description: description);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Facilitiesmaster &&
        id == other.id &&
        icon_path == other.icon_path &&
        facility_header == other.facility_header &&
        description == other.description;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Facilitiesmaster {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("icon_path=" + "$icon_path" + ", ");
    buffer.write("facility_header=" + "$facility_header" + ", ");
    buffer.write("description=" + "$description");
    buffer.write("}");

    return buffer.toString();
  }

  Facilitiesmaster copyWith(
      {String id,
      String icon_path,
      String facility_header,
      String description}) {
    return Facilitiesmaster(
        id: id ?? this.id,
        icon_path: icon_path ?? this.icon_path,
        facility_header: facility_header ?? this.facility_header,
        description: description ?? this.description);
  }

  Facilitiesmaster.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        icon_path = json['icon_path'],
        facility_header = json['facility_header'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'icon_path': icon_path,
        'facility_header': facility_header,
        'description': description
      };

  static final QueryField ID = QueryField(fieldName: "facilitiesmaster.id");
  static final QueryField ICON_PATH = QueryField(fieldName: "icon_path");
  static final QueryField FACILITY_HEADER =
      QueryField(fieldName: "facility_header");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Facilitiesmaster";
    modelSchemaDefinition.pluralName = "Facilitiesmasters";

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
        key: Facilitiesmaster.ICON_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Facilitiesmaster.FACILITY_HEADER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Facilitiesmaster.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _FacilitiesmasterModelType extends ModelType<Facilitiesmaster> {
  const _FacilitiesmasterModelType();

  @override
  Facilitiesmaster fromJson(Map<String, dynamic> jsonData) {
    return Facilitiesmaster.fromJson(jsonData);
  }
}
