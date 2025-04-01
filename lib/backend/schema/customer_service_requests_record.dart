import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerServiceRequestsRecord extends FirestoreRecord {
  CustomerServiceRequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _subject = snapshotData['subject'] as String?;
    _message = snapshotData['message'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer_service_requests');

  static Stream<CustomerServiceRequestsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerServiceRequestsRecord.fromSnapshot(s));

  static Future<CustomerServiceRequestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CustomerServiceRequestsRecord.fromSnapshot(s));

  static CustomerServiceRequestsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CustomerServiceRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerServiceRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerServiceRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerServiceRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerServiceRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerServiceRequestsRecordData({
  DateTime? createdAt,
  DocumentReference? user,
  String? email,
  String? subject,
  String? message,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user': user,
      'email': email,
      'subject': subject,
      'message': message,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerServiceRequestsRecordDocumentEquality
    implements Equality<CustomerServiceRequestsRecord> {
  const CustomerServiceRequestsRecordDocumentEquality();

  @override
  bool equals(
      CustomerServiceRequestsRecord? e1, CustomerServiceRequestsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.user == e2?.user &&
        e1?.email == e2?.email &&
        e1?.subject == e2?.subject &&
        e1?.message == e2?.message &&
        e1?.status == e2?.status;
  }

  @override
  int hash(CustomerServiceRequestsRecord? e) => const ListEquality().hash(
      [e?.createdAt, e?.user, e?.email, e?.subject, e?.message, e?.status]);

  @override
  bool isValidKey(Object? o) => o is CustomerServiceRequestsRecord;
}
