import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomersRecord extends FirestoreRecord {
  CustomersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "profile_picture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "partner_data" field.
  DocumentReference? _partnerData;
  DocumentReference? get partnerData => _partnerData;
  bool hasPartnerData() => _partnerData != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _bio = snapshotData['bio'] as String?;
    _profilePicture = snapshotData['profile_picture'] as String?;
    _email = snapshotData['email'] as String?;
    _partnerData = snapshotData['partner_data'] as DocumentReference?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _countryCode = snapshotData['country_code'] as String?;
    _address = snapshotData['address'] as String?;
    _country = snapshotData['country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customers');

  static Stream<CustomersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomersRecord.fromSnapshot(s));

  static Future<CustomersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomersRecord.fromSnapshot(s));

  static CustomersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomersRecordData({
  String? id,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? bio,
  String? profilePicture,
  String? email,
  DocumentReference? partnerData,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? countryCode,
  String? address,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'bio': bio,
      'profile_picture': profilePicture,
      'email': email,
      'partner_data': partnerData,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'country_code': countryCode,
      'address': address,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomersRecordDocumentEquality implements Equality<CustomersRecord> {
  const CustomersRecordDocumentEquality();

  @override
  bool equals(CustomersRecord? e1, CustomersRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.bio == e2?.bio &&
        e1?.profilePicture == e2?.profilePicture &&
        e1?.email == e2?.email &&
        e1?.partnerData == e2?.partnerData &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.countryCode == e2?.countryCode &&
        e1?.address == e2?.address &&
        e1?.country == e2?.country;
  }

  @override
  int hash(CustomersRecord? e) => const ListEquality().hash([
        e?.id,
        e?.firstName,
        e?.lastName,
        e?.phoneNumber,
        e?.bio,
        e?.profilePicture,
        e?.email,
        e?.partnerData,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.countryCode,
        e?.address,
        e?.country
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomersRecord;
}
