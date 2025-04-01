import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'categories_model.dart';
export 'categories_model.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({
    super.key,
    required this.onChanged,
    this.active,
  });

  final Future Function(String? value)? onChanged;
  final String? active;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late CategoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowChoiceChips(
      options: const [
        ChipData('    All    '),
        ChipData('Project Management'),
        ChipData('CRM'),
        ChipData('Data Analytics'),
        ChipData('Financial Management')
      ],
      onChanged: (val) async {
        safeSetState(() => _model.webValue = val?.firstOrNull);
        await widget.onChanged?.call(
          _model.webValue,
        );
      },
      selectedChipStyle: ChipStyle(
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        iconColor: Colors.transparent,
        iconSize: 18.0,
        labelPadding: const EdgeInsets.all(20.0),
        elevation: 4.0,
        borderRadius: BorderRadius.circular(100.0),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: const Color(0x257796DA),
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              color: FlutterFlowTheme.of(context).info,
              fontSize: 20.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        iconColor: const Color(0x008147E0),
        iconSize: 18.0,
        labelPadding: const EdgeInsets.all(20.0),
        elevation: 0.0,
        borderColor: FlutterFlowTheme.of(context).info,
        borderWidth: 1.0,
        borderRadius: BorderRadius.circular(100.0),
      ),
      chipSpacing: 25.0,
      rowSpacing: 12.0,
      multiselect: false,
      initialized: _model.webValue != null,
      alignment: WrapAlignment.start,
      controller: _model.webValueController ??=
          FormFieldController<List<String>>(
        [
          widget.active != null && widget.active != ''
              ? widget.active!
              : '    All    '
        ],
      ),
      wrapped: false,
    );
  }
}
