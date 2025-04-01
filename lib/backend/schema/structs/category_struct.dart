// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategoryStruct extends FFFirebaseStruct {
  CategoryStruct({
    String? category,
    String? type,
    int? tag,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _type = type,
        _tag = tag,
        super(firestoreUtilData);

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "tag" field.
  int? _tag;
  int get tag => _tag ?? 0;
  set tag(int? val) => _tag = val;

  void incrementTag(int amount) => tag = tag + amount;

  bool hasTag() => _tag != null;

  static CategoryStruct fromMap(Map<String, dynamic> data) => CategoryStruct(
        category: data['category'] as String?,
        type: data['type'] as String?,
        tag: castToType<int>(data['tag']),
      );

  static CategoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CategoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'type': _type,
        'tag': _tag,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.int,
        ),
      }.withoutNulls;

  static CategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.int,
          false,
        ),
      );

  static CategoryStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CategoryStruct(
        category: convertAlgoliaParam(
          data['category'],
          ParamType.String,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        tag: convertAlgoliaParam(
          data['tag'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryStruct &&
        category == other.category &&
        type == other.type &&
        tag == other.tag;
  }

  @override
  int get hashCode => const ListEquality().hash([category, type, tag]);
}

CategoryStruct createCategoryStruct({
  String? category,
  String? type,
  int? tag,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryStruct(
      category: category,
      type: type,
      tag: tag,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoryStruct? updateCategoryStruct(
  CategoryStruct? categoryStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categoryStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoryStructData(
  Map<String, dynamic> firestoreData,
  CategoryStruct? categoryStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categoryStruct == null) {
    return;
  }
  if (categoryStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categoryStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryStructData =
      getCategoryFirestoreData(categoryStruct, forFieldValue);
  final nestedData =
      categoryStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categoryStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoryFirestoreData(
  CategoryStruct? categoryStruct, [
  bool forFieldValue = false,
]) {
  if (categoryStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categoryStruct.toMap());

  // Add any Firestore field values
  categoryStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryListFirestoreData(
  List<CategoryStruct>? categoryStructs,
) =>
    categoryStructs?.map((e) => getCategoryFirestoreData(e, true)).toList() ??
    [];
