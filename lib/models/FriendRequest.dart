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

/** This is an auto generated class representing the FriendRequest type in your schema. */
@immutable
class FriendRequest extends Model {
  static const classType = const _FriendRequestModelType();
  final String id;
  final TemporalDate request_date;
  final String request_from_id;
  final String request_to_id;
  final String request_message;
  final String request_status;
  final TemporalDate request_status_date;
  final TemporalDate unfriend_date;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const FriendRequest._internal(
      {@required this.id,
      @required this.request_date,
      @required this.request_from_id,
      @required this.request_to_id,
      @required this.request_message,
      this.request_status,
      this.request_status_date,
      this.unfriend_date});

  factory FriendRequest(
      {String id,
      @required TemporalDate request_date,
      @required String request_from_id,
      @required String request_to_id,
      @required String request_message,
      String request_status,
      TemporalDate request_status_date,
      TemporalDate unfriend_date}) {
    return FriendRequest._internal(
        id: id == null ? UUID.getUUID() : id,
        request_date: request_date,
        request_from_id: request_from_id,
        request_to_id: request_to_id,
        request_message: request_message,
        request_status: request_status,
        request_status_date: request_status_date,
        unfriend_date: unfriend_date);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FriendRequest &&
        id == other.id &&
        request_date == other.request_date &&
        request_from_id == other.request_from_id &&
        request_to_id == other.request_to_id &&
        request_message == other.request_message &&
        request_status == other.request_status &&
        request_status_date == other.request_status_date &&
        unfriend_date == other.unfriend_date;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("FriendRequest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("request_date=" +
        (request_date != null ? request_date.format() : "null") +
        ", ");
    buffer.write("request_from_id=" + "$request_from_id" + ", ");
    buffer.write("request_to_id=" + "$request_to_id" + ", ");
    buffer.write("request_message=" + "$request_message" + ", ");
    buffer.write("request_status=" + "$request_status" + ", ");
    buffer.write("request_status_date=" +
        (request_status_date != null ? request_status_date.format() : "null") +
        ", ");
    buffer.write("unfriend_date=" +
        (unfriend_date != null ? unfriend_date.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  FriendRequest copyWith(
      {String id,
      TemporalDate request_date,
      String request_from_id,
      String request_to_id,
      String request_message,
      String request_status,
      TemporalDate request_status_date,
      TemporalDate unfriend_date}) {
    return FriendRequest(
        id: id ?? this.id,
        request_date: request_date ?? this.request_date,
        request_from_id: request_from_id ?? this.request_from_id,
        request_to_id: request_to_id ?? this.request_to_id,
        request_message: request_message ?? this.request_message,
        request_status: request_status ?? this.request_status,
        request_status_date: request_status_date ?? this.request_status_date,
        unfriend_date: unfriend_date ?? this.unfriend_date);
  }

  FriendRequest.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        request_date = json['request_date'] != null
            ? TemporalDate.fromString(json['request_date'])
            : null,
        request_from_id = json['request_from_id'],
        request_to_id = json['request_to_id'],
        request_message = json['request_message'],
        request_status = json['request_status'],
        request_status_date = json['request_status_date'] != null
            ? TemporalDate.fromString(json['request_status_date'])
            : null,
        unfriend_date = json['unfriend_date'] != null
            ? TemporalDate.fromString(json['unfriend_date'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'request_date': request_date?.format(),
        'request_from_id': request_from_id,
        'request_to_id': request_to_id,
        'request_message': request_message,
        'request_status': request_status,
        'request_status_date': request_status_date?.format(),
        'unfriend_date': unfriend_date?.format()
      };

  static final QueryField ID = QueryField(fieldName: "friendRequest.id");
  static final QueryField REQUEST_DATE = QueryField(fieldName: "request_date");
  static final QueryField REQUEST_FROM_ID =
      QueryField(fieldName: "request_from_id");
  static final QueryField REQUEST_TO_ID =
      QueryField(fieldName: "request_to_id");
  static final QueryField REQUEST_MESSAGE =
      QueryField(fieldName: "request_message");
  static final QueryField REQUEST_STATUS =
      QueryField(fieldName: "request_status");
  static final QueryField REQUEST_STATUS_DATE =
      QueryField(fieldName: "request_status_date");
  static final QueryField UNFRIEND_DATE =
      QueryField(fieldName: "unfriend_date");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FriendRequest";
    modelSchemaDefinition.pluralName = "FriendRequests";

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
        key: FriendRequest.REQUEST_DATE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: FriendRequest.REQUEST_FROM_ID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: FriendRequest.REQUEST_TO_ID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: FriendRequest.REQUEST_MESSAGE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: FriendRequest.REQUEST_STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: FriendRequest.REQUEST_STATUS_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: FriendRequest.UNFRIEND_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));
  });
}

class _FriendRequestModelType extends ModelType<FriendRequest> {
  const _FriendRequestModelType();

  @override
  FriendRequest fromJson(Map<String, dynamic> jsonData) {
    return FriendRequest.fromJson(jsonData);
  }
}
