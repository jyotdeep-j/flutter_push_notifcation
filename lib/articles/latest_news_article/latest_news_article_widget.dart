import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'latest_news_article_model.dart';
export 'latest_news_article_model.dart';

class LatestNewsArticleWidget extends StatefulWidget {
  const LatestNewsArticleWidget({
    super.key,
    required this.article,
  });

  final ArticlesRecord? article;

  @override
  State<LatestNewsArticleWidget> createState() =>
      _LatestNewsArticleWidgetState();
}

class _LatestNewsArticleWidgetState extends State<LatestNewsArticleWidget> {
  late LatestNewsArticleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestNewsArticleModel());

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
      height: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 290.0,
        maxHeight: 1500.0,
      ),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
              child: Image.network(
                widget.article!.image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEFF0E9),
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                color: const Color(0xFFDADADA),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 25.0, 15.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Color(0xFF404040),
                    size: 20.0,
                  ),
                  Text(
                    valueOrDefault<String>(
                      dateTimeFormat("d/M/y", widget.article?.publishedAt),
                      'Article Title',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: const Color(0xFF1C1C1C),
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(const SizedBox(width: 10.0)),
              ),
            ),
          ),
          AutoSizeText(
            valueOrDefault<String>(
              widget.article?.title,
              'Article Title',
            ),
            maxLines: 3,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 32.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          MarkdownBody(
            data: functions.truncateText(widget.article!.body),
            selectable: true,
            onTapLink: (_, url, __) => launchURL(url!),
          ),
          FFButtonWidget(
            onPressed: () async {
              context.pushNamed(
                'ArticlePage',
                queryParameters: {
                  'article': serializeParam(
                    widget.article,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'article': widget.article,
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                  ),
                },
              );
            },
            text: 'Read More',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Manrope',
                    color: Colors.black,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
        ].divide(const SizedBox(height: 25.0)),
      ),
    );
  }
}
