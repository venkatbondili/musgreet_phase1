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

/** This is an auto generated class representing the PostLikes type in your schema. */
@immutable
class PostLikes extends Model {
  static const classType = const _PostLikesModelType();
  final String id;
  final String postsID;
  final String usersID;
  final String postcommentsID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const PostLikes._internal(
      {@required this.id,
      this.postsID,
      @required this.usersID,
      this.postcommentsID});

  factory PostLikes(
      {String id,
      String postsID,
      @required String usersID,
      String postcommentsID}) {
    return PostLikes._internal(
        id: id == null ? UUID.getUUID() : id,
        postsID: postsID,
        usersID: usersID,
        postcommentsID: postcommentsID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostLikes &&
        id == other.id &&
        postsID == other.postsID &&
        usersID == other.usersID &&
        postcommentsID == other.postcommentsID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("PostLikes {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("postsID=" + "$postsID" + ", ");
    buffer.write("usersID=" + "$usersID" + ", ");
    buffer.write("postcommentsID=" + "$postcommentsID");
    buffer.write("}");

    return buffer.toString();
  }

  PostLikes copyWith(
      {String id, String postsID, String usersID, String postcommentsID}) {
    return PostLikes(
        id: id ?? this.id,
        postsID: postsID ?? this.postsID,
        usersID: usersID ?? this.usersID,
        postcommentsID: postcommentsID ?? this.postcommentsID);
  }

  PostLikes.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        postsID = json['postsID'],
        usersID = json['usersID'],
        postcommentsID = json['postcommentsID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'postsID': postsID,
        'usersID': usersID,
        'postcommentsID': postcommentsID
      };

  static final QueryField ID = QueryField(fieldName: "postLikes.id");
  static final QueryField POSTSID = QueryField(fieldName: "postsID");
  static final QueryField USERSID = QueryField(fieldName: "usersID");
  static final QueryField POSTCOMMENTSID =
      QueryField(fieldName: "postcommentsID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PostLikes";
    modelSchemaDefinition.pluralName = "PostLikes";

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
        key: PostLikes.POSTSID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostLikes.USERSID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostLikes.POSTCOMMENTSID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _PostLikesModelType extends ModelType<PostLikes> {
  const _PostLikesModelType();

  @override
  PostLikes fromJson(Map<String, dynamic> jsonData) {
    return PostLikes.fromJson(jsonData);
  }
}
