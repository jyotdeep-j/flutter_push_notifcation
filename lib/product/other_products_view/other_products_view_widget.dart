import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product/no_products_text/no_products_text_widget.dart';
import '/product/product_card/product_card_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'other_products_view_model.dart';
export 'other_products_view_model.dart';

class OtherProductsViewWidget extends StatefulWidget {
  const OtherProductsViewWidget({
    super.key,
    required this.title,
    required this.list,
    required this.onSeeAll,
  });

  final String? title;
  final List<ProductsRecord>? list;
  final Future Function()? onSeeAll;

  @override
  State<OtherProductsViewWidget> createState() =>
      _OtherProductsViewWidgetState();
}

class _OtherProductsViewWidgetState extends State<OtherProductsViewWidget> {
  late OtherProductsViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherProductsViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(-1.0, 0.0),
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              valueOrDefault<double>(
                () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                    return 20.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointLarge) {
                    return 30.0;
                  } else {
                    return 70.0;
                  }
                }(),
                0.0,
              ),
              35.0,
              valueOrDefault<double>(
                () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                    return 20.0;
                  } else if (MediaQuery.sizeOf(context).width <
                      kBreakpointLarge) {
                    return 30.0;
                  } else {
                    return 70.0;
                  }
                }(),
                0.0,
              ),
              35.0),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        valueOrDefault<String>(
                          widget.title,
                          'Title',
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 36.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.onSeeAll?.call();
                      },
                      child: Text(
                        'See all',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 20.0)),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Builder(
                    builder: (context) {
                      final product = functions
                          .paginateProducts(
                              widget.list!.unique((e) => e.reference).toList(),
                              _model.page, () {
                            if (MediaQuery.sizeOf(context).width >
                                kBreakpointLarge) {
                              return 3;
                            } else if (MediaQuery.sizeOf(context).width >
                                kBreakpointMedium) {
                              return 2;
                            } else if (MediaQuery.sizeOf(context).width > 0.0) {
                              return 1;
                            } else {
                              return 1;
                            }
                          }())
                          .toList()
                          .take(3)
                          .toList();
                      if (product.isEmpty) {
                        return Center(
                          child: NoProductsTextWidget(
                            onGoBack: () async {
                              _model.page = 1;
                              safeSetState(() {});
                            },
                          ),
                        );
                      }

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(product.length, (productIndex) {
                          final productItem = product[productIndex];
                          return Expanded(
                            child: ProductCardWidget(
                              key: Key(
                                  'Keycob_${productIndex}_of_${product.length}'),
                              product: productItem,
                            ),
                          );
                        }).divide(const SizedBox(width: 20.0)),
                      );
                    },
                  ),
                ),
              ].divide(const SizedBox(height: 20.0)),
            ),
          ),
        ),
        if ((functions.paginateProducts(
                widget.list!.unique((e) => e.reference).toList(), _model.page,
                () {
              if (MediaQuery.sizeOf(context).width > kBreakpointLarge) {
                return 3;
              } else if (MediaQuery.sizeOf(context).width > kBreakpointMedium) {
                return 2;
              } else if (MediaQuery.sizeOf(context).width > 0.0) {
                return 1;
              } else {
                return 1;
              }
            }()).isNotEmpty) &&
            responsiveVisibility(
              context: context,
              phone: false,
            ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 200.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              fillColor: FlutterFlowTheme.of(context).secondary,
              icon: const Icon(
                Icons.chevron_left_sharp,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                if (_model.page > 1) {
                  _model.page = _model.page + -1;
                  safeSetState(() {});
                  return;
                } else {
                  return;
                }
              },
            ),
          ),
        if ((functions.paginateProducts(
                widget.list!.unique((e) => e.reference).toList(), _model.page,
                () {
              if (MediaQuery.sizeOf(context).width > kBreakpointLarge) {
                return 3;
              } else if (MediaQuery.sizeOf(context).width > kBreakpointMedium) {
                return 2;
              } else if (MediaQuery.sizeOf(context).width > 0.0) {
                return 1;
              } else {
                return 1;
              }
            }()).isNotEmpty) &&
            responsiveVisibility(
              context: context,
              phone: false,
            ))
          Align(
            alignment: const AlignmentDirectional(1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 35.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 200.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                fillColor: FlutterFlowTheme.of(context).secondary,
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  _model.page = _model.page + 1;
                  safeSetState(() {});
                },
              ),
            ),
          ),
      ],
    );
  }
}
