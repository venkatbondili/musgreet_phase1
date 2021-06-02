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

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the PostComments type in your schema. */
@immutable
class PostComments extends Model {
  static const classType = const _PostCommentsModelType();
  final String id;
  final String comment;
  final String parent_id;
  final String postsID;
  final String usersID;
  final List<PostLikes> Comments_PostLikes;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const PostComments._internal(
      {@required this.id,
      @required this.comment,
      this.parent_id,
      @required this.postsID,
      @required this.usersID,
      this.Comments_PostLikes});

  factory PostComments(
      {String id,
      @required String comment,
      String parent_id,
      @required String postsID,
      @required String usersID,
      List<PostLikes> Comments_PostLikes}) {
    return PostComments._internal(
        id: id == null ? UUID.getUUID() : id,
        comment: comment,
        parent_id: parent_id,
        postsID: postsID,
        usersID: usersID,
        Comments_PostLikes: Comments_PostLikes != null
            ? List.unmodifiable(Comments_PostLikes)
            : Comments_PostLikes);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostComments &&
        id == other.id &&
        comment == other.comment &&
        parent_id == other.parent_id &&
        postsID == other.postsID &&
        usersID == other.usersID &&
        DeepCollectionEquality()
            .equals(Comments_PostLikes, other.Comments_PostLikes);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("PostComments {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("comment=" + "$comment" + ", ");
    buffer.write("parent_id=" + "$parent_id" + ", ");
    buffer.write("postsID=" + "$postsID" + ", ");
    buffer.write("usersID=" + "$usersID");
    buffer.write("}");

    return buffer.toString();
  }

  PostComments copyWith(
      {String id,
      String comment,
      String parent_id,
      String postsID,
      String usersID,
      List<PostLikes> Comments_PostLikes}) {
    return PostComments(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        parent_id: parent_id ?? this.parent_id,
        postsID: postsID ?? this.postsID,
        usersID: usersID ?? this.usersID,
        Comments_PostLikes: Comments_PostLikes ?? this.Comments_PostLikes);
  }

  PostComments.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        comment = json['comment'],
        parent_id = json['parent_id'],
        postsID = json['postsID'],
        usersID = json['usersID'],
        Comments_PostLikes = json['Comments_PostLikes'] is List
            ? (json['Comments_PostLikes'] as List)
                .map(
                    (e) => PostLikes.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'comment': comment,
        'parent_id': parent_id,
        'postsID': postsID,
        'usersID': usersID,
        'Comments_PostLikes':
            Comments_PostLikes?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "postComments.id");
  static final QueryField COMMENT = QueryField(fieldName: "comment");
  static final QueryField PARENT_ID = QueryField(fieldName: "parent_id");
  static final QueryField POSTSID = QueryField(fieldName: "postsID");
  static final QueryField USERSID = QueryField(fieldName: "usersID");
  static final QueryField COMMENTS_POSTLIKES = QueryField(
      fieldName: "Comments_PostLikes",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (PostLikes).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PostComments";
    modelSchemaDefinition.pluralName = "PostComments";

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
        key: PostComments.COMMENT,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostComments.PARENT_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostComments.POSTSID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostComments.USERSID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: PostComments.COMMENTS_POSTLIKES,
        isRequired: false,
        ofModelName: (PostLikes).toString(),
        associatedKey: PostLikes.POSTCOMMENTSID));
  });
}

class _PostCommentsModelType extends ModelType<PostComments> {
  const _PostCommentsModelType();

  @override
  PostComments fromJson(Map<String, dynamic> jsonData) {
    return PostComments.fromJson(jsonData);
  }
}
