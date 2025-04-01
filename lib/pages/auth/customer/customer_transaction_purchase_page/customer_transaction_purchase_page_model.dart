import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_transaction_purchase_page_widget.dart'
    show CustomerTransactionPurchasePageWidget;
import 'package:flutter/material.dart';

class CustomerTransactionPurchasePageModel
    extends FlutterFlowModel<CustomerTransactionPurchasePageWidget> {
  ///  Local state fields for this page.

  bool viewPaymentMethod = false;

  int page = 1;

  DateTime? date;

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
