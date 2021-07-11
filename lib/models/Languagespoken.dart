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

/** This is an auto generated class representing the Languagespoken type in your schema. */
@immutable
class Languagespoken extends Model {
  static const classType = const _LanguagespokenModelType();
  final String id;
  final String languages;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Languagespoken._internal({@required this.id, this.languages});

  factory Languagespoken({String id, String languages}) {
    return Languagespoken._internal(
        id: id == null ? UUID.getUUID() : id, languages: languages);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Languagespoken &&
        id == other.id &&
        languages == other.languages;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Languagespoken {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("languages=" + "$languages");
    buffer.write("}");

    return buffer.toString();
  }

  Languagespoken copyWith({String id, String languages}) {
    return Languagespoken(
        id: id ?? this.id, languages: languages ?? this.languages);
  }

  Languagespoken.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        languages = json['languages'];

  Map<String, dynamic> toJson() => {'id': id, 'languages': languages};

  static final QueryField ID = QueryField(fieldName: "languagespoken.id");
  static final QueryField LANGUAGES = QueryField(fieldName: "languages");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Languagespoken";
    modelSchemaDefinition.pluralName = "Languagespokens";

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
        key: Languagespoken.LANGUAGES,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _LanguagespokenModelType extends ModelType<Languagespoken> {
  const _LanguagespokenModelType();

  @override
  Languagespoken fromJson(Map<String, dynamic> jsonData) {
    return Languagespoken.fromJson(jsonData);
  }
}
