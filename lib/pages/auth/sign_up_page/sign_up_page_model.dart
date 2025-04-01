import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for FirstNameField widget.
  FocusNode? firstNameFieldFocusNode1;
  TextEditingController? firstNameFieldTextController1;
  String? Function(BuildContext, String?)?
      firstNameFieldTextController1Validator;
  String? _firstNameFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LastNameField widget.
  FocusNode? lastNameFieldFocusNode1;
  TextEditingController? lastNameFieldTextController1;
  String? Function(BuildContext, String?)?
      lastNameFieldTextController1Validator;
  String? _lastNameFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode1;
  TextEditingController? passwordFieldTextController1;
  late bool passwordFieldVisibility1;
  String? Function(BuildContext, String?)?
      passwordFieldTextController1Validator;
  String? _passwordFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ConfirmPasswordField widget.
  FocusNode? confirmPasswordFieldFocusNode1;
  TextEditingController? confirmPasswordFieldTextController1;
  late bool confirmPasswordFieldVisibility1;
  String? Function(BuildContext, String?)?
      confirmPasswordFieldTextController1Validator;
  String? _confirmPasswordFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TabChoiceChips widget.
  FormFieldController<List<String>>? tabChoiceChipsValueController;
  String? get tabChoiceChipsValue =>
      tabChoiceChipsValueController?.value?.firstOrNull;
  set tabChoiceChipsValue(String? val) =>
      tabChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for FirstNameField widget.
  FocusNode? firstNameFieldFocusNode2;
  TextEditingController? firstNameFieldTextController2;
  String? Function(BuildContext, String?)?
      firstNameFieldTextController2Validator;
  String? _firstNameFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for LastNameField widget.
  FocusNode? lastNameFieldFocusNode2;
  TextEditingController? lastNameFieldTextController2;
  String? Function(BuildContext, String?)?
      lastNameFieldTextController2Validator;
  String? _lastNameFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode2;
  TextEditingController? passwordFieldTextController2;
  late bool passwordFieldVisibility2;
  String? Function(BuildContext, String?)?
      passwordFieldTextController2Validator;
  String? _passwordFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ConfirmPasswordField widget.
  FocusNode? confirmPasswordFieldFocusNode2;
  TextEditingController? confirmPasswordFieldTextController2;
  late bool confirmPasswordFieldVisibility2;
  String? Function(BuildContext, String?)?
      confirmPasswordFieldTextController2Validator;
  String? _confirmPasswordFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for WebChoiceChips widget.
  FormFieldController<List<String>>? webChoiceChipsValueController;
  String? get webChoiceChipsValue =>
      webChoiceChipsValueController?.value?.firstOrNull;
  set webChoiceChipsValue(String? val) =>
      webChoiceChipsValueController?.value = val != null ? [val] : [];
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    firstNameFieldTextController1Validator =
        _firstNameFieldTextController1Validator;
    lastNameFieldTextController1Validator =
        _lastNameFieldTextController1Validator;
    emailFieldTextController1Validator = _emailFieldTextController1Validator;
    passwordFieldVisibility1 = false;
    passwordFieldTextController1Validator =
        _passwordFieldTextController1Validator;
    confirmPasswordFieldVisibility1 = false;
    confirmPasswordFieldTextController1Validator =
        _confirmPasswordFieldTextController1Validator;
    firstNameFieldTextController2Validator =
        _firstNameFieldTextController2Validator;
    lastNameFieldTextController2Validator =
        _lastNameFieldTextController2Validator;
    emailFieldTextController2Validator = _emailFieldTextController2Validator;
    passwordFieldVisibility2 = false;
    passwordFieldTextController2Validator =
        _passwordFieldTextController2Validator;
    confirmPasswordFieldVisibility2 = false;
    confirmPasswordFieldTextController2Validator =
        _confirmPasswordFieldTextController2Validator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    firstNameFieldFocusNode1?.dispose();
    firstNameFieldTextController1?.dispose();

    lastNameFieldFocusNode1?.dispose();
    lastNameFieldTextController1?.dispose();

    emailFieldFocusNode1?.dispose();
    emailFieldTextController1?.dispose();

    passwordFieldFocusNode1?.dispose();
    passwordFieldTextController1?.dispose();

    confirmPasswordFieldFocusNode1?.dispose();
    confirmPasswordFieldTextController1?.dispose();

    firstNameFieldFocusNode2?.dispose();
    firstNameFieldTextController2?.dispose();

    lastNameFieldFocusNode2?.dispose();
    lastNameFieldTextController2?.dispose();

    emailFieldFocusNode2?.dispose();
    emailFieldTextController2?.dispose();

    passwordFieldFocusNode2?.dispose();
    passwordFieldTextController2?.dispose();

    confirmPasswordFieldFocusNode2?.dispose();
    confirmPasswordFieldTextController2?.dispose();

    footerModel.dispose();
  }
}
