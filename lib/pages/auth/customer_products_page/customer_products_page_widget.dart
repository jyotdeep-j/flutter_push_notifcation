import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/elements/empty_products/empty_products_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product/brief_product_card/brief_product_card_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'customer_products_page_model.dart';
export 'customer_products_page_model.dart';

class CustomerProductsPageWidget extends StatefulWidget {
  const CustomerProductsPageWidget({super.key});

  @override
  State<CustomerProductsPageWidget> createState() =>
      _CustomerProductsPageWidgetState();
}

class _CustomerProductsPageWidgetState
    extends State<CustomerProductsPageWidget> {
  late CustomerProductsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerProductsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ItemsRecord>>(
      stream: queryItemsRecord(
        queryBuilder: (itemsRecord) => itemsRecord.where(
          'customer',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ItemsRecord> customerProductsPageItemsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StickyHeader(
                    overlapHeaders: false,
                    header: Container(
                      decoration: const BoxDecoration(),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Frame_65.png',
                            ).image,
                          ),
                        ),
                        child: wrapWithModel(
                          model: _model.headerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const HeaderWidget(),
                        ),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          Padding(
                            padding: EdgeInsets.all(valueOrDefault<double>(
                              functions.getResponsivePadding(
                                  MediaQuery.sizeOf(context).width),
                              0.0,
                            )),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  wrapWithModel(
                                    model: _model.sideBarModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const SideBarWidget(
                                      active: 'products',
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  SizedBox(
                                    height: 1000.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Products',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                          ))
                                            Builder(
                                              builder: (context) {
                                                final product = functions
                                                    .paginatePurchases(
                                                        customerProductsPageItemsRecordList
                                                            .toList(),
                                                        _model.page,
                                                        6)
                                                    .unique((e) => e.product!)
                                                    .toList();
                                                if (product.isEmpty) {
                                                  return const EmptyProductsWidget();
                                                }

                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio: 0.75,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: product.length,
                                                  itemBuilder:
                                                      (context, productIndex) {
                                                    final productItem =
                                                        product[productIndex];
                                                    return StreamBuilder<
                                                        ProductsRecord>(
                                                      stream: ProductsRecord
                                                          .getDocument(
                                                              productItem
                                                                  .product!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final briefProductCardProductsRecord =
                                                            snapshot.data!;

                                                        return BriefProductCardWidget(
                                                          key: Key(
                                                              'Keykdm_${productIndex}_of_${product.length}'),
                                                          product:
                                                              briefProductCardProductsRecord,
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                            Builder(
                                              builder: (context) {
                                                final product = functions
                                                    .paginatePurchases(
                                                        customerProductsPageItemsRecordList
                                                            .toList(),
                                                        _model.page,
                                                        6)
                                                    .unique((e) => e.product!)
                                                    .toList();
                                                if (product.isEmpty) {
                                                  return const EmptyProductsWidget();
                                                }

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      product.length,
                                                      (productIndex) {
                                                    final productItem =
                                                        product[productIndex];
                                                    return StreamBuilder<
                                                        ProductsRecord>(
                                                      stream: ProductsRecord
                                                          .getDocument(
                                                              productItem
                                                                  .product!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final briefProductCardProductsRecord =
                                                            snapshot.data!;

                                                        return BriefProductCardWidget(
                                                          key: Key(
                                                              'Keyi8h_${productIndex}_of_${product.length}'),
                                                          product:
                                                              briefProductCardProductsRecord,
                                                        );
                                                      },
                                                    );
                                                  }).divide(
                                                      const SizedBox(height: 20.0)),
                                                );
                                              },
                                            ),
                                          if ((customerProductsPageItemsRecordList
                                                  .isNotEmpty) &&
                                              responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                              ))
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderRadius: 200.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 60.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  icon: const Icon(
                                                    Icons.chevron_left,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    if (_model.page >= 0) {
                                                      _model.page =
                                                          _model.page + 1;
                                                      safeSetState(() {});
                                                      return;
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 200.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 60.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  icon: const Icon(
                                                    Icons.chevron_right_sharp,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    if (_model.page >= 0) {
                                                      _model.page =
                                                          _model.page + 1;
                                                      safeSetState(() {});
                                                      return;
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                ),
                                              ].divide(const SizedBox(width: 20.0)),
                                            ),
                                        ].divide(const SizedBox(height: 15.0)),
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 40.0)),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                        ))
                          Padding(
                            padding: EdgeInsets.all(valueOrDefault<double>(
                              functions.getResponsivePadding(
                                  MediaQuery.sizeOf(context).width),
                              0.0,
                            )),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  wrapWithModel(
                                    model: _model.sideBarModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const SideBarWidget(
                                      active: 'products',
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  SizedBox(
                                    height: 1000.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Products',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                          ))
                                            Builder(
                                              builder: (context) {
                                                final product = functions
                                                    .paginatePurchases(
                                                        customerProductsPageItemsRecordList
                                                            .toList(),
                                                        _model.page,
                                                        6)
                                                    .unique((e) => e.product!)
                                                    .toList();
                                                if (product.isEmpty) {
                                                  return const EmptyProductsWidget();
                                                }

                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio: 0.75,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: product.length,
                                                  itemBuilder:
                                                      (context, productIndex) {
                                                    final productItem =
                                                        product[productIndex];
                                                    return StreamBuilder<
                                                        ProductsRecord>(
                                                      stream: ProductsRecord
                                                          .getDocument(
                                                              productItem
                                                                  .product!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final briefProductCardProductsRecord =
                                                            snapshot.data!;

                                                        return BriefProductCardWidget(
                                                          key: Key(
                                                              'Key9ia_${productIndex}_of_${product.length}'),
                                                          product:
                                                              briefProductCardProductsRecord,
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                            Builder(
                                              builder: (context) {
                                                final product = functions
                                                    .paginatePurchases(
                                                        customerProductsPageItemsRecordList
                                                            .toList(),
                                                        _model.page,
                                                        6)
                                                    .unique((e) => e.product!)
                                                    .toList();
                                                if (product.isEmpty) {
                                                  return const EmptyProductsWidget();
                                                }

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      product.length,
                                                      (productIndex) {
                                                    final productItem =
                                                        product[productIndex];
                                                    return StreamBuilder<
                                                        ProductsRecord>(
                                                      stream: ProductsRecord
                                                          .getDocument(
                                                              productItem
                                                                  .product!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final briefProductCardProductsRecord =
                                                            snapshot.data!;

                                                        return BriefProductCardWidget(
                                                          key: Key(
                                                              'Keyo3l_${productIndex}_of_${product.length}'),
                                                          product:
                                                              briefProductCardProductsRecord,
                                                        );
                                                      },
                                                    );
                                                  }).divide(
                                                      const SizedBox(height: 20.0)),
                                                );
                                              },
                                            ),
                                          if ((customerProductsPageItemsRecordList
                                                  .isNotEmpty) &&
                                              responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                              ))
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 200.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 60.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  icon: const Icon(
                                                    Icons.chevron_left,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    if (_model.page >= 0) {
                                                      _model.page =
                                                          _model.page + 1;
                                                      safeSetState(() {});
                                                      return;
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 200.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 60.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  icon: const Icon(
                                                    Icons.chevron_right_sharp,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    if (_model.page >= 0) {
                                                      _model.page =
                                                          _model.page + 1;
                                                      safeSetState(() {});
                                                      return;
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                ),
                                              ].divide(const SizedBox(width: 20.0)),
                                            ),
                                        ].divide(const SizedBox(height: 15.0)),
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 5.0)),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Frame_515.png',
                        ).image,
                      ),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                '© 2024 Nimbus. All rights reserved.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    'Privacy Policy',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    'Terms and Condtions',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
