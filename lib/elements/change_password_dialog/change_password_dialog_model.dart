import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_dialog_widget.dart' show ChangePasswordDialogWidget;
import 'package:flutter/material.dart';

class ChangePasswordDialogModel
    extends FlutterFlowModel<ChangePasswordDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CurrentPasswordTextField widget.
  FocusNode? currentPasswordTextFieldFocusNode;
  TextEditingController? currentPasswordTextFieldTextController;
  late bool currentPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordTextFieldTextControllerValidator;
  // State field(s) for NewPasswordTextField widget.
  FocusNode? newPasswordTextFieldFocusNode;
  TextEditingController? newPasswordTextFieldTextController;
  late bool newPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      newPasswordTextFieldTextControllerValidator;
  // State field(s) for ConfirmPasswordTextField widget.
  FocusNode? confirmPasswordTextFieldFocusNode;
  TextEditingController? confirmPasswordTextFieldTextController;
  late bool confirmPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextFieldTextControllerValidator;
  // Stores action output result for [Custom Action - changeUserPassword] action in Button widget.
  String? isSuccessful;

  @override
  void initState(BuildContext context) {
    currentPasswordTextFieldVisibility = false;
    newPasswordTextFieldVisibility = false;
    confirmPasswordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    currentPasswordTextFieldFocusNode?.dispose();
    currentPasswordTextFieldTextController?.dispose();

    newPasswordTextFieldFocusNode?.dispose();
    newPasswordTextFieldTextController?.dispose();

    confirmPasswordTextFieldFocusNode?.dispose();
    confirmPasswordTextFieldTextController?.dispose();
  }
}
