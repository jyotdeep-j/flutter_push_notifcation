import '/backend/backend.dart';
import '/components/my_profile_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_profile_page_widget.dart' show CustomerProfilePageWidget;
import 'package:flutter/material.dart';

class CustomerProfilePageModel
    extends FlutterFlowModel<CustomerProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in CustomerProfilePage widget.
  PartnersRecord? partnerData;
  // Stores action output result for [Firestore Query - Query a collection] action in CustomerProfilePage widget.
  CategoriesRecord? industryRef;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SideBar component.
  late SideBarModel sideBarModel1;
  // Model for MyProfile component.
  late MyProfileModel myProfileModel1;
  // Model for SideBar component.
  late SideBarModel sideBarModel2;
  // Model for MyProfile component.
  late MyProfileModel myProfileModel2;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    sideBarModel1 = createModel(context, () => SideBarModel());
    myProfileModel1 = createModel(context, () => MyProfileModel());
    sideBarModel2 = createModel(context, () => SideBarModel());
    myProfileModel2 = createModel(context, () => MyProfileModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    sideBarModel1.dispose();
    myProfileModel1.dispose();
    sideBarModel2.dispose();
    myProfileModel2.dispose();
  }
}
