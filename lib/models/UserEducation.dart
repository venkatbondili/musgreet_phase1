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

/** This is an auto generated class representing the UserEducation type in your schema. */
@immutable
class UserEducation extends Model {
  static const classType = const _UserEducationModelType();
  final String id;
  final String institution;
  final String course;
  final String from;
  final String to;
  final String usersID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserEducation._internal(
      {@required this.id,
      @required this.institution,
      @required this.course,
      this.from,
      this.to,
      @required this.usersID});

  factory UserEducation(
      {String id,
      @required String institution,
      @required String course,
      String from,
      String to,
      @required String usersID}) {
    return UserEducation._internal(
        id: id == null ? UUID.getUUID() : id,
        institution: institution,
        course: course,
        from: from,
        to: to,
        usersID: usersID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserEducation &&
        id == other.id &&
        institution == other.institution &&
        course == other.course &&
        from == other.from &&
        to == other.to &&
        usersID == other.usersID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserEducation {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("institution=" + "$institution" + ", ");
    buffer.write("course=" + "$course" + ", ");
    buffer.write("from=" + "$from" + ", ");
    buffer.write("to=" + "$to" + ", ");
    buffer.write("usersID=" + "$usersID");
    buffer.write("}");

    return buffer.toString();
  }

  UserEducation copyWith(
      {String id,
      String institution,
      String course,
      String from,
      String to,
      String usersID}) {
    return UserEducation(
        id: id ?? this.id,
        institution: institution ?? this.institution,
        course: course ?? this.course,
        from: from ?? this.from,
        to: to ?? this.to,
        usersID: usersID ?? this.usersID);
  }

  UserEducation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        institution = json['institution'],
        course = json['course'],
        from = json['from'],
        to = json['to'],
        usersID = json['usersID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'institution': institution,
        'course': course,
        'from': from,
        'to': to,
        'usersID': usersID
      };

  static final QueryField ID = QueryField(fieldName: "userEducation.id");
  static final QueryField INSTITUTION = QueryField(fieldName: "institution");
  static final QueryField COURSE = QueryField(fieldName: "course");
  static final QueryField FROM = QueryField(fieldName: "from");
  static final QueryField TO = QueryField(fieldName: "to");
  static final QueryField USERSID = QueryField(fieldName: "usersID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserEducation";
    modelSchemaDefinition.pluralName = "UserEducations";

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
        key: UserEducation.INSTITUTION,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserEducation.COURSE,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserEducation.FROM,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserEducation.TO,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserEducation.USERSID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserEducationModelType extends ModelType<UserEducation> {
  const _UserEducationModelType();

  @override
  UserEducation fromJson(Map<String, dynamic> jsonData) {
    return UserEducation.fromJson(jsonData);
  }
}
