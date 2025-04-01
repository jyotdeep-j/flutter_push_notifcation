import '/auth/firebase_auth/auth_util.dart';
import '/elements/tab/tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mobile_menu_model.dart';
export 'mobile_menu_model.dart';

class MobileMenuWidget extends StatefulWidget {
  const MobileMenuWidget({
    super.key,
    String? active,
    required this.onClose,
  }) : active = active ?? 'profile';

  final String active;
  final Future Function()? onClose;

  @override
  State<MobileMenuWidget> createState() => _MobileMenuWidgetState();
}

class _MobileMenuWidgetState extends State<MobileMenuWidget> {
  late MobileMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MobileMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Opacity(
            opacity: 0.5,
            child: SafeArea(
              child: Container(
                width: 100.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 1.0,
            constraints: const BoxConstraints(
              maxWidth: 320.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 30.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await widget.onClose?.call();
                        },
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 28.0,
                        ),
                      ),
                    ),
                    Text(
                      'Menu',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (!loggedIn)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('LoginPage');
                        },
                        child: wrapWithModel(
                          model: _model.tabModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: TabWidget(
                            text: 'Login',
                            icon: Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 28.0,
                            ),
                            isSelected: widget.active == 'profile',
                          ),
                        ),
                      ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'CartPage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      child: wrapWithModel(
                        model: _model.tabModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: TabWidget(
                          text: 'Cart',
                          icon: Icon(
                            Icons.shopping_cart,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 28.0,
                          ),
                          isSelected: widget.active == 'profile',
                        ),
                      ),
                    ),
                    if (loggedIn)
                      Text(
                        'Profile Details',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    if (loggedIn)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'CustomerProfilePage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: wrapWithModel(
                          model: _model.tabModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: TabWidget(
                            text: 'Profile',
                            icon: Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 28.0,
                            ),
                            isSelected: widget.active == 'profile',
                          ),
                        ),
                      ),
                    if (loggedIn)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'CustomerProductsPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: wrapWithModel(
                          model: _model.tabModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: TabWidget(
                            text: 'Products',
                            icon: Icon(
                              Icons.list_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 28.0,
                            ),
                            isSelected: widget.active == 'products',
                          ),
                        ),
                      ),
                    if (loggedIn)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'CustomerCouponsPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: wrapWithModel(
                          model: _model.tabModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: TabWidget(
                            text: 'Coupon Promo',
                            icon: Icon(
                              Icons.content_cut,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 28.0,
                            ),
                            isSelected: widget.active == 'coupon',
                          ),
                        ),
                      ),
                    if (loggedIn)
                      SizedBox(
                        width: 256.0,
                        child: Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    if (currentUserDocument?.partnerData != null)
                      AuthUserStreamWidget(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (loggedIn)
                              Text(
                                'Partner',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            if (loggedIn)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'PartnerProfilePage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: wrapWithModel(
                                  model: _model.tabModel6,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TabWidget(
                                    text: 'Company',
                                    icon: Icon(
                                      Icons.person,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 28.0,
                                    ),
                                    isSelected: widget.active == 'company',
                                  ),
                                ),
                              ),
                            if (loggedIn)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'PartnerProductsPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: wrapWithModel(
                                  model: _model.tabModel7,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TabWidget(
                                    text: 'Sell Products',
                                    icon: Icon(
                                      Icons.sell,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 28.0,
                                    ),
                                    isSelected: widget.active == 'sell',
                                  ),
                                ),
                              ),
                            if (loggedIn)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'PartnerSalesPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: wrapWithModel(
                                  model: _model.tabModel8,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TabWidget(
                                    text: 'Sales',
                                    icon: Icon(
                                      Icons.analytics_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 28.0,
                                    ),
                                    isSelected: widget.active == 'sales',
                                  ),
                                ),
                              ),
                            if (loggedIn)
                              SizedBox(
                                width: 256.0,
                                child: Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                    if (loggedIn)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'CustomerServicePage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        },
                        child: wrapWithModel(
                          model: _model.tabModel9,
                          updateCallback: () => safeSetState(() {}),
                          child: TabWidget(
                            text: 'Customer Service',
                            icon: Icon(
                              Icons.support_agent,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 28.0,
                            ),
                            isSelected: widget.active == 'customer',
                          ),
                        ),
                      ),
                    if (loggedIn)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('LandingPage', context.mounted);
                        },
                        child: wrapWithModel(
                          model: _model.tabModel10,
                          updateCallback: () => safeSetState(() {}),
                          child: const TabWidget(
                            text: 'Logout',
                            icon: Icon(
                              Icons.logout,
                              color: Color(0xFFC81616),
                              size: 28.0,
                            ),
                            isSelected: false,
                          ),
                        ),
                      ),
                    Container(
                      width: 100.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setDarkModeSetting(context, ThemeMode.light);
                              },
                              child: Icon(
                                Icons.light_mode,
                                color: valueOrDefault<Color>(
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? const Color(0xFFE4A606)
                                      : const Color(0xFF8A8A8A),
                                  const Color(0xFF8A8A8A),
                                ),
                                size: 28.0,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setDarkModeSetting(context, ThemeMode.dark);
                              },
                              child: Icon(
                                Icons.dark_mode,
                                color: valueOrDefault<Color>(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? FlutterFlowTheme.of(context).secondary
                                      : const Color(0xFF8A8A8A),
                                  const Color(0xFF8A8A8A),
                                ),
                                size: 28.0,
                              ),
                            ),
                          ].divide(const SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 15.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
