import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pricing_tab_widget.dart' show PricingTabWidget;
import 'package:flutter/material.dart';

class PricingTabModel extends FlutterFlowModel<PricingTabWidget> {
  ///  Local state fields for this component.

  bool onePlan = false;

  List<PlanStruct> plans = [];
  void addToPlans(PlanStruct item) => plans.add(item);
  void removeFromPlans(PlanStruct item) => plans.remove(item);
  void removeAtIndexFromPlans(int index) => plans.removeAt(index);
  void insertAtIndexInPlans(int index, PlanStruct item) =>
      plans.insert(index, item);
  void updatePlansAtIndex(int index, Function(PlanStruct) updateFn) =>
      plans[index] = updateFn(plans[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductsRecord? draftProduct;
  // State field(s) for CategoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
