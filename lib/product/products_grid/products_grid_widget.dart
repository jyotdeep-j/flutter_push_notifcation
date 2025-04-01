import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product/brief_product_card/brief_product_card_widget.dart';
import 'package:flutter/material.dart';
import 'products_grid_model.dart';
export 'products_grid_model.dart';

class ProductsGridWidget extends StatefulWidget {
  const ProductsGridWidget({
    super.key,
    required this.productList,
  });

  final List<ProductsRecord>? productList;

  @override
  State<ProductsGridWidget> createState() => _ProductsGridWidgetState();
}

class _ProductsGridWidgetState extends State<ProductsGridWidget> {
  late ProductsGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsGridModel());

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
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          tabletLandscape: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(35.0, 30.0, 35.0, 60.0),
            child: Builder(
              builder: (context) {
                final product = widget.productList!.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 0.65,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: product.length,
                  itemBuilder: (context, productIndex) {
                    final productItem = product[productIndex];
                    return BriefProductCardWidget(
                      key: Key('Keykdx_${productIndex}_of_${product.length}'),
                      product: productItem,
                    );
                  },
                );
              },
            ),
          ),
        if (responsiveVisibility(
          context: context,
          phone: false,
          tabletLandscape: false,
          desktop: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(35.0, 30.0, 35.0, 60.0),
            child: Builder(
              builder: (context) {
                final product = widget.productList!.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 0.7,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: product.length,
                  itemBuilder: (context, productIndex) {
                    final productItem = product[productIndex];
                    return Container(
                        width: 100, height: 100, color: Colors.green);
                  },
                );
              },
            ),
          ),
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          desktop: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(35.0, 30.0, 35.0, 60.0),
            child: Builder(
              builder: (context) {
                final product = widget.productList!.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 0.6,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: product.length,
                  itemBuilder: (context, productIndex) {
                    final productItem = product[productIndex];
                    return BriefProductCardWidget(
                      key: Key('Keyqvs_${productIndex}_of_${product.length}'),
                      product: productItem,
                    );
                  },
                );
              },
            ),
          ),
        if (responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 30.0, 25.0, 60.0),
            child: Builder(
              builder: (context) {
                final product = widget.productList!.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 0.65,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: product.length,
                  itemBuilder: (context, productIndex) {
                    final productItem = product[productIndex];
                    return BriefProductCardWidget(
                      key: Key('Keyw5b_${productIndex}_of_${product.length}'),
                      product: productItem,
                    );
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
