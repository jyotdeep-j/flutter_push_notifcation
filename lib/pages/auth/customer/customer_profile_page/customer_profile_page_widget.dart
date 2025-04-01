import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/my_profile_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'customer_profile_page_model.dart';
export 'customer_profile_page_model.dart';

class CustomerProfilePageWidget extends StatefulWidget {
  const CustomerProfilePageWidget({super.key});

  @override
  State<CustomerProfilePageWidget> createState() =>
      _CustomerProfilePageWidgetState();
}

class _CustomerProfilePageWidgetState extends State<CustomerProfilePageWidget> {
  late CustomerProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerProfilePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.partnerData = await queryPartnersRecordOnce(
        queryBuilder: (partnersRecord) => partnersRecord.where(
          'id',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.industryRef = await queryCategoriesRecordOnce(
        queryBuilder: (categoriesRecord) => categoriesRecord.where(
          'name',
          isEqualTo: 'Industries',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CustomersRecord>(
      stream: CustomersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final customerProfilePageCustomersRecord = snapshot.data!;

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
                                      active: 'profile',
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  const SizedBox(
                                    height: 1500.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: Color(0xFF454545),
                                    ),
                                  ),
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.myProfileModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MyProfileWidget(
                                      parameter1:
                                          customerProfilePageCustomersRecord
                                              .profilePicture,
                                      parameter2:
                                          customerProfilePageCustomersRecord
                                              .reference,
                                      parameter3:
                                          customerProfilePageCustomersRecord
                                              .firstName,
                                      parameter4:
                                          customerProfilePageCustomersRecord
                                              .lastName,
                                      parameter5:
                                          customerProfilePageCustomersRecord
                                              .countryCode,
                                      parameter6:
                                          customerProfilePageCustomersRecord
                                              .phoneNumber,
                                      parameter7:
                                          customerProfilePageCustomersRecord
                                              .bio,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 40.0)),
                            ),
                          ),
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
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
                                      active: 'profile',
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  const SizedBox(
                                    height: 1500.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color: Color(0xFF454545),
                                    ),
                                  ),
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.myProfileModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MyProfileWidget(
                                      parameter1:
                                          customerProfilePageCustomersRecord
                                              .profilePicture,
                                      parameter2:
                                          customerProfilePageCustomersRecord
                                              .reference,
                                      parameter3:
                                          customerProfilePageCustomersRecord
                                              .firstName,
                                      parameter4:
                                          customerProfilePageCustomersRecord
                                              .lastName,
                                      parameter5:
                                          customerProfilePageCustomersRecord
                                              .countryCode,
                                      parameter6:
                                          customerProfilePageCustomersRecord
                                              .phoneNumber,
                                      parameter7:
                                          customerProfilePageCustomersRecord
                                              .bio,
                                    ),
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
