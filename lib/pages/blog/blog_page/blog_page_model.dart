import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'blog_page_widget.dart' show BlogPageWidget;
import 'package:flutter/material.dart';

class BlogPageModel extends FlutterFlowModel<BlogPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    footerModel.dispose();
  }
}
