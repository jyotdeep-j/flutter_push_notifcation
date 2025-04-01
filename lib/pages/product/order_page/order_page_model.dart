import '/backend/backend.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'order_page_widget.dart' show OrderPageWidget;
import 'package:flutter/material.dart';

class OrderPageModel extends FlutterFlowModel<OrderPageWidget> {
  ///  Local state fields for this page.

  List<String> countries = ['United States'];
  void addToCountries(String item) => countries.add(item);
  void removeFromCountries(String item) => countries.remove(item);
  void removeAtIndexFromCountries(int index) => countries.removeAt(index);
  void insertAtIndexInCountries(int index, String item) =>
      countries.insert(index, item);
  void updateCountriesAtIndex(int index, Function(String) updateFn) =>
      countries[index] = updateFn(countries[index]);

  String selectedPayment = 'card';

  CouponsRecord? coupon;

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode1;
  TextEditingController? emailFieldTextController1;
  String? Function(BuildContext, String?)? emailFieldTextController1Validator;
  String? _emailFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for PostalCodeField widget.
  FocusNode? postalCodeFieldFocusNode1;
  TextEditingController? postalCodeFieldTextController1;
  String? Function(BuildContext, String?)?
      postalCodeFieldTextController1Validator;
  String? _postalCodeFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  CouponsRecord? couponData;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? orderDoc;
  // Stores action output result for [Action Block - queryProduct] action in Button widget.
  ProductsRecord? ref;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode2;
  TextEditingController? emailFieldTextController2;
  String? Function(BuildContext, String?)? emailFieldTextController2Validator;
  String? _emailFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for PostalCodeField widget.
  FocusNode? postalCodeFieldFocusNode2;
  TextEditingController? postalCodeFieldTextController2;
  String? Function(BuildContext, String?)?
      postalCodeFieldTextController2Validator;
  String? _postalCodeFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  CouponsRecord? couponDataMobile;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    emailFieldTextController1Validator = _emailFieldTextController1Validator;
    postalCodeFieldTextController1Validator =
        _postalCodeFieldTextController1Validator;
    emailFieldTextController2Validator = _emailFieldTextController2Validator;
    postalCodeFieldTextController2Validator =
        _postalCodeFieldTextController2Validator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    emailFieldFocusNode1?.dispose();
    emailFieldTextController1?.dispose();

    postalCodeFieldFocusNode1?.dispose();
    postalCodeFieldTextController1?.dispose();

    emailFieldFocusNode2?.dispose();
    emailFieldTextController2?.dispose();

    postalCodeFieldFocusNode2?.dispose();
    postalCodeFieldTextController2?.dispose();

    footerModel.dispose();
  }

  /// Action blocks.
  Future<ProductsRecord?> queryProduct(
    BuildContext context, {
    DocumentReference? ref,
  }) async {
    ProductsRecord? newRef;

    newRef = await ProductsRecord.getDocumentOnce(ref!);
    return newRef;
  }
}
