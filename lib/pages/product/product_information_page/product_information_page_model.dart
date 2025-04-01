import '/backend/backend.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/review/review_card/review_card_widget.dart';
import '/review/review_widget/review_widget_widget.dart';
import 'product_information_page_widget.dart' show ProductInformationPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductInformationPageModel
    extends FlutterFlowModel<ProductInformationPageWidget> {
  ///  Local state fields for this page.

  bool isPurchased = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ProductInformationPage widget.
  ItemsRecord? hasUserPurchased;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Model for ReviewCard component.
  late ReviewCardModel reviewCardModel1;
  // Model for ReviewWidget component.
  late ReviewWidgetModel reviewWidgetModel1;
  // State field(s) for PlanDropDown-Mobile widget.
  String? planDropDownMobileValue;
  FormFieldController<String>? planDropDownMobileValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Model for ReviewCard component.
  late ReviewCardModel reviewCardModel2;
  // Model for ReviewWidget component.
  late ReviewWidgetModel reviewWidgetModel2;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    reviewCardModel1 = createModel(context, () => ReviewCardModel());
    reviewWidgetModel1 = createModel(context, () => ReviewWidgetModel());
    reviewCardModel2 = createModel(context, () => ReviewCardModel());
    reviewWidgetModel2 = createModel(context, () => ReviewWidgetModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    expandableExpandableController1.dispose();
    reviewCardModel1.dispose();
    reviewWidgetModel1.dispose();
    expandableExpandableController2.dispose();
    reviewCardModel2.dispose();
    reviewWidgetModel2.dispose();
    footerModel.dispose();
  }
}
