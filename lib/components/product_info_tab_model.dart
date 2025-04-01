import '/flutter_flow/flutter_flow_util.dart';
import 'product_info_tab_widget.dart' show ProductInfoTabWidget;
import 'package:flutter/material.dart';

class ProductInfoTabModel extends FlutterFlowModel<ProductInfoTabWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ProductNameField widget.
  FocusNode? productNameFieldFocusNode;
  TextEditingController? productNameFieldTextController;
  String? Function(BuildContext, String?)?
      productNameFieldTextControllerValidator;
  String? _productNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode1;
  TextEditingController? descriptionFieldTextController1;
  String? Function(BuildContext, String?)?
      descriptionFieldTextController1Validator;
  String? _descriptionFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

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

  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode2;
  TextEditingController? descriptionFieldTextController2;
  String? Function(BuildContext, String?)?
      descriptionFieldTextController2Validator;
  String? _descriptionFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for ProducURLField widget.
  FocusNode? producURLFieldFocusNode;
  TextEditingController? producURLFieldTextController;
  String? Function(BuildContext, String?)?
      producURLFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    productNameFieldTextControllerValidator =
        _productNameFieldTextControllerValidator;
    descriptionFieldTextController1Validator =
        _descriptionFieldTextController1Validator;
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    descriptionFieldTextController2Validator =
        _descriptionFieldTextController2Validator;
  }

  @override
  void dispose() {
    productNameFieldFocusNode?.dispose();
    productNameFieldTextController?.dispose();

    descriptionFieldFocusNode1?.dispose();
    descriptionFieldTextController1?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    descriptionFieldFocusNode2?.dispose();
    descriptionFieldTextController2?.dispose();

    producURLFieldFocusNode?.dispose();
    producURLFieldTextController?.dispose();
  }
}
