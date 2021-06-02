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

/** This is an auto generated class representing the MosqueFollowers type in your schema. */
@immutable
class MosqueFollowers extends Model {
  static const classType = const _MosqueFollowersModelType();
  final String id;
  final String mosqueID;
  final String usersID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosqueFollowers._internal(
      {@required this.id, @required this.mosqueID, @required this.usersID});

  factory MosqueFollowers(
      {String id, @required String mosqueID, @required String usersID}) {
    return MosqueFollowers._internal(
        id: id == null ? UUID.getUUID() : id,
        mosqueID: mosqueID,
        usersID: usersID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MosqueFollowers &&
        id == other.id &&
        mosqueID == other.mosqueID &&
        usersID == other.usersID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosqueFollowers {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("mosqueID=" + "$mosqueID" + ", ");
    buffer.write("usersID=" + "$usersID");
    buffer.write("}");

    return buffer.toString();
  }

  MosqueFollowers copyWith({String id, String mosqueID, String usersID}) {
    return MosqueFollowers(
        id: id ?? this.id,
        mosqueID: mosqueID ?? this.mosqueID,
        usersID: usersID ?? this.usersID);
  }

  MosqueFollowers.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mosqueID = json['mosqueID'],
        usersID = json['usersID'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'mosqueID': mosqueID, 'usersID': usersID};

  static final QueryField ID = QueryField(fieldName: "mosqueFollowers.id");
  static final QueryField MOSQUEID = QueryField(fieldName: "mosqueID");
  static final QueryField USERSID = QueryField(fieldName: "usersID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MosqueFollowers";
    modelSchemaDefinition.pluralName = "MosqueFollowers";

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
        key: MosqueFollowers.MOSQUEID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueFollowers.USERSID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MosqueFollowersModelType extends ModelType<MosqueFollowers> {
  const _MosqueFollowersModelType();

  @override
  MosqueFollowers fromJson(Map<String, dynamic> jsonData) {
    return MosqueFollowers.fromJson(jsonData);
  }
}
