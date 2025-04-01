import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'f_a_q_editor_widget.dart' show FAQEditorWidget;
import 'package:flutter/material.dart';

class FAQEditorModel extends FlutterFlowModel<FAQEditorWidget> {
  ///  Local state fields for this component.

  FrequentlyAskedQuestionStruct? faq;
  void updateFaqStruct(Function(FrequentlyAskedQuestionStruct) updateFn) {
    updateFn(faq ??= FrequentlyAskedQuestionStruct());
  }

  bool isExpanded = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
