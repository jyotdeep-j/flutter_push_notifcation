import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponsRecord extends FirestoreRecord {
  CouponsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "discount_value" field.
  double? _discountValue;
  double get discountValue => _discountValue ?? 0.0;
  bool hasDiscountValue() => _discountValue != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _code = snapshotData['code'] as String?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _discountValue = castToType<double>(snapshotData['discount_value']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coupons');

  static Stream<CouponsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponsRecord.fromSnapshot(s));

  static Future<CouponsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponsRecord.fromSnapshot(s));

  static CouponsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CouponsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponsRecordData({
  DateTime? createdAt,
  String? image,
  String? title,
  String? description,
  String? code,
  DateTime? expiryDate,
  double? discountValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'image': image,
      'title': title,
      'description': description,
      'code': code,
      'expiry_date': expiryDate,
      'discount_value': discountValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouponsRecordDocumentEquality implements Equality<CouponsRecord> {
  const CouponsRecordDocumentEquality();

  @override
  bool equals(CouponsRecord? e1, CouponsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.image == e2?.image &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.code == e2?.code &&
        e1?.expiryDate == e2?.expiryDate &&
        e1?.discountValue == e2?.discountValue;
  }

  @override
  int hash(CouponsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.image,
        e?.title,
        e?.description,
        e?.code,
        e?.expiryDate,
        e?.discountValue
      ]);

  @override
  bool isValidKey(Object? o) => o is CouponsRecord;
}
