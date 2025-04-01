import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/search_bar/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'partner_page_widget.dart' show PartnerPageWidget;
import 'package:flutter/material.dart';

class PartnerPageModel extends FlutterFlowModel<PartnerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SearchBar component.
  late SearchBarModel searchBarModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    searchBarModel = createModel(context, () => SearchBarModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    searchBarModel.dispose();
    footerModel.dispose();
  }
}
