import '/elements/mobile_menu/mobile_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'header_login_widget.dart' show HeaderLoginWidget;
import 'package:flutter/material.dart';

class HeaderLoginModel extends FlutterFlowModel<HeaderLoginWidget> {
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
