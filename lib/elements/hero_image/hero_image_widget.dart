import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'hero_image_model.dart';
export 'hero_image_model.dart';

class HeroImageWidget extends StatefulWidget {
  const HeroImageWidget({super.key});

  @override
  State<HeroImageWidget> createState() => _HeroImageWidgetState();
}

class _HeroImageWidgetState extends State<HeroImageWidget> {
  late HeroImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeroImageModel());

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
      width: double.infinity,
      height: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 539.0,
        maxHeight: 894.0,
      ),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
          ))
            Stack(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 500.0,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Discover Top AI And SaaS Products \nOn The Market',
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.4,
                                    ),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. \nLectus mauris ultrices sit morbi metus. Et et leo ipsum sed \nmagna mauris et.',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                      lineHeight: 1.85,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 80.0)),
                  ),
                ),
              ],
            ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            desktop: false,
          ))
            Stack(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 500.0,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Streamline Your Operations with Our All-in-One SaaS Platform',
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 48.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.4,
                                    ),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. \nLectus mauris ultrices sit morbi metus. Et et leo ipsum sed \nmagna mauris et.',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.85,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 80.0)),
                  ),
                ),
              ],
            ),
          if (responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Stack(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 500.0,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Streamline Your Operations with Our All-in-One SaaS Platform',
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.4,
                                    ),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. \nLectus mauris ultrices sit morbi metus. Et et leo ipsum sed magna mauris et.',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.85,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 80.0)),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
