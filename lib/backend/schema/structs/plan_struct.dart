// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanStruct extends FFFirebaseStruct {
  PlanStruct({
    String? name,
    double? price,
    double? discountPrice,
    List<String>? features,
    bool? isRecommended,
    bool? onSale,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _price = price,
        _discountPrice = discountPrice,
        _features = features,
        _isRecommended = isRecommended,
        _onSale = onSale,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "discount_price" field.
  double? _discountPrice;
  double get discountPrice => _discountPrice ?? 0.0;
  set discountPrice(double? val) => _discountPrice = val;

  void incrementDiscountPrice(double amount) =>
      discountPrice = discountPrice + amount;

  bool hasDiscountPrice() => _discountPrice != null;

  // "features" field.
  List<String>? _features;
  List<String> get features => _features ?? const [];
  set features(List<String>? val) => _features = val;

  void updateFeatures(Function(List<String>) updateFn) {
    updateFn(_features ??= []);
  }

  bool hasFeatures() => _features != null;

  // "isRecommended" field.
  bool? _isRecommended;
  bool get isRecommended => _isRecommended ?? false;
  set isRecommended(bool? val) => _isRecommended = val;

  bool hasIsRecommended() => _isRecommended != null;

  // "on_sale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  set onSale(bool? val) => _onSale = val;

  bool hasOnSale() => _onSale != null;

  static PlanStruct fromMap(Map<String, dynamic> data) => PlanStruct(
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        discountPrice: castToType<double>(data['discount_price']),
        features: getDataList(data['features']),
        isRecommended: data['isRecommended'] as bool?,
        onSale: data['on_sale'] as bool?,
      );

  static PlanStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlanStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'discount_price': _discountPrice,
        'features': _features,
        'isRecommended': _isRecommended,
        'on_sale': _onSale,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'discount_price': serializeParam(
          _discountPrice,
          ParamType.double,
        ),
        'features': serializeParam(
          _features,
          ParamType.String,
          isList: true,
        ),
        'isRecommended': serializeParam(
          _isRecommended,
          ParamType.bool,
        ),
        'on_sale': serializeParam(
          _onSale,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PlanStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        discountPrice: deserializeParam(
          data['discount_price'],
          ParamType.double,
          false,
        ),
        features: deserializeParam<String>(
          data['features'],
          ParamType.String,
          true,
        ),
        isRecommended: deserializeParam(
          data['isRecommended'],
          ParamType.bool,
          false,
        ),
        onSale: deserializeParam(
          data['on_sale'],
          ParamType.bool,
          false,
        ),
      );

  static PlanStruct fromAlgoliaData(Map<String, dynamic> data) => PlanStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        discountPrice: convertAlgoliaParam(
          data['discount_price'],
          ParamType.double,
          false,
        ),
        features: convertAlgoliaParam<String>(
          data['features'],
          ParamType.String,
          true,
        ),
        isRecommended: convertAlgoliaParam(
          data['isRecommended'],
          ParamType.bool,
          false,
        ),
        onSale: convertAlgoliaParam(
          data['on_sale'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlanStruct &&
        name == other.name &&
        price == other.price &&
        discountPrice == other.discountPrice &&
        listEquality.equals(features, other.features) &&
        isRecommended == other.isRecommended &&
        onSale == other.onSale;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, price, discountPrice, features, isRecommended, onSale]);
}

PlanStruct createPlanStruct({
  String? name,
  double? price,
  double? discountPrice,
  bool? isRecommended,
  bool? onSale,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanStruct(
      name: name,
      price: price,
      discountPrice: discountPrice,
      isRecommended: isRecommended,
      onSale: onSale,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanStruct? updatePlanStruct(
  PlanStruct? plan, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    plan
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanStructData(
  Map<String, dynamic> firestoreData,
  PlanStruct? plan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (plan == null) {
    return;
  }
  if (plan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && plan.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planData = getPlanFirestoreData(plan, forFieldValue);
  final nestedData = planData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = plan.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanFirestoreData(
  PlanStruct? plan, [
  bool forFieldValue = false,
]) {
  if (plan == null) {
    return {};
  }
  final firestoreData = mapToFirestore(plan.toMap());

  // Add any Firestore field values
  plan.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanListFirestoreData(
  List<PlanStruct>? plans,
) =>
    plans?.map((e) => getPlanFirestoreData(e, true)).toList() ?? [];
