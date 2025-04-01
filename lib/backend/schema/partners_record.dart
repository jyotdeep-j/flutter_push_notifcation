import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartnersRecord extends FirestoreRecord {
  PartnersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "contact_person" field.
  String? _contactPerson;
  String get contactPerson => _contactPerson ?? '';
  bool hasContactPerson() => _contactPerson != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "socials" field.
  SocialsStruct? _socials;
  SocialsStruct get socials => _socials ?? SocialsStruct();
  bool hasSocials() => _socials != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "address" field.
  LatLng? _address;
  LatLng? get address => _address;
  bool hasAddress() => _address != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "industry" field.
  List<String>? _industry;
  List<String> get industry => _industry ?? const [];
  bool hasIndustry() => _industry != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _bio = snapshotData['bio'] as String?;
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _country = snapshotData['country'] as String?;
    _contactPerson = snapshotData['contact_person'] as String?;
    _website = snapshotData['website'] as String?;
    _socials = SocialsStruct.maybeFromMap(snapshotData['socials']);
    _logo = snapshotData['logo'] as String?;
    _address = snapshotData['address'] as LatLng?;
    _countryCode = snapshotData['country_code'] as String?;
    _industry = getDataList(snapshotData['industry']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('partners');

  static Stream<PartnersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartnersRecord.fromSnapshot(s));

  static Future<PartnersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartnersRecord.fromSnapshot(s));

  static PartnersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PartnersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartnersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartnersRecord._(reference, mapFromFirestore(data));

  static PartnersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PartnersRecord.getDocumentFromData(
        {
          'id': snapshot.data['id'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'name': snapshot.data['name'],
          'bio': snapshot.data['bio'],
          'email': snapshot.data['email'],
          'phone_number': snapshot.data['phone_number'],
          'country': snapshot.data['country'],
          'contact_person': snapshot.data['contact_person'],
          'website': snapshot.data['website'],
          'socials':
              SocialsStruct.fromAlgoliaData(snapshot.data['socials'] ?? {})
                  .toMap(),
          'logo': snapshot.data['logo'],
          'address': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'country_code': snapshot.data['country_code'],
          'industry': safeGet(
            () => snapshot.data['industry'].toList(),
          ),
        },
        PartnersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PartnersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'partners',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PartnersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartnersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartnersRecordData({
  String? id,
  DateTime? createdAt,
  String? name,
  String? bio,
  String? email,
  String? phoneNumber,
  String? country,
  String? contactPerson,
  String? website,
  SocialsStruct? socials,
  String? logo,
  LatLng? address,
  String? countryCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'created_at': createdAt,
      'name': name,
      'bio': bio,
      'email': email,
      'phone_number': phoneNumber,
      'country': country,
      'contact_person': contactPerson,
      'website': website,
      'socials': SocialsStruct().toMap(),
      'logo': logo,
      'address': address,
      'country_code': countryCode,
    }.withoutNulls,
  );

  // Handle nested data for "socials" field.
  addSocialsStructData(firestoreData, socials, 'socials');

  return firestoreData;
}

class PartnersRecordDocumentEquality implements Equality<PartnersRecord> {
  const PartnersRecordDocumentEquality();

  @override
  bool equals(PartnersRecord? e1, PartnersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.createdAt == e2?.createdAt &&
        e1?.name == e2?.name &&
        e1?.bio == e2?.bio &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.country == e2?.country &&
        e1?.contactPerson == e2?.contactPerson &&
        e1?.website == e2?.website &&
        e1?.socials == e2?.socials &&
        e1?.logo == e2?.logo &&
        e1?.address == e2?.address &&
        e1?.countryCode == e2?.countryCode &&
        listEquality.equals(e1?.industry, e2?.industry);
  }

  @override
  int hash(PartnersRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdAt,
        e?.name,
        e?.bio,
        e?.email,
        e?.phoneNumber,
        e?.country,
        e?.contactPerson,
        e?.website,
        e?.socials,
        e?.logo,
        e?.address,
        e?.countryCode,
        e?.industry
      ]);

  @override
  bool isValidKey(Object? o) => o is PartnersRecord;
}
