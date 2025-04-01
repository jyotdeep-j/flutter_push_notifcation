import '/articles/latest_news_article/latest_news_article_widget.dart';
import '/articles/other_news_article/other_news_article_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'latest_news_model.dart';
export 'latest_news_model.dart';

class LatestNewsWidget extends StatefulWidget {
  const LatestNewsWidget({
    super.key,
    required this.articles,
  });

  final List<ArticlesRecord>? articles;

  @override
  State<LatestNewsWidget> createState() => _LatestNewsWidgetState();
}

class _LatestNewsWidgetState extends State<LatestNewsWidget> {
  late LatestNewsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestNewsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1500.0,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: wrapWithModel(
                    model: _model.latestNewsArticleModel,
                    updateCallback: () => safeSetState(() {}),
                    child: LatestNewsArticleWidget(
                      article: widget.articles!.last,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1.0,
                  color: Color(0xFFADA9A9),
                ),
              ].divide(const SizedBox(height: 20.0)),
            ),
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
          ))
            Expanded(
              child: Builder(
                builder: (context) {
                  final articles = widget.articles!.toList().take(3).toList();

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(articles.length, (articlesIndex) {
                      final articlesItem = articles[articlesIndex];
                      return Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OtherNewsArticleWidget(
                              key: Key(
                                  'Keybsa_${articlesIndex}_of_${articles.length}'),
                              article: articlesItem,
                            ),
                            const Divider(
                              height: 40.0,
                              thickness: 1.0,
                              color: Color(0xFFADA9A9),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
        ].divide(const SizedBox(width: 40.0)),
      ),
    );
  }
}
