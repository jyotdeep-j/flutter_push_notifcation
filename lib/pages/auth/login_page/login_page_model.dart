import '/elements/footer/footer_widget.dart';
import '/elements/header_login/header_login_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for HeaderLogin component.
  late HeaderLoginModel headerLoginModel;
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
      return 'Please enter a valid email address';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode1;
  TextEditingController? passwordFieldTextController1;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordFieldTextController1Validator;
  String? _passwordFieldTextController1Validator(
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
      return 'Please enter a valid email address';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode2;
  TextEditingController? passwordFieldTextController2;
  String? Function(BuildContext, String?)?
      passwordFieldTextController2Validator;
  String? _passwordFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerLoginModel = createModel(context, () => HeaderLoginModel());
    emailFieldTextController1Validator = _emailFieldTextController1Validator;
    passwordFieldVisibility = false;
    passwordFieldTextController1Validator =
        _passwordFieldTextController1Validator;
    emailFieldTextController2Validator = _emailFieldTextController2Validator;
    passwordFieldTextController2Validator =
        _passwordFieldTextController2Validator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerLoginModel.dispose();
    emailFieldFocusNode1?.dispose();
    emailFieldTextController1?.dispose();

    passwordFieldFocusNode1?.dispose();
    passwordFieldTextController1?.dispose();

    emailFieldFocusNode2?.dispose();
    emailFieldTextController2?.dispose();

    passwordFieldFocusNode2?.dispose();
    passwordFieldTextController2?.dispose();

    footerModel.dispose();
  }
}
