import '/flutter_flow/flutter_flow_util.dart';
import 'feature_editor_widget.dart' show FeatureEditorWidget;
import 'package:flutter/material.dart';

class FeatureEditorModel extends FlutterFlowModel<FeatureEditorWidget> {
  ///  Local state fields for this component.

  bool isExpanded = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
