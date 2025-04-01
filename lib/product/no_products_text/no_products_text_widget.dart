import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'no_products_text_model.dart';
export 'no_products_text_model.dart';

class NoProductsTextWidget extends StatefulWidget {
  const NoProductsTextWidget({
    super.key,
    this.onGoBack,
  });

  final Future Function()? onGoBack;

  @override
  State<NoProductsTextWidget> createState() => _NoProductsTextWidgetState();
}

class _NoProductsTextWidgetState extends State<NoProductsTextWidget> {
  late NoProductsTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoProductsTextModel());

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
        Text(
          'No More Products Available',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Manrope',
                letterSpacing: 0.0,
                fontStyle: FontStyle.italic,
              ),
        ),
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          FFButtonWidget(
            onPressed: () async {
              await widget.onGoBack?.call();
            },
            text: 'Go Back',
            options: FFButtonOptions(
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Manrope',
                    color: Colors.black,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
      ].divide(const SizedBox(height: 20.0)),
    );
  }
}
