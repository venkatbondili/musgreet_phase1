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

/** This is an auto generated class representing the MosquePhotos type in your schema. */
@immutable
class MosquePhotos extends Model {
  static const classType = const _MosquePhotosModelType();
  final String id;
  final String photo_type;
  final String photo_path;
  final String mosqueID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosquePhotos._internal(
      {@required this.id,
      @required this.photo_type,
      @required this.photo_path,
      @required this.mosqueID});

  factory MosquePhotos(
      {String id,
      @required String photo_type,
      @required String photo_path,
      @required String mosqueID}) {
    return MosquePhotos._internal(
        id: id == null ? UUID.getUUID() : id,
        photo_type: photo_type,
        photo_path: photo_path,
        mosqueID: mosqueID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MosquePhotos &&
        id == other.id &&
        photo_type == other.photo_type &&
        photo_path == other.photo_path &&
        mosqueID == other.mosqueID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosquePhotos {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("photo_type=" + "$photo_type" + ", ");
    buffer.write("photo_path=" + "$photo_path" + ", ");
    buffer.write("mosqueID=" + "$mosqueID");
    buffer.write("}");

    return buffer.toString();
  }

  MosquePhotos copyWith(
      {String id, String photo_type, String photo_path, String mosqueID}) {
    return MosquePhotos(
        id: id ?? this.id,
        photo_type: photo_type ?? this.photo_type,
        photo_path: photo_path ?? this.photo_path,
        mosqueID: mosqueID ?? this.mosqueID);
  }

  MosquePhotos.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        photo_type = json['photo_type'],
        photo_path = json['photo_path'],
        mosqueID = json['mosqueID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'photo_type': photo_type,
        'photo_path': photo_path,
        'mosqueID': mosqueID
      };

  static final QueryField ID = QueryField(fieldName: "mosquePhotos.id");
  static final QueryField PHOTO_TYPE = QueryField(fieldName: "photo_type");
  static final QueryField PHOTO_PATH = QueryField(fieldName: "photo_path");
  static final QueryField MOSQUEID = QueryField(fieldName: "mosqueID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MosquePhotos";
    modelSchemaDefinition.pluralName = "MosquePhotos";

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
        key: MosquePhotos.PHOTO_TYPE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePhotos.PHOTO_PATH,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePhotos.MOSQUEID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MosquePhotosModelType extends ModelType<MosquePhotos> {
  const _MosquePhotosModelType();

  @override
  MosquePhotos fromJson(Map<String, dynamic> jsonData) {
    return MosquePhotos.fromJson(jsonData);
  }
}
