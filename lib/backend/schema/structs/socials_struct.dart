// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SocialsStruct extends FFFirebaseStruct {
  SocialsStruct({
    String? xPlatform,
    String? instagram,
    String? youtube,
    String? facebook,
    String? tiktok,
    String? linkedin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _xPlatform = xPlatform,
        _instagram = instagram,
        _youtube = youtube,
        _facebook = facebook,
        _tiktok = tiktok,
        _linkedin = linkedin,
        super(firestoreUtilData);

  // "xPlatform" field.
  String? _xPlatform;
  String get xPlatform => _xPlatform ?? '';
  set xPlatform(String? val) => _xPlatform = val;

  bool hasXPlatform() => _xPlatform != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  set instagram(String? val) => _instagram = val;

  bool hasInstagram() => _instagram != null;

  // "youtube" field.
  String? _youtube;
  String get youtube => _youtube ?? '';
  set youtube(String? val) => _youtube = val;

  bool hasYoutube() => _youtube != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  set facebook(String? val) => _facebook = val;

  bool hasFacebook() => _facebook != null;

  // "tiktok" field.
  String? _tiktok;
  String get tiktok => _tiktok ?? '';
  set tiktok(String? val) => _tiktok = val;

  bool hasTiktok() => _tiktok != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  set linkedin(String? val) => _linkedin = val;

  bool hasLinkedin() => _linkedin != null;

  static SocialsStruct fromMap(Map<String, dynamic> data) => SocialsStruct(
        xPlatform: data['xPlatform'] as String?,
        instagram: data['instagram'] as String?,
        youtube: data['youtube'] as String?,
        facebook: data['facebook'] as String?,
        tiktok: data['tiktok'] as String?,
        linkedin: data['linkedin'] as String?,
      );

  static SocialsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SocialsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'xPlatform': _xPlatform,
        'instagram': _instagram,
        'youtube': _youtube,
        'facebook': _facebook,
        'tiktok': _tiktok,
        'linkedin': _linkedin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'xPlatform': serializeParam(
          _xPlatform,
          ParamType.String,
        ),
        'instagram': serializeParam(
          _instagram,
          ParamType.String,
        ),
        'youtube': serializeParam(
          _youtube,
          ParamType.String,
        ),
        'facebook': serializeParam(
          _facebook,
          ParamType.String,
        ),
        'tiktok': serializeParam(
          _tiktok,
          ParamType.String,
        ),
        'linkedin': serializeParam(
          _linkedin,
          ParamType.String,
        ),
      }.withoutNulls;

  static SocialsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SocialsStruct(
        xPlatform: deserializeParam(
          data['xPlatform'],
          ParamType.String,
          false,
        ),
        instagram: deserializeParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        youtube: deserializeParam(
          data['youtube'],
          ParamType.String,
          false,
        ),
        facebook: deserializeParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        tiktok: deserializeParam(
          data['tiktok'],
          ParamType.String,
          false,
        ),
        linkedin: deserializeParam(
          data['linkedin'],
          ParamType.String,
          false,
        ),
      );

  static SocialsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SocialsStruct(
        xPlatform: convertAlgoliaParam(
          data['xPlatform'],
          ParamType.String,
          false,
        ),
        instagram: convertAlgoliaParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        youtube: convertAlgoliaParam(
          data['youtube'],
          ParamType.String,
          false,
        ),
        facebook: convertAlgoliaParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        tiktok: convertAlgoliaParam(
          data['tiktok'],
          ParamType.String,
          false,
        ),
        linkedin: convertAlgoliaParam(
          data['linkedin'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SocialsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SocialsStruct &&
        xPlatform == other.xPlatform &&
        instagram == other.instagram &&
        youtube == other.youtube &&
        facebook == other.facebook &&
        tiktok == other.tiktok &&
        linkedin == other.linkedin;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([xPlatform, instagram, youtube, facebook, tiktok, linkedin]);
}

SocialsStruct createSocialsStruct({
  String? xPlatform,
  String? instagram,
  String? youtube,
  String? facebook,
  String? tiktok,
  String? linkedin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SocialsStruct(
      xPlatform: xPlatform,
      instagram: instagram,
      youtube: youtube,
      facebook: facebook,
      tiktok: tiktok,
      linkedin: linkedin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SocialsStruct? updateSocialsStruct(
  SocialsStruct? socials, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    socials
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSocialsStructData(
  Map<String, dynamic> firestoreData,
  SocialsStruct? socials,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (socials == null) {
    return;
  }
  if (socials.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && socials.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final socialsData = getSocialsFirestoreData(socials, forFieldValue);
  final nestedData = socialsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = socials.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSocialsFirestoreData(
  SocialsStruct? socials, [
  bool forFieldValue = false,
]) {
  if (socials == null) {
    return {};
  }
  final firestoreData = mapToFirestore(socials.toMap());

  // Add any Firestore field values
  socials.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSocialsListFirestoreData(
  List<SocialsStruct>? socialss,
) =>
    socialss?.map((e) => getSocialsFirestoreData(e, true)).toList() ?? [];
