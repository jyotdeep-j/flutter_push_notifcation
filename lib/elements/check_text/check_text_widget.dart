import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'check_text_model.dart';
export 'check_text_model.dart';

class CheckTextWidget extends StatefulWidget {
  const CheckTextWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  State<CheckTextWidget> createState() => _CheckTextWidgetState();
}

class _CheckTextWidgetState extends State<CheckTextWidget> {
  late CheckTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckTextModel());

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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 28.0,
            fillColor: FlutterFlowTheme.of(context).secondary,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
              size: 12.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          Text(
            valueOrDefault<String>(
              widget.text,
              'Text',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ].divide(const SizedBox(width: 10.0)),
      ),
    );
  }
}
