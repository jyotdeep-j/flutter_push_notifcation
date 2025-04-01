import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "purchase_time" field.
  DateTime? _purchaseTime;
  DateTime? get purchaseTime => _purchaseTime;
  bool hasPurchaseTime() => _purchaseTime != null;

  // "customer" field.
  DocumentReference? _customer;
  DocumentReference? get customer => _customer;
  bool hasCustomer() => _customer != null;

  // "payment_status" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "total_amount" field.
  double? _totalAmount;
  double get totalAmount => _totalAmount ?? 0.0;
  bool hasTotalAmount() => _totalAmount != null;

  // "items" field.
  List<OrderStruct>? _items;
  List<OrderStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "coupon_used" field.
  bool? _couponUsed;
  bool get couponUsed => _couponUsed ?? false;
  bool hasCouponUsed() => _couponUsed != null;

  // "coupon_code" field.
  String? _couponCode;
  String get couponCode => _couponCode ?? '';
  bool hasCouponCode() => _couponCode != null;

  // "coupon" field.
  DocumentReference? _coupon;
  DocumentReference? get coupon => _coupon;
  bool hasCoupon() => _coupon != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _purchaseTime = snapshotData['purchase_time'] as DateTime?;
    _customer = snapshotData['customer'] as DocumentReference?;
    _paymentStatus = snapshotData['payment_status'] as String?;
    _totalAmount = castToType<double>(snapshotData['total_amount']);
    _items = getStructList(
      snapshotData['items'],
      OrderStruct.fromMap,
    );
    _couponUsed = snapshotData['coupon_used'] as bool?;
    _couponCode = snapshotData['coupon_code'] as String?;
    _coupon = snapshotData['coupon'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  int? id,
  DateTime? purchaseTime,
  DocumentReference? customer,
  String? paymentStatus,
  double? totalAmount,
  bool? couponUsed,
  String? couponCode,
  DocumentReference? coupon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'purchase_time': purchaseTime,
      'customer': customer,
      'payment_status': paymentStatus,
      'total_amount': totalAmount,
      'coupon_used': couponUsed,
      'coupon_code': couponCode,
      'coupon': coupon,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.purchaseTime == e2?.purchaseTime &&
        e1?.customer == e2?.customer &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.totalAmount == e2?.totalAmount &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.couponUsed == e2?.couponUsed &&
        e1?.couponCode == e2?.couponCode &&
        e1?.coupon == e2?.coupon;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.id,
        e?.purchaseTime,
        e?.customer,
        e?.paymentStatus,
        e?.totalAmount,
        e?.items,
        e?.couponUsed,
        e?.couponCode,
        e?.coupon
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
