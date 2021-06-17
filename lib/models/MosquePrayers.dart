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
  final String mosqueID;
  final TemporalDate Date;
  final TemporalTime end_time;
  final TemporalTime begin_time;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosquePrayers._internal(
      {@required this.id,
      @required this.prayer,
      this.mosqueID,
      this.Date,
      this.end_time,
      this.begin_time});

  factory MosquePrayers(
      {String id,
      @required String prayer,
      String mosqueID,
      TemporalDate Date,
      TemporalTime end_time,
      TemporalTime begin_time}) {
    return MosquePrayers._internal(
        id: id == null ? UUID.getUUID() : id,
        prayer: prayer,
        mosqueID: mosqueID,
        Date: Date,
        end_time: end_time,
        begin_time: begin_time);
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
        mosqueID == other.mosqueID &&
        Date == other.Date &&
        end_time == other.end_time &&
        begin_time == other.begin_time;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosquePrayers {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("prayer=" + "$prayer" + ", ");
    buffer.write("mosqueID=" + "$mosqueID" + ", ");
    buffer.write("Date=" + (Date != null ? Date.format() : "null") + ", ");
    buffer.write(
        "end_time=" + (end_time != null ? end_time.format() : "null") + ", ");
    buffer.write(
        "begin_time=" + (begin_time != null ? begin_time.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  MosquePrayers copyWith(
      {String id,
      String prayer,
      String mosqueID,
      TemporalDate Date,
      TemporalTime end_time,
      TemporalTime begin_time}) {
    return MosquePrayers(
        id: id ?? this.id,
        prayer: prayer ?? this.prayer,
        mosqueID: mosqueID ?? this.mosqueID,
        Date: Date ?? this.Date,
        end_time: end_time ?? this.end_time,
        begin_time: begin_time ?? this.begin_time);
  }

  MosquePrayers.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        prayer = json['prayer'],
        mosqueID = json['mosqueID'],
        Date =
            json['Date'] != null ? TemporalDate.fromString(json['Date']) : null,
        end_time = json['end_time'] != null
            ? TemporalTime.fromString(json['end_time'])
            : null,
        begin_time = json['begin_time'] != null
            ? TemporalTime.fromString(json['begin_time'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'prayer': prayer,
        'mosqueID': mosqueID,
        'Date': Date?.format(),
        'end_time': end_time?.format(),
        'begin_time': begin_time?.format()
      };

  static final QueryField ID = QueryField(fieldName: "mosquePrayers.id");
  static final QueryField PRAYER = QueryField(fieldName: "prayer");
  static final QueryField MOSQUEID = QueryField(fieldName: "mosqueID");
  static final QueryField DATE = QueryField(fieldName: "Date");
  static final QueryField END_TIME = QueryField(fieldName: "end_time");
  static final QueryField BEGIN_TIME = QueryField(fieldName: "begin_time");
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
        key: MosquePrayers.MOSQUEID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayers.DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayers.END_TIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.time)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayers.BEGIN_TIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.time)));
  });
}

class _MosquePrayersModelType extends ModelType<MosquePrayers> {
  const _MosquePrayersModelType();

  @override
  MosquePrayers fromJson(Map<String, dynamic> jsonData) {
    return MosquePrayers.fromJson(jsonData);
  }
}
