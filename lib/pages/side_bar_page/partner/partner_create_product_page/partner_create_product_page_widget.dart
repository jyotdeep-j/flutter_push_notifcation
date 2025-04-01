import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/category_tab_widget.dart';
import '/components/detail_tab_widget.dart';
import '/components/pricing_tab_widget.dart';
import '/components/product_info_tab_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'partner_create_product_page_model.dart';
export 'partner_create_product_page_model.dart';

class PartnerCreateProductPageWidget extends StatefulWidget {
  const PartnerCreateProductPageWidget({
    super.key,
    this.product,
  });

  final ProductsRecord? product;

  @override
  State<PartnerCreateProductPageWidget> createState() =>
      _PartnerCreateProductPageWidgetState();
}

class _PartnerCreateProductPageWidgetState
    extends State<PartnerCreateProductPageWidget>
    with TickerProviderStateMixin {
  late PartnerCreateProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartnerCreateProductPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tags = await queryTagsRecordOnce();
      if (widget.product != null) {
        _model.editProduct = widget.product;
        safeSetState(() {});
      } else {
        var productsRecordReference = ProductsRecord.collection.doc();
        await productsRecordReference.set(createProductsRecordData(
          createdAt: getCurrentTimestamp,
          isDraft: true,
          partner: currentUserDocument?.partnerData,
          isApproved: false,
        ));
        _model.draftProduct = ProductsRecord.getDocumentFromData(
            createProductsRecordData(
              createdAt: getCurrentTimestamp,
              isDraft: true,
              partner: currentUserDocument?.partnerData,
              isApproved: false,
            ),
            productsRecordReference);
        _model.editProduct = _model.draftProduct;
        safeSetState(() {});
      }

      await _model.editProduct!.reference.update(createProductsRecordData(
        isApproved: false,
        isDraft: true,
      ));
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                header: wrapWithModel(
                  model: _model.headerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const HeaderWidget(),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                              model: _model.sideBarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const SideBarWidget(
                                active: 'company',
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            SizedBox(
                              height: 1500.0,
                              child: VerticalDivider(
                                thickness: 1.0,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          Flexible(
                            child: Container(
                              height: 3000.0,
                              constraints: const BoxConstraints(
                                maxWidth: 800.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (_model.editProduct != null) {
                                    return StreamBuilder<ProductsRecord>(
                                      stream: ProductsRecord.getDocument(
                                          _model.editProduct!.reference),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final tabBarProductsRecord =
                                            snapshot.data!;

                                        return Column(
                                          children: [
                                            Align(
                                              alignment: const Alignment(-1.0, 0),
                                              child: TabBar(
                                                isScrollable: true,
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                labelPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 0.0,
                                                            20.0, 0.0),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                unselectedLabelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                indicatorWeight: 4.0,
                                                padding: const EdgeInsets.all(4.0),
                                                tabs: const [
                                                  Tab(
                                                    text: 'Product info',
                                                  ),
                                                  Tab(
                                                    text: 'Categories',
                                                  ),
                                                  Tab(
                                                    text: 'Detail',
                                                  ),
                                                  Tab(
                                                    text: 'Pricing',
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                                onTap: (i) async {
                                                  [
                                                    () async {},
                                                    () async {},
                                                    () async {},
                                                    () async {}
                                                  ][i]();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                children: [
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .productInfoTabModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ProductInfoTabWidget(
                                                          doc:
                                                              tabBarProductsRecord,
                                                          onNext: () async {
                                                            safeSetState(() {
                                                              _model
                                                                  .tabBarController!
                                                                  .animateTo(
                                                                min(
                                                                    _model.tabBarController!
                                                                            .length -
                                                                        1,
                                                                    _model.tabBarController!
                                                                            .index +
                                                                        1),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .categoryTabModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            CategoryTabWidget(
                                                          ref:
                                                              tabBarProductsRecord,
                                                          onBack: () async {
                                                            safeSetState(() {
                                                              _model
                                                                  .tabBarController!
                                                                  .animateTo(
                                                                max(
                                                                    0,
                                                                    _model.tabBarController!
                                                                            .index -
                                                                        1),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            });
                                                          },
                                                          onNext: () async {
                                                            safeSetState(() {
                                                              _model
                                                                  .tabBarController!
                                                                  .animateTo(
                                                                min(
                                                                    _model.tabBarController!
                                                                            .length -
                                                                        1,
                                                                    _model.tabBarController!
                                                                            .index +
                                                                        1),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .detailTabModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: DetailTabWidget(
                                                          ref:
                                                              tabBarProductsRecord,
                                                          onNext: () async {
                                                            safeSetState(() {
                                                              _model
                                                                  .tabBarController!
                                                                  .animateTo(
                                                                min(
                                                                    _model.tabBarController!
                                                                            .length -
                                                                        1,
                                                                    _model.tabBarController!
                                                                            .index +
                                                                        1),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            });
                                                          },
                                                          onBack: () async {
                                                            safeSetState(() {
                                                              _model
                                                                  .tabBarController!
                                                                  .animateTo(
                                                                max(
                                                                    0,
                                                                    _model.tabBarController!
                                                                            .index -
                                                                        1),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .pricingTabModel,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child: PricingTabWidget(
                                                          ref:
                                                              tabBarProductsRecord,
                                                          onBack: () async {
                                                            safeSetState(() {
                                                              _model
                                                                  .tabBarController!
                                                                  .animateTo(
                                                                max(
                                                                    0,
                                                                    _model.tabBarController!
                                                                            .index -
                                                                        1),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            });
                                                          },
                                                          onSubmit: () async {
                                                            if (tabBarProductsRecord
                                                                    .hasName() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide a name',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (tabBarProductsRecord
                                                                    .hasDescription() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide a description',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (tabBarProductsRecord
                                                                    .hasAbout() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide an about',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (tabBarProductsRecord
                                                                    .hasMoreProductInfo() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide more product information',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (tabBarProductsRecord
                                                                    .hasInstallationGuide() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide an installation guide',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (!loggedIn) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide a pricing model',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (tabBarProductsRecord
                                                                    .hasFiles() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide product files',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (tabBarProductsRecord
                                                                    .hasPlans() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide a plan',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (tabBarProductsRecord
                                                                    .hasCategory() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide a category',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else if (tabBarProductsRecord
                                                                    .hasTags() ==
                                                                false) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Please provide product tags',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            } else {
                                                              await _model
                                                                  .editProduct!
                                                                  .reference
                                                                  .update(
                                                                      createProductsRecordData(
                                                                isDraft: false,
                                                                isApproved:
                                                                    false,
                                                              ));

                                                              context.pushNamed(
                                                                'PartnerProductsPage',
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      const TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                  ),
                                                                },
                                                              );

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    return Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 40.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Lottie.network(
                                                'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json',
                                                width: 150.0,
                                                height: 130.0,
                                                fit: BoxFit.contain,
                                                animate: true,
                                              ),
                                            ),
                                            Text(
                                              'Loading...',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 30.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
