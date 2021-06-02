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

/** This is an auto generated class representing the Friends type in your schema. */
@immutable
class Friends extends Model {
  static const classType = const _FriendsModelType();
  final String id;
  final String friends_list;
  final String usersID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Friends._internal(
      {@required this.id, @required this.friends_list, @required this.usersID});

  factory Friends(
      {String id, @required String friends_list, @required String usersID}) {
    return Friends._internal(
        id: id == null ? UUID.getUUID() : id,
        friends_list: friends_list,
        usersID: usersID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Friends &&
        id == other.id &&
        friends_list == other.friends_list &&
        usersID == other.usersID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Friends {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("friends_list=" + "$friends_list" + ", ");
    buffer.write("usersID=" + "$usersID");
    buffer.write("}");

    return buffer.toString();
  }

  Friends copyWith({String id, String friends_list, String usersID}) {
    return Friends(
        id: id ?? this.id,
        friends_list: friends_list ?? this.friends_list,
        usersID: usersID ?? this.usersID);
  }

  Friends.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        friends_list = json['friends_list'],
        usersID = json['usersID'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'friends_list': friends_list, 'usersID': usersID};

  static final QueryField ID = QueryField(fieldName: "friends.id");
  static final QueryField FRIENDS_LIST = QueryField(fieldName: "friends_list");
  static final QueryField USERSID = QueryField(fieldName: "usersID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Friends";
    modelSchemaDefinition.pluralName = "Friends";

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
        key: Friends.FRIENDS_LIST,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Friends.USERSID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _FriendsModelType extends ModelType<Friends> {
  const _FriendsModelType();

  @override
  Friends fromJson(Map<String, dynamic> jsonData) {
    return Friends.fromJson(jsonData);
  }
}
