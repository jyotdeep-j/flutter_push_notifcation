import '/auth/firebase_auth/auth_util.dart';
import '/elements/tab/tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'side_bar_model.dart';
export 'side_bar_model.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({
    super.key,
    String? active,
  }) : active = active ?? 'profile';

  final String active;

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  late SideBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideBarModel());

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
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Buyer Profile',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
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
              model: _model.tabModel1,
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
                'CustomerTransactionPurchasePage',
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
                text: 'Purchase',
                icon: Icon(
                  Icons.local_offer,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 28.0,
                ),
                isSelected: widget.active == 'purchase',
              ),
            ),
          ),
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
                'Deprecated-CustomerPaymentsPage',
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
                text: 'Payment',
                icon: Icon(
                  Icons.credit_card,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 28.0,
                ),
                isSelected: widget.active == 'payment',
              ),
            ),
          ),
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
              model: _model.tabModel4,
              updateCallback: () => safeSetState(() {}),
              child: TabWidget(
                text: 'Promo Codes',
                icon: Icon(
                  Icons.content_cut,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 28.0,
                ),
                isSelected: widget.active == 'coupon',
              ),
            ),
          ),
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
                'CustomerWishlistPage',
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
                text: 'Wishlist',
                icon: Icon(
                  Icons.favorite_border,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 28.0,
                ),
                isSelected: widget.active == 'wishlist',
              ),
            ),
          ),
          if (currentUserDocument?.partnerData != null)
            AuthUserStreamWidget(
              builder: (context) => SizedBox(
                width: 256.0,
                child: Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
            ),
          if (currentUserDocument?.partnerData != null)
            AuthUserStreamWidget(
              builder: (context) => Text(
                'Your Seller Profile',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          if (currentUserDocument?.partnerData != null)
            AuthUserStreamWidget(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
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
                  model: _model.tabModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: TabWidget(
                    text: 'Your Listings',
                    icon: Icon(
                      Icons.dashboard_customize_outlined,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 28.0,
                    ),
                    isSelected: widget.active == 'listing',
                  ),
                ),
              ),
            ),
          if (currentUserDocument?.partnerData != null)
            AuthUserStreamWidget(
              builder: (context) => InkWell(
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
                  model: _model.tabModel7,
                  updateCallback: () => safeSetState(() {}),
                  child: TabWidget(
                    text: 'Sales',
                    icon: Icon(
                      Icons.analytics_sharp,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 28.0,
                    ),
                    isSelected: widget.active == 'sales',
                  ),
                ),
              ),
            ),
          if (currentUserDocument?.partnerData != null)
            AuthUserStreamWidget(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'CustomerAddNewPromoPage',
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
                    text: 'Add Promo Codes',
                    icon: Icon(
                      Icons.discount,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 28.0,
                    ),
                    isSelected: widget.active == 'sales',
                  ),
                ),
              ),
            ),
          if (currentUserDocument?.partnerData != null)
            AuthUserStreamWidget(
              builder: (context) => SizedBox(
                width: 256.0,
                child: Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
            ),
          if (currentUserDocument?.partnerData != null)
            AuthUserStreamWidget(
              builder: (context) => Text(
                'Support',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          if (currentUserDocument?.partnerData != null)
            AuthUserStreamWidget(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'CustomerTransactionFAQPage',
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
                    text: 'FAQ',
                    icon: Icon(
                      Icons.question_mark_outlined,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 28.0,
                    ),
                    isSelected: widget.active == 'sales',
                  ),
                ),
              ),
            ),
          SizedBox(
            width: 256.0,
            child: Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
          ),
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
              model: _model.tabModel10,
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
              model: _model.tabModel11,
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
        ].divide(const SizedBox(height: 25.0)),
      ),
    );
  }
}
