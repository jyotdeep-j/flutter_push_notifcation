import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'category_tab_widget.dart' show CategoryTabWidget;
import 'package:flutter/material.dart';

class CategoryTabModel extends FlutterFlowModel<CategoryTabWidget> {
  ///  Local state fields for this component.

  DocumentReference? categoryRef;

  List<DocumentReference> tagsRef = [];
  void addToTagsRef(DocumentReference item) => tagsRef.add(item);
  void removeFromTagsRef(DocumentReference item) => tagsRef.remove(item);
  void removeAtIndexFromTagsRef(int index) => tagsRef.removeAt(index);
  void insertAtIndexInTagsRef(int index, DocumentReference item) =>
      tagsRef.insert(index, item);
  void updateTagsRefAtIndex(int index, Function(DocumentReference) updateFn) =>
      tagsRef[index] = updateFn(tagsRef[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CategoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  // State field(s) for TagCategoryDropdown widget.
  List<String>? tagCategoryDropdownValue;
  FormFieldController<List<String>>? tagCategoryDropdownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in TagCategoryDropdown widget.
  TagsRecord? tag;
  // State field(s) for PricingDropdown widget.
  String? pricingDropdownValue;
  FormFieldController<String>? pricingDropdownValueController;
  // State field(s) for CertificationDropdown widget.
  String? certificationDropdownValue;
  FormFieldController<String>? certificationDropdownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
