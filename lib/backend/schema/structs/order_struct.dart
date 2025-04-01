// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderStruct extends FFFirebaseStruct {
  OrderStruct({
    int? quantity,
    PlanStruct? plan,
    DocumentReference? product,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quantity = quantity,
        _plan = plan,
        _product = product,
        super(firestoreUtilData);

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "plan" field.
  PlanStruct? _plan;
  PlanStruct get plan => _plan ?? PlanStruct();
  set plan(PlanStruct? val) => _plan = val;

  void updatePlan(Function(PlanStruct) updateFn) {
    updateFn(_plan ??= PlanStruct());
  }

  bool hasPlan() => _plan != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  set product(DocumentReference? val) => _product = val;

  bool hasProduct() => _product != null;

  static OrderStruct fromMap(Map<String, dynamic> data) => OrderStruct(
        quantity: castToType<int>(data['quantity']),
        plan: PlanStruct.maybeFromMap(data['plan']),
        product: data['product'] as DocumentReference?,
      );

  static OrderStruct? maybeFromMap(dynamic data) =>
      data is Map ? OrderStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'quantity': _quantity,
        'plan': _plan?.toMap(),
        'product': _product,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'plan': serializeParam(
          _plan,
          ParamType.DataStruct,
        ),
        'product': serializeParam(
          _product,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static OrderStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderStruct(
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        plan: deserializeStructParam(
          data['plan'],
          ParamType.DataStruct,
          false,
          structBuilder: PlanStruct.fromSerializableMap,
        ),
        product: deserializeParam(
          data['product'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
      );

  static OrderStruct fromAlgoliaData(Map<String, dynamic> data) => OrderStruct(
        quantity: convertAlgoliaParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        plan: convertAlgoliaParam(
          data['plan'],
          ParamType.DataStruct,
          false,
          structBuilder: PlanStruct.fromAlgoliaData,
        ),
        product: convertAlgoliaParam(
          data['product'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'OrderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderStruct &&
        quantity == other.quantity &&
        plan == other.plan &&
        product == other.product;
  }

  @override
  int get hashCode => const ListEquality().hash([quantity, plan, product]);
}

OrderStruct createOrderStruct({
  int? quantity,
  PlanStruct? plan,
  DocumentReference? product,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderStruct(
      quantity: quantity,
      plan: plan ?? (clearUnsetFields ? PlanStruct() : null),
      product: product,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderStruct? updateOrderStruct(
  OrderStruct? order, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    order
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderStructData(
  Map<String, dynamic> firestoreData,
  OrderStruct? order,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (order == null) {
    return;
  }
  if (order.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && order.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderData = getOrderFirestoreData(order, forFieldValue);
  final nestedData = orderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = order.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderFirestoreData(
  OrderStruct? order, [
  bool forFieldValue = false,
]) {
  if (order == null) {
    return {};
  }
  final firestoreData = mapToFirestore(order.toMap());

  // Handle nested data for "plan" field.
  addPlanStructData(
    firestoreData,
    order.hasPlan() ? order.plan : null,
    'plan',
    forFieldValue,
  );

  // Add any Firestore field values
  order.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderListFirestoreData(
  List<OrderStruct>? orders,
) =>
    orders?.map((e) => getOrderFirestoreData(e, true)).toList() ?? [];
