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
import 'Facilitiesmaster.dart';
import 'FriendRequest.dart';
import 'Friends.dart';
import 'MasterIntrests.dart';
import 'Mosque.dart';
import 'MosqueFollowers.dart';
import 'MosquePhotos.dart';
import 'MosquePrayers.dart';
import 'MosqueUsers.dart';
import 'PostComments.dart';
import 'PostLikes.dart';
import 'Posts.dart';
import 'UserEducation.dart';
import 'UserFamily.dart';
import 'UserPhotos.dart';
import 'UserProfile.dart';
import 'Users.dart';

export 'Facilitiesmaster.dart';
export 'FriendRequest.dart';
export 'Friends.dart';
export 'MasterIntrests.dart';
export 'Mosque.dart';
export 'MosqueFollowers.dart';
export 'MosquePhotos.dart';
export 'MosquePrayers.dart';
export 'MosqueUsers.dart';
export 'PostComments.dart';
export 'PostLikes.dart';
export 'Posts.dart';
export 'UserEducation.dart';
export 'UserFamily.dart';
export 'UserPhotos.dart';
export 'UserProfile.dart';
export 'Users.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "ae6977e8a70f4835ddf423b89313d517";
  @override
  List<ModelSchema> modelSchemas = [
    Facilitiesmaster.schema,
    FriendRequest.schema,
    Friends.schema,
    MasterIntrests.schema,
    Mosque.schema,
    MosqueFollowers.schema,
    MosquePhotos.schema,
    MosquePrayers.schema,
    MosqueUsers.schema,
    PostComments.schema,
    PostLikes.schema,
    Posts.schema,
    UserEducation.schema,
    UserFamily.schema,
    UserPhotos.schema,
    UserProfile.schema,
    Users.schema
  ];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;

  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case "Facilitiesmaster":
        {
          return Facilitiesmaster.classType;
        }
        break;
      case "FriendRequest":
        {
          return FriendRequest.classType;
        }
        break;
      case "Friends":
        {
          return Friends.classType;
        }
        break;
      case "MasterIntrests":
        {
          return MasterIntrests.classType;
        }
        break;
      case "Mosque":
        {
          return Mosque.classType;
        }
        break;
      case "MosqueFollowers":
        {
          return MosqueFollowers.classType;
        }
        break;
      case "MosquePhotos":
        {
          return MosquePhotos.classType;
        }
        break;
      case "MosquePrayers":
        {
          return MosquePrayers.classType;
        }
        break;
      case "MosqueUsers":
        {
          return MosqueUsers.classType;
        }
        break;
      case "PostComments":
        {
          return PostComments.classType;
        }
        break;
      case "PostLikes":
        {
          return PostLikes.classType;
        }
        break;
      case "Posts":
        {
          return Posts.classType;
        }
        break;
      case "UserEducation":
        {
          return UserEducation.classType;
        }
        break;
      case "UserFamily":
        {
          return UserFamily.classType;
        }
        break;
      case "UserPhotos":
        {
          return UserPhotos.classType;
        }
        break;
      case "UserProfile":
        {
          return UserProfile.classType;
        }
        break;
      case "Users":
        {
          return Users.classType;
        }
        break;
      default:
        {
          throw Exception(
              "Failed to find model in model provider for model name: " +
                  modelName);
        }
    }
  }
}
