import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detail_tab_widget.dart' show DetailTabWidget;
import 'package:flutter/material.dart';

class DetailTabModel extends FlutterFlowModel<DetailTabWidget> {
  ///  Local state fields for this component.

  List<FrequentlyAskedQuestionStruct> faqs = [];
  void addToFaqs(FrequentlyAskedQuestionStruct item) => faqs.add(item);
  void removeFromFaqs(FrequentlyAskedQuestionStruct item) => faqs.remove(item);
  void removeAtIndexFromFaqs(int index) => faqs.removeAt(index);
  void insertAtIndexInFaqs(int index, FrequentlyAskedQuestionStruct item) =>
      faqs.insert(index, item);
  void updateFaqsAtIndex(
          int index, Function(FrequentlyAskedQuestionStruct) updateFn) =>
      faqs[index] = updateFn(faqs[index]);

  dynamic moreInfo;

  dynamic guide;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TitleField widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldTextController;
  String? Function(BuildContext, String?)? titleFieldTextControllerValidator;
  String? _titleFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for AnswerField widget.
  FocusNode? answerFieldFocusNode;
  TextEditingController? answerFieldTextController;
  String? Function(BuildContext, String?)? answerFieldTextControllerValidator;
  String? _answerFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {
    titleFieldTextControllerValidator = _titleFieldTextControllerValidator;
    answerFieldTextControllerValidator = _answerFieldTextControllerValidator;
  }

  @override
  void dispose() {
    titleFieldFocusNode?.dispose();
    titleFieldTextController?.dispose();

    answerFieldFocusNode?.dispose();
    answerFieldTextController?.dispose();
  }
}
