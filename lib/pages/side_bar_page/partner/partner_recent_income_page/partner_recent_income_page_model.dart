import '/backend/backend.dart';
import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'partner_recent_income_page_widget.dart'
    show PartnerRecentIncomePageWidget;
import 'package:flutter/material.dart';

class PartnerRecentIncomePageModel
    extends FlutterFlowModel<PartnerRecentIncomePageWidget> {
  ///  Local state fields for this page.

  int page = 1;

  DateTime? date;

  List<ItemsRecord> orders = [];
  void addToOrders(ItemsRecord item) => orders.add(item);
  void removeFromOrders(ItemsRecord item) => orders.remove(item);
  void removeAtIndexFromOrders(int index) => orders.removeAt(index);
  void insertAtIndexInOrders(int index, ItemsRecord item) =>
      orders.insert(index, item);
  void updateOrdersAtIndex(int index, Function(ItemsRecord) updateFn) =>
      orders[index] = updateFn(orders[index]);

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
