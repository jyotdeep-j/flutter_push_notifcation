import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product/brief_product_card/brief_product_card_widget.dart';
import '/product/no_products_text/no_products_text_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'featured_product_view_model.dart';
export 'featured_product_view_model.dart';

class FeaturedProductViewWidget extends StatefulWidget {
  const FeaturedProductViewWidget({
    super.key,
    required this.products,
  });

  final List<ProductsRecord>? products;

  @override
  State<FeaturedProductViewWidget> createState() =>
      _FeaturedProductViewWidgetState();
}

class _FeaturedProductViewWidgetState extends State<FeaturedProductViewWidget> {
  late FeaturedProductViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeaturedProductViewModel());

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
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final product = functions
                          .paginateProducts(
                              widget.products!
                                  .unique((e) => e.reference)
                                  .toList(),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(product.length, (productIndex) {
                          final productItem = product[productIndex];
                          return BriefProductCardWidget(
                            key: Key(
                                'Keywxo_${productIndex}_of_${product.length}'),
                            product: productItem,
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
        if (functions.paginateProducts(
            widget.products!.unique((e) => e.reference).toList(), _model.page,
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
        }()).isNotEmpty)
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
        if (functions.paginateProducts(
            widget.products!.unique((e) => e.reference).toList(), _model.page,
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
        }()).isNotEmpty)
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
