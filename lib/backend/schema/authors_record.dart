import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthorsRecord extends FirestoreRecord {
  AuthorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "biography" field.
  String? _biography;
  String get biography => _biography ?? '';
  bool hasBiography() => _biography != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _photo = snapshotData['photo'] as String?;
    _biography = snapshotData['biography'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('authors');

  static Stream<AuthorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuthorsRecord.fromSnapshot(s));

  static Future<AuthorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuthorsRecord.fromSnapshot(s));

  static AuthorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuthorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuthorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuthorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuthorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuthorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuthorsRecordData({
  String? id,
  String? name,
  String? photo,
  String? biography,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'photo': photo,
      'biography': biography,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuthorsRecordDocumentEquality implements Equality<AuthorsRecord> {
  const AuthorsRecordDocumentEquality();

  @override
  bool equals(AuthorsRecord? e1, AuthorsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.photo == e2?.photo &&
        e1?.biography == e2?.biography;
  }

  @override
  int hash(AuthorsRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.photo, e?.biography]);

  @override
  bool isValidKey(Object? o) => o is AuthorsRecord;
}
