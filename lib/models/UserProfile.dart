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

/** This is an auto generated class representing the UserProfile type in your schema. */
@immutable
class UserProfile extends Model {
  static const classType = const _UserProfileModelType();
  final String id;
  final String bio;
  final String relationship_status;
  final String languages_spoken;
  final String sect;
  final bool are_you_revert;
  final bool islam_interest;
  final String profile_privacy;
  final String community_interests;
  final String skills;
  final String religious_interests;
  final String usersID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserProfile._internal(
      {@required this.id,
      this.bio,
      this.relationship_status,
      this.languages_spoken,
      this.sect,
      this.are_you_revert,
      this.islam_interest,
      this.profile_privacy,
      this.community_interests,
      this.skills,
      this.religious_interests,
      this.usersID});

  factory UserProfile(
      {String id,
      String bio,
      String relationship_status,
      String languages_spoken,
      String sect,
      bool are_you_revert,
      bool islam_interest,
      String profile_privacy,
      String community_interests,
      String skills,
      String religious_interests,
      String usersID}) {
    return UserProfile._internal(
        id: id == null ? UUID.getUUID() : id,
        bio: bio,
        relationship_status: relationship_status,
        languages_spoken: languages_spoken,
        sect: sect,
        are_you_revert: are_you_revert,
        islam_interest: islam_interest,
        profile_privacy: profile_privacy,
        community_interests: community_interests,
        skills: skills,
        religious_interests: religious_interests,
        usersID: usersID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfile &&
        id == other.id &&
        bio == other.bio &&
        relationship_status == other.relationship_status &&
        languages_spoken == other.languages_spoken &&
        sect == other.sect &&
        are_you_revert == other.are_you_revert &&
        islam_interest == other.islam_interest &&
        profile_privacy == other.profile_privacy &&
        community_interests == other.community_interests &&
        skills == other.skills &&
        religious_interests == other.religious_interests &&
        usersID == other.usersID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserProfile {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("bio=" + "$bio" + ", ");
    buffer.write("relationship_status=" + "$relationship_status" + ", ");
    buffer.write("languages_spoken=" + "$languages_spoken" + ", ");
    buffer.write("sect=" + "$sect" + ", ");
    buffer.write("are_you_revert=" +
        (are_you_revert != null ? are_you_revert.toString() : "null") +
        ", ");
    buffer.write("islam_interest=" +
        (islam_interest != null ? islam_interest.toString() : "null") +
        ", ");
    buffer.write("profile_privacy=" + "$profile_privacy" + ", ");
    buffer.write("community_interests=" + "$community_interests" + ", ");
    buffer.write("skills=" + "$skills" + ", ");
    buffer.write("religious_interests=" + "$religious_interests" + ", ");
    buffer.write("usersID=" + "$usersID");
    buffer.write("}");

    return buffer.toString();
  }

  UserProfile copyWith(
      {String id,
      String bio,
      String relationship_status,
      String languages_spoken,
      String sect,
      bool are_you_revert,
      bool islam_interest,
      String profile_privacy,
      String community_interests,
      String skills,
      String religious_interests,
      String usersID}) {
    return UserProfile(
        id: id ?? this.id,
        bio: bio ?? this.bio,
        relationship_status: relationship_status ?? this.relationship_status,
        languages_spoken: languages_spoken ?? this.languages_spoken,
        sect: sect ?? this.sect,
        are_you_revert: are_you_revert ?? this.are_you_revert,
        islam_interest: islam_interest ?? this.islam_interest,
        profile_privacy: profile_privacy ?? this.profile_privacy,
        community_interests: community_interests ?? this.community_interests,
        skills: skills ?? this.skills,
        religious_interests: religious_interests ?? this.religious_interests,
        usersID: usersID ?? this.usersID);
  }

  UserProfile.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        bio = json['bio'],
        relationship_status = json['relationship_status'],
        languages_spoken = json['languages_spoken'],
        sect = json['sect'],
        are_you_revert = json['are_you_revert'],
        islam_interest = json['islam_interest'],
        profile_privacy = json['profile_privacy'],
        community_interests = json['community_interests'],
        skills = json['skills'],
        religious_interests = json['religious_interests'],
        usersID = json['usersID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'bio': bio,
        'relationship_status': relationship_status,
        'languages_spoken': languages_spoken,
        'sect': sect,
        'are_you_revert': are_you_revert,
        'islam_interest': islam_interest,
        'profile_privacy': profile_privacy,
        'community_interests': community_interests,
        'skills': skills,
        'religious_interests': religious_interests,
        'usersID': usersID
      };

  static final QueryField ID = QueryField(fieldName: "userProfile.id");
  static final QueryField BIO = QueryField(fieldName: "bio");
  static final QueryField RELATIONSHIP_STATUS =
      QueryField(fieldName: "relationship_status");
  static final QueryField LANGUAGES_SPOKEN =
      QueryField(fieldName: "languages_spoken");
  static final QueryField SECT = QueryField(fieldName: "sect");
  static final QueryField ARE_YOU_REVERT =
      QueryField(fieldName: "are_you_revert");
  static final QueryField ISLAM_INTEREST =
      QueryField(fieldName: "islam_interest");
  static final QueryField PROFILE_PRIVACY =
      QueryField(fieldName: "profile_privacy");
  static final QueryField COMMUNITY_INTERESTS =
      QueryField(fieldName: "community_interests");
  static final QueryField SKILLS = QueryField(fieldName: "skills");
  static final QueryField RELIGIOUS_INTERESTS =
      QueryField(fieldName: "religious_interests");
  static final QueryField USERSID = QueryField(fieldName: "usersID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserProfile";
    modelSchemaDefinition.pluralName = "UserProfiles";

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
        key: UserProfile.BIO,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.RELATIONSHIP_STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.LANGUAGES_SPOKEN,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.SECT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.ARE_YOU_REVERT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.ISLAM_INTEREST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.PROFILE_PRIVACY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.COMMUNITY_INTERESTS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.SKILLS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.RELIGIOUS_INTERESTS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserProfile.USERSID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserProfileModelType extends ModelType<UserProfile> {
  const _UserProfileModelType();

  @override
  UserProfile fromJson(Map<String, dynamic> jsonData) {
    return UserProfile.fromJson(jsonData);
  }
}
