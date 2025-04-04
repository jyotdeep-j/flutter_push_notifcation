import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _cart = (await secureStorage.getStringList('ff_cart'))
              ?.map((x) {
                try {
                  return OrderStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<OrderStruct> _cart = [];
  List<OrderStruct> get cart => _cart;
  set cart(List<OrderStruct> value) {
    _cart = value;
    secureStorage.setStringList(
        'ff_cart', value.map((x) => x.serialize()).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(OrderStruct value) {
    cart.add(value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeFromCart(OrderStruct value) {
    cart.remove(value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void updateCartAtIndex(
    int index,
    OrderStruct Function(OrderStruct) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCart(int index, OrderStruct value) {
    cart.insert(index, value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  double _taxRate = 0.22;
  double get taxRate => _taxRate;
  set taxRate(double value) {
    _taxRate = value;
  }

  final _productCacheManager = StreamRequestManager<List<ProductsRecord>>();
  Stream<List<ProductsRecord>> productCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProductsRecord>> Function() requestFn,
  }) =>
      _productCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductCacheCache() => _productCacheManager.clear();
  void clearProductCacheCacheKey(String? uniqueKey) =>
      _productCacheManager.clearRequest(uniqueKey);

  final _reviewCacheManager = StreamRequestManager<List<ReviewsRecord>>();
  Stream<List<ReviewsRecord>> reviewCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ReviewsRecord>> Function() requestFn,
  }) =>
      _reviewCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearReviewCacheCache() => _reviewCacheManager.clear();
  void clearReviewCacheCacheKey(String? uniqueKey) =>
      _reviewCacheManager.clearRequest(uniqueKey);

  final _industriesCacheManager = StreamRequestManager<List<TagsRecord>>();
  Stream<List<TagsRecord>> industriesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TagsRecord>> Function() requestFn,
  }) =>
      _industriesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearIndustriesCacheCache() => _industriesCacheManager.clear();
  void clearIndustriesCacheCacheKey(String? uniqueKey) =>
      _industriesCacheManager.clearRequest(uniqueKey);

  final _productsReviewCacheManager =
      StreamRequestManager<List<ReviewsRecord>>();
  Stream<List<ReviewsRecord>> productsReviewCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ReviewsRecord>> Function() requestFn,
  }) =>
      _productsReviewCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductsReviewCacheCache() => _productsReviewCacheManager.clear();
  void clearProductsReviewCacheCacheKey(String? uniqueKey) =>
      _productsReviewCacheManager.clearRequest(uniqueKey);

  final _categoriesCacheManager =
      StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> categoriesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _categoriesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoriesCacheCache() => _categoriesCacheManager.clear();
  void clearCategoriesCacheCacheKey(String? uniqueKey) =>
      _categoriesCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
