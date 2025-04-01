import '/articles/latest_news_article/latest_news_article_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'latest_news_widget.dart' show LatestNewsWidget;
import 'package:flutter/material.dart';

class LatestNewsModel extends FlutterFlowModel<LatestNewsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for LatestNewsArticle component.
  late LatestNewsArticleModel latestNewsArticleModel;

  @override
  void initState(BuildContext context) {
    latestNewsArticleModel =
        createModel(context, () => LatestNewsArticleModel());
  }

  @override
  void dispose() {
    latestNewsArticleModel.dispose();
  }
}
