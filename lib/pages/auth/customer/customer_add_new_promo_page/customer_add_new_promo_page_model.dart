import '/backend/backend.dart';
import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_add_new_promo_page_widget.dart'
    show CustomerAddNewPromoPageWidget;
import 'package:flutter/material.dart';

class CustomerAddNewPromoPageModel
    extends FlutterFlowModel<CustomerAddNewPromoPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CustomerAddNewPromoPage widget.
  PartnersRecord? partnerData;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomerAddNewPromoPage widget.
  CategoriesRecord? industryRef;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SideBar component.
  late SideBarModel sideBarModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Model for SideBar component.
  late SideBarModel sideBarModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;

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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    sideBarModel2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
