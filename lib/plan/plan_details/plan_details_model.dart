import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'plan_details_widget.dart' show PlanDetailsWidget;
import 'package:flutter/material.dart';

class PlanDetailsModel extends FlutterFlowModel<PlanDetailsWidget> {
  ///  Local state fields for this component.

  PlanStruct? plan;
  void updatePlanStruct(Function(PlanStruct) updateFn) {
    updateFn(plan ??= PlanStruct());
  }

  bool isFree = false;

  bool hasDiscount = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for PriceField widget.
  FocusNode? priceFieldFocusNode;
  TextEditingController? priceFieldTextController;
  String? Function(BuildContext, String?)? priceFieldTextControllerValidator;
  String? _priceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DiscountField widget.
  FocusNode? discountFieldFocusNode;
  TextEditingController? discountFieldTextController;
  String? Function(BuildContext, String?)? discountFieldTextControllerValidator;
  // State field(s) for FreebieCheckbox widget.
  bool? freebieCheckboxValue;
  // State field(s) for DiscountCheckbox widget.
  bool? discountCheckboxValue;
  // State field(s) for FestureField widget.
  FocusNode? festureFieldFocusNode;
  TextEditingController? festureFieldTextController;
  String? Function(BuildContext, String?)? festureFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    priceFieldTextControllerValidator = _priceFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    discountFieldFocusNode?.dispose();
    discountFieldTextController?.dispose();

    festureFieldFocusNode?.dispose();
    festureFieldTextController?.dispose();
  }
}
