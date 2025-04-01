// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CouponStruct extends FFFirebaseStruct {
  CouponStruct({
    String? image,
    String? title,
    String? description,
    String? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _title = title,
        _description = description,
        _code = code,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static CouponStruct fromMap(Map<String, dynamic> data) => CouponStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        code: data['code'] as String?,
      );

  static CouponStruct? maybeFromMap(dynamic data) =>
      data is Map ? CouponStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'description': _description,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static CouponStruct fromSerializableMap(Map<String, dynamic> data) =>
      CouponStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  static CouponStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CouponStruct(
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        code: convertAlgoliaParam(
          data['code'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CouponStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CouponStruct &&
        image == other.image &&
        title == other.title &&
        description == other.description &&
        code == other.code;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, title, description, code]);
}

CouponStruct createCouponStruct({
  String? image,
  String? title,
  String? description,
  String? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CouponStruct(
      image: image,
      title: title,
      description: description,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CouponStruct? updateCouponStruct(
  CouponStruct? coupon, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coupon
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCouponStructData(
  Map<String, dynamic> firestoreData,
  CouponStruct? coupon,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coupon == null) {
    return;
  }
  if (coupon.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coupon.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final couponData = getCouponFirestoreData(coupon, forFieldValue);
  final nestedData = couponData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coupon.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCouponFirestoreData(
  CouponStruct? coupon, [
  bool forFieldValue = false,
]) {
  if (coupon == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coupon.toMap());

  // Add any Firestore field values
  coupon.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCouponListFirestoreData(
  List<CouponStruct>? coupons,
) =>
    coupons?.map((e) => getCouponFirestoreData(e, true)).toList() ?? [];
