import '/backend/backend.dart';
import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_transaction_history_page_widget.dart'
    show CustomerTransactionHistoryPageWidget;
import 'package:flutter/material.dart';

class CustomerTransactionHistoryPageModel
    extends FlutterFlowModel<CustomerTransactionHistoryPageWidget> {
  ///  Local state fields for this page.

  bool viewPaymentMethod = false;

  int page = 1;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  List<ItemsRecord>? filters;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    sideBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
