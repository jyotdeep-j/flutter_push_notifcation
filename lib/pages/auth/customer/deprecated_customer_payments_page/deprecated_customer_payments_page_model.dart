import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'deprecated_customer_payments_page_widget.dart'
    show DeprecatedCustomerPaymentsPageWidget;
import 'package:flutter/material.dart';

class DeprecatedCustomerPaymentsPageModel
    extends FlutterFlowModel<DeprecatedCustomerPaymentsPageWidget> {
  ///  Local state fields for this page.

  bool viewPaymentMethod = false;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    sideBarModel.dispose();
  }
}
