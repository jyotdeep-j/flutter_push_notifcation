import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'enter_coupon_dialog_widget.dart' show EnterCouponDialogWidget;
import 'package:flutter/material.dart';

class EnterCouponDialogModel extends FlutterFlowModel<EnterCouponDialogWidget> {
  ///  Local state fields for this component.

  bool? isCouponValid;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CouponTextField widget.
  FocusNode? couponTextFieldFocusNode;
  TextEditingController? couponTextFieldTextController;
  String? Function(BuildContext, String?)?
      couponTextFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CouponsRecord? coupon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    couponTextFieldFocusNode?.dispose();
    couponTextFieldTextController?.dispose();
  }
}
