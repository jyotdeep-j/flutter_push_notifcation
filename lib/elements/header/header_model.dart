import '/elements/mobile_menu/mobile_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_widget.dart' show HeaderWidget;
import 'package:flutter/material.dart';

class HeaderModel extends FlutterFlowModel<HeaderWidget> {
  ///  Local state fields for this component.

  bool isMenuVisible = false;

  ///  State fields for stateful widgets in this component.

  // Model for MobileMenu component.
  late MobileMenuModel mobileMenuModel;

  @override
  void initState(BuildContext context) {
    mobileMenuModel = createModel(context, () => MobileMenuModel());
  }

  @override
  void dispose() {
    mobileMenuModel.dispose();
  }
}
