import '/backend/backend.dart';
import '/elements/categories/categories_widget.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/footer_with_contact_field/footer_with_contact_field_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/hero_image/hero_image_widget.dart';
import '/elements/search_field/search_field_widget.dart';
import '/elements/signed_up_companies/signed_up_companies_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/landing_page/empower_business_session/empower_business_session_widget.dart';
import '/landing_page/key_benefits/key_benefits_widget.dart';
import '/landing_page/the_advantages/the_advantages_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'landing_page_model.dart';
export 'landing_page_model.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({super.key});

  @override
  State<LandingPageWidget> createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  late LandingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductsRecord>>(
      stream: FFAppState().productCache(
        requestFn: () => queryProductsRecord(
          queryBuilder: (productsRecord) => productsRecord
              .where(
            'is_approved',
            isEqualTo: true,
          )
              .where(
            'is_draft',
            isEqualTo: false,
          ),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ProductsRecord> landingPageProductsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Frame_471.jpg',
                        ).image,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StickyHeader(
                            overlapHeaders: false,
                            header: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              alignment: AlignmentDirectional(-1, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  wrapWithModel(
                                    model: _model.headerModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: HeaderWidget(),
                                  ),
                                ],
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional(0, 1),
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: wrapWithModel(
                                            model: _model.heroImageModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: HeroImageWidget(),
                                          ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 80),
                                            child: wrapWithModel(
                                              model: _model.categoriesModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CategoriesWidget(
                                                onChanged: (value) async {
                                                  if (_model.categoriesModel1
                                                      .webValue ==
                                                      '    All    ') {
                                                    return;
                                                  }

                                                  context.pushNamed(
                                                    'ShopPage',
                                                    queryParameters: {
                                                      'category':
                                                      serializeParam(
                                                        value,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                      TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                        PageTransitionType
                                                            .fade,
                                                      ),
                                                    },
                                                  );

                                                  return;
                                                },
                                              ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                5, 0, 5, 400),
                                            child: wrapWithModel(
                                              model: _model.searchFieldModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: SearchFieldWidget(
                                                products:
                                                landingPageProductsRecordList,
                                              ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                60, 0, 60, 180),
                                            child: wrapWithModel(
                                              model: _model.searchFieldModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: SearchFieldWidget(
                                                products:
                                                landingPageProductsRecordList,
                                              ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 280),
                                            child: wrapWithModel(
                                              model: _model.categoriesModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CategoriesWidget(
                                                onChanged: (value) async {
                                                  if (_model.categoriesModel2
                                                      .webValue ==
                                                      '    All    ') {
                                                    return;
                                                  }

                                                  context.pushNamed(
                                                    'ShopPage',
                                                    queryParameters: {
                                                      'category':
                                                      serializeParam(
                                                        value,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                      TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                        PageTransitionType
                                                            .fade,
                                                      ),
                                                    },
                                                  );

                                                  return;
                                                },
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0.89),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: wrapWithModel(
                            model: _model.signedUpCompaniesModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SignedUpCompaniesWidget(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                            child: wrapWithModel(
                              model: _model.empowerBusinessSessionModel,
                              updateCallback: () => safeSetState(() {}),
                              child: EmpowerBusinessSessionWidget(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: wrapWithModel(
                          model: _model.theAdvantagesModel,
                          updateCallback: () => safeSetState(() {}),
                          child: TheAdvantagesWidget(),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.keyBenefitsModel,
                        updateCallback: () => safeSetState(() {}),
                        child: KeyBenefitsWidget(),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        desktop: false,
                      ))
                        wrapWithModel(
                          model: _model.footerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: FooterWidget(),
                        ),
                    ],
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                  ))
                    wrapWithModel(
                      model: _model.footerWithContactFieldModel,
                      updateCallback: () => safeSetState(() {}),
                      child: FooterWithContactFieldWidget(),
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
