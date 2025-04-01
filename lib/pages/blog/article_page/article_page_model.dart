import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/subscribe_footer/subscribe_footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'article_page_widget.dart' show ArticlePageWidget;
import 'package:flutter/material.dart';

class ArticlePageModel extends FlutterFlowModel<ArticlePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SubscribeFooter component.
  late SubscribeFooterModel subscribeFooterModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    subscribeFooterModel = createModel(context, () => SubscribeFooterModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    subscribeFooterModel.dispose();
    footerModel.dispose();
  }
}
