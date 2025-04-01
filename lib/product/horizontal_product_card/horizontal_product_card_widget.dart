import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'horizontal_product_card_model.dart';
export 'horizontal_product_card_model.dart';

class HorizontalProductCardWidget extends StatefulWidget {
  const HorizontalProductCardWidget({
    super.key,
    required this.product,
  });

  final ProductsRecord? product;

  @override
  State<HorizontalProductCardWidget> createState() =>
      _HorizontalProductCardWidgetState();
}

class _HorizontalProductCardWidgetState
    extends State<HorizontalProductCardWidget> {
  late HorizontalProductCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorizontalProductCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'ProductInformationPage',
          pathParameters: {
            'product': serializeParam(
              widget.product,
              ParamType.Document,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'product': widget.product,
          },
        );
      },
      child: Container(
        width: 400.0,
        height: 237.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.product!.image,
                  width: 69.0,
                  height: 74.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.jpg',
                    width: 69.0,
                    height: 74.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.product?.name,
                          'Product Name',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      AutoSizeText(
                        valueOrDefault<String>(
                          widget.product?.description,
                          'Product Description',
                        ),
                        maxLines: 2,
                        minFontSize: 10.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      StreamBuilder<List<ReviewsRecord>>(
                        stream: FFAppState().productsReviewCache(
                          uniqueQueryKey: widget.product?.reference.id,
                          requestFn: () => queryReviewsRecord(
                            parent: widget.product?.reference,
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ReviewsRecord> containerReviewsRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RatingBar.builder(
                                  onRatingUpdate: (newValue) => safeSetState(
                                      () => _model.ratingBarValue = newValue),
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFF6C035),
                                  ),
                                  direction: Axis.horizontal,
                                  initialRating: _model.ratingBarValue ??=
                                      functions.getAverageReviews(
                                          containerReviewsRecordList
                                              .map((e) => e.rating)
                                              .toList()),
                                  unratedColor: const Color(0x80F6C035),
                                  itemCount: 5,
                                  itemSize: 17.0,
                                  glowColor: const Color(0xFFF6C035),
                                ),
                                Text(
                                  '(${containerReviewsRecordList.length.toString()} Reviews)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
                          );
                        },
                      ),
                      const Divider(
                        height: 1.0,
                        thickness: 0.83,
                        color: Color(0xFFD4D4D4),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      widget.product?.plans.first.price,
                                      formatType: FormatType.custom,
                                      currency: '\$',
                                      format: '#,##0',
                                      locale: '',
                                    ),
                                    '\$0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.lineThrough,
                                        lineHeight: 1.0,
                                      ),
                                ),
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.product!.plans.first.onSale
                                              ? formatNumber(
                                                  widget.product?.plans.first
                                                      .discountPrice,
                                                  formatType: FormatType.custom,
                                                  currency: '\$',
                                                  format: '#,##0',
                                                  locale: '',
                                                )
                                              : formatNumber(
                                                  widget.product?.plans.first
                                                      .price,
                                                  formatType: FormatType.custom,
                                                  currency: '\$',
                                                  format: '#,##0',
                                                  locale: '',
                                                ),
                                          '\$0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 19.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '/lifetime',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.0,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'ProductInformationPage',
                                  pathParameters: {
                                    'product': serializeParam(
                                      widget.product,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'product': widget.product,
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              text: 'Buy Now',
                              options: FFButtonOptions(
                                height: 38.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: const Color(0xFF121212),
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 10.0)),
                      ),
                    ].divide(const SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ].divide(const SizedBox(width: 20.0)),
          ),
        ),
      ),
    );
  }
}
