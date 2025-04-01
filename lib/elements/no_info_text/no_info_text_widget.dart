import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_info_text_model.dart';
export 'no_info_text_model.dart';

class NoInfoTextWidget extends StatefulWidget {
  const NoInfoTextWidget({super.key});

  @override
  State<NoInfoTextWidget> createState() => _NoInfoTextWidgetState();
}

class _NoInfoTextWidgetState extends State<NoInfoTextWidget> {
  late NoInfoTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoInfoTextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'No Transactions Available',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Manrope',
            letterSpacing: 0.0,
            fontStyle: FontStyle.italic,
          ),
    );
  }
}
