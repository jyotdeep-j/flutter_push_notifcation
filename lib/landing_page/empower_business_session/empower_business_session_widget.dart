import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/landing_page/saa_s_big_card/saa_s_big_card_widget.dart';
import '/landing_page/saa_s_card1/saa_s_card1_widget.dart';
import '/landing_page/saa_s_card2/saa_s_card2_widget.dart';
import '/landing_page/saa_s_card3/saa_s_card3_widget.dart';
import '/landing_page/saa_s_card4/saa_s_card4_widget.dart';
import 'package:flutter/material.dart';
import 'empower_business_session_model.dart';
export 'empower_business_session_model.dart';

class EmpowerBusinessSessionWidget extends StatefulWidget {
  const EmpowerBusinessSessionWidget({super.key});

  @override
  State<EmpowerBusinessSessionWidget> createState() =>
      _EmpowerBusinessSessionWidgetState();
}

class _EmpowerBusinessSessionWidgetState
    extends State<EmpowerBusinessSessionWidget> {
  late EmpowerBusinessSessionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmpowerBusinessSessionModel());

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
      mainAxisSize: MainAxisSize.max,
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          tabletLandscape: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Empower Your Business with Our\nSaaS Solutions',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('BlogPage');
                            },
                            child: wrapWithModel(
                              model: _model.saaSBigCardModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: const SaaSBigCardWidget(
                                image:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/i7yvxir6u05h/c0cb9fda1e1ca2726bf64becd6a2c2b3.png',
                                title: 'CopyGenius',
                                subtitle: 'Marketing Automation',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.saaSCard1Model1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const SaaSCard1Widget(
                                      image:
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/l8cpzlxlo7rg/d33c29a33ce49524014a91db318a61e2.png',
                                      title: 'VideoGenius',
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.saaSCard2Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const SaaSCard2Widget(
                                    image:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/5ytz9qmxthfp/e6f727cff8fc6b6881333e1f3131fc44.png',
                                    title: 'LawGenius',
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  wrapWithModel(
                                    model: _model.saaSCard3Model,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const SaaSCard3Widget(
                                      image:
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/uk9ca7ca73mo/10b5817030d6dd260eb676fa29e3fc86.png',
                                      title: 'AI StudyGenius',
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.saaSCard4Model,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const SaaSCard4Widget(
                                      image:
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/ueu2cdbelwlv/a014a51e205ee0ac05b9d87394d556a1.png',
                                      title: 'LawGenius',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 10.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Show More',
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 78.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x001B45B4),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (responsiveVisibility(
          context: context,
          desktop: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Empower Your Business with Our\n SaaS Solutions',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 25.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Show All Product',
                          options: FFButtonOptions(
                            height: 58.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: wrapWithModel(
                            model: _model.saaSBigCardModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: const SaaSBigCardWidget(
                              image:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/i7yvxir6u05h/c0cb9fda1e1ca2726bf64becd6a2c2b3.png',
                              title: 'Campaign Crafter',
                              subtitle: 'Marketing Automation',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: wrapWithModel(
                                model: _model.saaSCard1Model2,
                                updateCallback: () => safeSetState(() {}),
                                child: const SaaSCard1Widget(
                                  image:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/l8cpzlxlo7rg/d33c29a33ce49524014a91db318a61e2.png',
                                  title: 'Client Connect ',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: wrapWithModel(
                                model: _model.saaSCard1Model3,
                                updateCallback: () => safeSetState(() {}),
                                child: const SaaSCard1Widget(
                                  image:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/5ytz9qmxthfp/e6f727cff8fc6b6881333e1f3131fc44.png',
                                  title: 'Customer Crux',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.saaSCard1Model4,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const SaaSCard1Widget(
                                    image:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/uk9ca7ca73mo/10b5817030d6dd260eb676fa29e3fc86.png',
                                    title: 'Project Pulse',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.saaSCard1Model5,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const SaaSCard1Widget(
                                    image:
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/double-sided-marketplace-app-y09wjt/assets/ueu2cdbelwlv/a014a51e205ee0ac05b9d87394d556a1.png',
                                    title: 'Trend Tracker',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 10.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Show More',
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 100.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0x001B45B4),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
