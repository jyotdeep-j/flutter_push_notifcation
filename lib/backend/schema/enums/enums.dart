import 'package:collection/collection.dart';

enum ProductTypes {
  All,
  Apps,
  Courses,
  Industries,
  NewArrival,
}

enum ProductApproval {
  Published,
  Pending,
}

enum PaymentStatus {
  Paid,
  Failed,
  Pending,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ProductTypes):
      return ProductTypes.values.deserialize(value) as T?;
    case (ProductApproval):
      return ProductApproval.values.deserialize(value) as T?;
    case (PaymentStatus):
      return PaymentStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
