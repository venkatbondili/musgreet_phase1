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

/** This is an auto generated class representing the MosquePrayers type in your schema. */
@immutable
class MosquePrayers extends Model {
  static const classType = const _MosquePrayersModelType();
  final String id;
  final String prayer;
  final TemporalTime time;
  final String mosqueID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosquePrayers._internal(
      {@required this.id,
      @required this.prayer,
      @required this.time,
      this.mosqueID});

  factory MosquePrayers(
      {String id,
      @required String prayer,
      @required TemporalTime time,
      String mosqueID}) {
    return MosquePrayers._internal(
        id: id == null ? UUID.getUUID() : id,
        prayer: prayer,
        time: time,
        mosqueID: mosqueID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MosquePrayers &&
        id == other.id &&
        prayer == other.prayer &&
        time == other.time &&
        mosqueID == other.mosqueID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosquePrayers {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("prayer=" + "$prayer" + ", ");
    buffer.write("time=" + (time != null ? time.format() : "null") + ", ");
    buffer.write("mosqueID=" + "$mosqueID");
    buffer.write("}");

    return buffer.toString();
  }

  MosquePrayers copyWith(
      {String id, String prayer, TemporalTime time, String mosqueID}) {
    return MosquePrayers(
        id: id ?? this.id,
        prayer: prayer ?? this.prayer,
        time: time ?? this.time,
        mosqueID: mosqueID ?? this.mosqueID);
  }

  MosquePrayers.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        prayer = json['prayer'],
        time =
            json['time'] != null ? TemporalTime.fromString(json['time']) : null,
        mosqueID = json['mosqueID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'prayer': prayer,
        'time': time?.format(),
        'mosqueID': mosqueID
      };

  static final QueryField ID = QueryField(fieldName: "mosquePrayers.id");
  static final QueryField PRAYER = QueryField(fieldName: "prayer");
  static final QueryField TIME = QueryField(fieldName: "time");
  static final QueryField MOSQUEID = QueryField(fieldName: "mosqueID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MosquePrayers";
    modelSchemaDefinition.pluralName = "MosquePrayers";

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
        key: MosquePrayers.PRAYER,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayers.TIME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.time)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayers.MOSQUEID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MosquePrayersModelType extends ModelType<MosquePrayers> {
  const _MosquePrayersModelType();

  @override
  MosquePrayers fromJson(Map<String, dynamic> jsonData) {
    return MosquePrayers.fromJson(jsonData);
  }
}
