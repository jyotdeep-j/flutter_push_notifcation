import '/articles/featured_article/featured_article_widget.dart';
import '/articles/other_featured_article/other_featured_article_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'featured_articles_widget.dart' show FeaturedArticlesWidget;
import 'package:flutter/material.dart';

class FeaturedArticlesModel extends FlutterFlowModel<FeaturedArticlesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for FeaturedArticle component.
  late FeaturedArticleModel featuredArticleModel;
  // Model for OtherFeaturedArticle component.
  late OtherFeaturedArticleModel otherFeaturedArticleModel1;
  // Model for OtherFeaturedArticle component.
  late OtherFeaturedArticleModel otherFeaturedArticleModel2;
  // Model for OtherFeaturedArticle component.
  late OtherFeaturedArticleModel otherFeaturedArticleModel3;
  // Model for OtherFeaturedArticle component.
  late OtherFeaturedArticleModel otherFeaturedArticleModel4;

  @override
  void initState(BuildContext context) {
    featuredArticleModel = createModel(context, () => FeaturedArticleModel());
    otherFeaturedArticleModel1 =
        createModel(context, () => OtherFeaturedArticleModel());
    otherFeaturedArticleModel2 =
        createModel(context, () => OtherFeaturedArticleModel());
    otherFeaturedArticleModel3 =
        createModel(context, () => OtherFeaturedArticleModel());
    otherFeaturedArticleModel4 =
        createModel(context, () => OtherFeaturedArticleModel());
  }

  @override
  void dispose() {
    featuredArticleModel.dispose();
    otherFeaturedArticleModel1.dispose();
    otherFeaturedArticleModel2.dispose();
    otherFeaturedArticleModel3.dispose();
    otherFeaturedArticleModel4.dispose();
  }
}
