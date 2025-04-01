import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tab_model.dart';
export 'tab_model.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    this.text,
    this.icon,
    bool? isSelected,
  }) : isSelected = isSelected ?? false;

  final String? text;
  final Widget? icon;
  final bool isSelected;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  late TabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabModel());

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
      width: 256.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.isSelected ? const Color(0x00000000) : Colors.transparent,
          Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(18.0, 15.0, 18.0, 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.icon!,
            Text(
              valueOrDefault<String>(
                widget.text,
                'Text',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ].divide(const SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
