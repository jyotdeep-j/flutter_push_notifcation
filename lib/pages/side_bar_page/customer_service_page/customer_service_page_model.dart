import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_service_page_widget.dart' show CustomerServicePageWidget;
import 'package:flutter/material.dart';

class CustomerServicePageModel
    extends FlutterFlowModel<CustomerServicePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for SubjectField widget.
  FocusNode? subjectFieldFocusNode;
  TextEditingController? subjectFieldTextController;
  String? Function(BuildContext, String?)? subjectFieldTextControllerValidator;
  String? _subjectFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for MessageField widget.
  FocusNode? messageFieldFocusNode;
  TextEditingController? messageFieldTextController;
  String? Function(BuildContext, String?)? messageFieldTextControllerValidator;
  String? _messageFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    sideBarModel = createModel(context, () => SideBarModel());
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    subjectFieldTextControllerValidator = _subjectFieldTextControllerValidator;
    messageFieldTextControllerValidator = _messageFieldTextControllerValidator;
  }

  @override
  void dispose() {
    headerModel.dispose();
    sideBarModel.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    subjectFieldFocusNode?.dispose();
    subjectFieldTextController?.dispose();

    messageFieldFocusNode?.dispose();
    messageFieldTextController?.dispose();
  }
}
