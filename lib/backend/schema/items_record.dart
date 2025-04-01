import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "plan" field.
  PlanStruct? _plan;
  PlanStruct get plan => _plan ?? PlanStruct();
  bool hasPlan() => _plan != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "partner" field.
  DocumentReference? _partner;
  DocumentReference? get partner => _partner;
  bool hasPartner() => _partner != null;

  // "parent" field.
  DocumentReference? _parent;
  DocumentReference? get parent => _parent;
  bool hasParent() => _parent != null;

  // "customer" field.
  DocumentReference? _customer;
  DocumentReference? get customer => _customer;
  bool hasCustomer() => _customer != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _product = snapshotData['product'] as DocumentReference?;
    _plan = PlanStruct.maybeFromMap(snapshotData['plan']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _partner = snapshotData['partner'] as DocumentReference?;
    _parent = snapshotData['parent'] as DocumentReference?;
    _customer = snapshotData['customer'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('items')
          : FirebaseFirestore.instance.collectionGroup('items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('items').doc(id);

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  DocumentReference? product,
  PlanStruct? plan,
  int? quantity,
  DocumentReference? partner,
  DocumentReference? parent,
  DocumentReference? customer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product': product,
      'plan': PlanStruct().toMap(),
      'quantity': quantity,
      'partner': partner,
      'parent': parent,
      'customer': customer,
    }.withoutNulls,
  );

  // Handle nested data for "plan" field.
  addPlanStructData(firestoreData, plan, 'plan');

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.product == e2?.product &&
        e1?.plan == e2?.plan &&
        e1?.quantity == e2?.quantity &&
        e1?.partner == e2?.partner &&
        e1?.parent == e2?.parent &&
        e1?.customer == e2?.customer;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash(
      [e?.product, e?.plan, e?.quantity, e?.partner, e?.parent, e?.customer]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
