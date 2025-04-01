import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "partner" field.
  DocumentReference? _partner;
  DocumentReference? get partner => _partner;
  bool hasPartner() => _partner != null;

  // "is_approved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "more_product_info" field.
  String? _moreProductInfo;
  String get moreProductInfo => _moreProductInfo ?? '';
  bool hasMoreProductInfo() => _moreProductInfo != null;

  // "installation_guide" field.
  String? _installationGuide;
  String get installationGuide => _installationGuide ?? '';
  bool hasInstallationGuide() => _installationGuide != null;

  // "pricing" field.
  String? _pricing;
  String get pricing => _pricing ?? '';
  bool hasPricing() => _pricing != null;

  // "files" field.
  List<String>? _files;
  List<String> get files => _files ?? const [];
  bool hasFiles() => _files != null;

  // "plans" field.
  List<PlanStruct>? _plans;
  List<PlanStruct> get plans => _plans ?? const [];
  bool hasPlans() => _plans != null;

  // "faqs" field.
  List<FrequentlyAskedQuestionStruct>? _faqs;
  List<FrequentlyAskedQuestionStruct> get faqs => _faqs ?? const [];
  bool hasFaqs() => _faqs != null;

  // "category" field.
  DocumentReference? _category;
  DocumentReference? get category => _category;
  bool hasCategory() => _category != null;

  // "is_draft" field.
  bool? _isDraft;
  bool get isDraft => _isDraft ?? false;
  bool hasIsDraft() => _isDraft != null;

  // "tags" field.
  List<DocumentReference>? _tags;
  List<DocumentReference> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _partner = snapshotData['partner'] as DocumentReference?;
    _isApproved = snapshotData['is_approved'] as bool?;
    _about = snapshotData['about'] as String?;
    _moreProductInfo = snapshotData['more_product_info'] as String?;
    _installationGuide = snapshotData['installation_guide'] as String?;
    _pricing = snapshotData['pricing'] as String?;
    _files = getDataList(snapshotData['files']);
    _plans = getStructList(
      snapshotData['plans'],
      PlanStruct.fromMap,
    );
    _faqs = getStructList(
      snapshotData['faqs'],
      FrequentlyAskedQuestionStruct.fromMap,
    );
    _category = snapshotData['category'] as DocumentReference?;
    _isDraft = snapshotData['is_draft'] as bool?;
    _tags = getDataList(snapshotData['tags']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  static ProductsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'modified_at': convertAlgoliaParam(
            snapshot.data['modified_at'],
            ParamType.DateTime,
            false,
          ),
          'image': snapshot.data['image'],
          'partner': convertAlgoliaParam(
            snapshot.data['partner'],
            ParamType.DocumentReference,
            false,
          ),
          'is_approved': snapshot.data['is_approved'],
          'about': snapshot.data['about'],
          'more_product_info': snapshot.data['more_product_info'],
          'installation_guide': snapshot.data['installation_guide'],
          'pricing': snapshot.data['pricing'],
          'files': safeGet(
            () => snapshot.data['files'].toList(),
          ),
          'plans': safeGet(
            () => (snapshot.data['plans'] as Iterable)
                .map((d) => PlanStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'faqs': safeGet(
            () => (snapshot.data['faqs'] as Iterable)
                .map((d) =>
                    FrequentlyAskedQuestionStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'category': convertAlgoliaParam(
            snapshot.data['category'],
            ParamType.DocumentReference,
            false,
          ),
          'is_draft': snapshot.data['is_draft'],
          'tags': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['tags'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
        },
        ProductsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'products',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  String? description,
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? image,
  DocumentReference? partner,
  bool? isApproved,
  String? about,
  String? moreProductInfo,
  String? installationGuide,
  String? pricing,
  DocumentReference? category,
  bool? isDraft,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'image': image,
      'partner': partner,
      'is_approved': isApproved,
      'about': about,
      'more_product_info': moreProductInfo,
      'installation_guide': installationGuide,
      'pricing': pricing,
      'category': category,
      'is_draft': isDraft,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.image == e2?.image &&
        e1?.partner == e2?.partner &&
        e1?.isApproved == e2?.isApproved &&
        e1?.about == e2?.about &&
        e1?.moreProductInfo == e2?.moreProductInfo &&
        e1?.installationGuide == e2?.installationGuide &&
        e1?.pricing == e2?.pricing &&
        listEquality.equals(e1?.files, e2?.files) &&
        listEquality.equals(e1?.plans, e2?.plans) &&
        listEquality.equals(e1?.faqs, e2?.faqs) &&
        e1?.category == e2?.category &&
        e1?.isDraft == e2?.isDraft &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.createdAt,
        e?.modifiedAt,
        e?.image,
        e?.partner,
        e?.isApproved,
        e?.about,
        e?.moreProductInfo,
        e?.installationGuide,
        e?.pricing,
        e?.files,
        e?.plans,
        e?.faqs,
        e?.category,
        e?.isDraft,
        e?.tags
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
