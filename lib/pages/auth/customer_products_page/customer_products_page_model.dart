import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_products_page_widget.dart' show CustomerProductsPageWidget;
import 'package:flutter/material.dart';

class CustomerProductsPageModel
    extends FlutterFlowModel<CustomerProductsPageWidget> {
  ///  Local state fields for this page.

  int page = 1;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SideBar component.
  late SideBarModel sideBarModel1;
  // Model for SideBar component.
  late SideBarModel sideBarModel2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    sideBarModel1 = createModel(context, () => SideBarModel());
    sideBarModel2 = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    sideBarModel1.dispose();
    sideBarModel2.dispose();
  }
}
