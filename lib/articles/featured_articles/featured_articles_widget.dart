import '/articles/featured_article/featured_article_widget.dart';
import '/articles/other_featured_article/other_featured_article_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'featured_articles_model.dart';
export 'featured_articles_model.dart';

class FeaturedArticlesWidget extends StatefulWidget {
  const FeaturedArticlesWidget({
    super.key,
    required this.articles,
  });

  final List<ArticlesRecord>? articles;

  @override
  State<FeaturedArticlesWidget> createState() => _FeaturedArticlesWidgetState();
}

class _FeaturedArticlesWidgetState extends State<FeaturedArticlesWidget> {
  late FeaturedArticlesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeaturedArticlesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Popular article',
          maxLines: 1,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Manrope',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 48.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
          child: wrapWithModel(
            model: _model.featuredArticleModel,
            updateCallback: () => safeSetState(() {}),
            child: FeaturedArticleWidget(
              article: widget.articles!.last,
            ),
          ),
        ),
        const Divider(
          thickness: 1.0,
          color: Color(0xFFADA9A9),
        ),
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          tabletLandscape: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 580.0,
              decoration: const BoxDecoration(),
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Visibility(
                visible: responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ),
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 40.0,
                    mainAxisSpacing: 30.0,
                    childAspectRatio: 2.4,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    wrapWithModel(
                      model: _model.otherFeaturedArticleModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: OtherFeaturedArticleWidget(
                        article: widget.articles!.first,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.otherFeaturedArticleModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: OtherFeaturedArticleWidget(
                        article: widget.articles![1],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.otherFeaturedArticleModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: OtherFeaturedArticleWidget(
                        article: widget.articles![2],
                      ),
                    ),
                    wrapWithModel(
                      model: _model.otherFeaturedArticleModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: OtherFeaturedArticleWidget(
                        article: widget.articles!.last,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
