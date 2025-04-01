import '/elements/check_text/check_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'plan_model.dart';
export 'plan_model.dart';

class PlanWidget extends StatefulWidget {
  const PlanWidget({
    super.key,
    this.planName,
    required this.features,
  });

  final String? planName;
  final List<String>? features;

  @override
  State<PlanWidget> createState() => _PlanWidgetState();
}

class _PlanWidgetState extends State<PlanWidget> {
  late PlanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanModel());

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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget.planName,
              'Plan Name',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Builder(
              builder: (context) {
                final feature = widget.features!.toList();

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(feature.length, (featureIndex) {
                    final featureItem = feature[featureIndex];
                    return CheckTextWidget(
                      key: Key('Keyl1m_${featureIndex}_of_${feature.length}'),
                      text: featureItem,
                    );
                  }).divide(const SizedBox(height: 20.0)),
                );
              },
            ),
          ),
        ].divide(const SizedBox(height: 20.0)),
      ),
    );
  }
}
