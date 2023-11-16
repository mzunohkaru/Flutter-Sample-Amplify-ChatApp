/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the SmallTalk type in your schema. */
class SmallTalk extends amplify_core.Model {
  static const classType = const _SmallTalkModelType();
  final String id;
  final String? _room;
  final String? _name;
  final String? _message;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  SmallTalkModelIdentifier get modelIdentifier {
      return SmallTalkModelIdentifier(
        id: id
      );
  }
  
  String get room {
    try {
      return _room!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get message {
    return _message;
  }
  
  amplify_core.TemporalDateTime get createdAt {
    try {
      return _createdAt!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const SmallTalk._internal({required this.id, required room, required name, message, required createdAt, updatedAt}): _room = room, _name = name, _message = message, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SmallTalk({String? id, required String room, required String name, String? message, required amplify_core.TemporalDateTime createdAt}) {
    return SmallTalk._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      room: room,
      name: name,
      message: message,
      createdAt: createdAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SmallTalk &&
      id == other.id &&
      _room == other._room &&
      _name == other._name &&
      _message == other._message &&
      _createdAt == other._createdAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SmallTalk {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("room=" + "$_room" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("message=" + "$_message" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SmallTalk copyWith({String? room, String? name, String? message, amplify_core.TemporalDateTime? createdAt}) {
    return SmallTalk._internal(
      id: id,
      room: room ?? this.room,
      name: name ?? this.name,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt);
  }
  
  SmallTalk copyWithModelFieldValues({
    ModelFieldValue<String>? room,
    ModelFieldValue<String>? name,
    ModelFieldValue<String?>? message,
    ModelFieldValue<amplify_core.TemporalDateTime>? createdAt
  }) {
    return SmallTalk._internal(
      id: id,
      room: room == null ? this.room : room.value,
      name: name == null ? this.name : name.value,
      message: message == null ? this.message : message.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value
    );
  }
  
  SmallTalk.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _room = json['room'],
      _name = json['name'],
      _message = json['message'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'room': _room, 'name': _name, 'message': _message, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'room': _room,
    'name': _name,
    'message': _message,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<SmallTalkModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<SmallTalkModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ROOM = amplify_core.QueryField(fieldName: "room");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final MESSAGE = amplify_core.QueryField(fieldName: "message");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SmallTalk";
    modelSchemaDefinition.pluralName = "SmallTalks";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["room", "createdAt"], name: "sortByCreatedAt")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SmallTalk.ROOM,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SmallTalk.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SmallTalk.MESSAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SmallTalk.CREATEDAT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _SmallTalkModelType extends amplify_core.ModelType<SmallTalk> {
  const _SmallTalkModelType();
  
  @override
  SmallTalk fromJson(Map<String, dynamic> jsonData) {
    return SmallTalk.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SmallTalk';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [SmallTalk] in your schema.
 */
class SmallTalkModelIdentifier implements amplify_core.ModelIdentifier<SmallTalk> {
  final String id;

  /** Create an instance of SmallTalkModelIdentifier using [id] the primary key. */
  const SmallTalkModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'SmallTalkModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SmallTalkModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}