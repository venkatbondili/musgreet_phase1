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

/** This is an auto generated class representing the Posts type in your schema. */
@immutable
class Posts extends Model {
  static const classType = const _PostsModelType();
  final String id;
  final String post;
  final String post_image_path;
  final String description;
  final String visibility;
  final String usersID;
  final String mosquesID;
  final List<PostComments> Post_Comments;
  final List<PostLikes> Post_Likes;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Posts._internal(
      {@required this.id,
      @required this.post,
      this.post_image_path,
      this.description,
      this.visibility,
      this.usersID,
      this.mosquesID,
      this.Post_Comments,
      this.Post_Likes});

  factory Posts(
      {String id,
      @required String post,
      String post_image_path,
      String description,
      String visibility,
      String usersID,
      String mosquesID,
      List<PostComments> Post_Comments,
      List<PostLikes> Post_Likes}) {
    return Posts._internal(
        id: id == null ? UUID.getUUID() : id,
        post: post,
        post_image_path: post_image_path,
        description: description,
        visibility: visibility,
        usersID: usersID,
        mosquesID: mosquesID,
        Post_Comments: Post_Comments != null
            ? List.unmodifiable(Post_Comments)
            : Post_Comments,
        Post_Likes:
            Post_Likes != null ? List.unmodifiable(Post_Likes) : Post_Likes);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Posts &&
        id == other.id &&
        post == other.post &&
        post_image_path == other.post_image_path &&
        description == other.description &&
        visibility == other.visibility &&
        usersID == other.usersID &&
        mosquesID == other.mosquesID &&
        DeepCollectionEquality().equals(Post_Comments, other.Post_Comments) &&
        DeepCollectionEquality().equals(Post_Likes, other.Post_Likes);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Posts {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("post=" + "$post" + ", ");
    buffer.write("post_image_path=" + "$post_image_path" + ", ");
    buffer.write("description=" + "$description" + ", ");
    buffer.write("visibility=" + "$visibility" + ", ");
    buffer.write("usersID=" + "$usersID" + ", ");
    buffer.write("mosquesID=" + "$mosquesID");
    buffer.write("}");

    return buffer.toString();
  }

  Posts copyWith(
      {String id,
      String post,
      String post_image_path,
      String description,
      String visibility,
      String usersID,
      String mosquesID,
      List<PostComments> Post_Comments,
      List<PostLikes> Post_Likes}) {
    return Posts(
        id: id ?? this.id,
        post: post ?? this.post,
        post_image_path: post_image_path ?? this.post_image_path,
        description: description ?? this.description,
        visibility: visibility ?? this.visibility,
        usersID: usersID ?? this.usersID,
        mosquesID: mosquesID ?? this.mosquesID,
        Post_Comments: Post_Comments ?? this.Post_Comments,
        Post_Likes: Post_Likes ?? this.Post_Likes);
  }

  Posts.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        post = json['post'],
        post_image_path = json['post_image_path'],
        description = json['description'],
        visibility = json['visibility'],
        usersID = json['usersID'],
        mosquesID = json['mosquesID'],
        Post_Comments = json['Post_Comments'] is List
            ? (json['Post_Comments'] as List)
                .map((e) =>
                    PostComments.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        Post_Likes = json['Post_Likes'] is List
            ? (json['Post_Likes'] as List)
                .map(
                    (e) => PostLikes.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'post': post,
        'post_image_path': post_image_path,
        'description': description,
        'visibility': visibility,
        'usersID': usersID,
        'mosquesID': mosquesID,
        'Post_Comments': Post_Comments?.map((e) => e?.toJson())?.toList(),
        'Post_Likes': Post_Likes?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "posts.id");
  static final QueryField POST = QueryField(fieldName: "post");
  static final QueryField POST_IMAGE_PATH =
      QueryField(fieldName: "post_image_path");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField VISIBILITY = QueryField(fieldName: "visibility");
  static final QueryField USERSID = QueryField(fieldName: "usersID");
  static final QueryField MOSQUESID = QueryField(fieldName: "mosquesID");
  static final QueryField POST_COMMENTS = QueryField(
      fieldName: "Post_Comments",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (PostComments).toString()));
  static final QueryField POST_LIKES = QueryField(
      fieldName: "Post_Likes",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (PostLikes).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Posts";
    modelSchemaDefinition.pluralName = "Posts";

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
        key: Posts.POST,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Posts.POST_IMAGE_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Posts.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Posts.VISIBILITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Posts.USERSID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Posts.MOSQUESID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Posts.POST_COMMENTS,
        isRequired: false,
        ofModelName: (PostComments).toString(),
        associatedKey: PostComments.POSTSID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Posts.POST_LIKES,
        isRequired: false,
        ofModelName: (PostLikes).toString(),
        associatedKey: PostLikes.POSTSID));
  });
}

class _PostsModelType extends ModelType<Posts> {
  const _PostsModelType();

  @override
  Posts fromJson(Map<String, dynamic> jsonData) {
    return Posts.fromJson(jsonData);
  }
}
