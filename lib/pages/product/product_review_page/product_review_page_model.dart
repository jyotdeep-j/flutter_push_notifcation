import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/review/review_widget/review_widget_widget.dart';
import 'product_review_page_widget.dart' show ProductReviewPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductReviewPageModel extends FlutterFlowModel<ProductReviewPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ReviewWidget component.
  late ReviewWidgetModel reviewWidgetModel1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Model for ReviewWidget component.
  late ReviewWidgetModel reviewWidgetModel2;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    reviewWidgetModel1 = createModel(context, () => ReviewWidgetModel());
    reviewWidgetModel2 = createModel(context, () => ReviewWidgetModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    reviewWidgetModel1.dispose();
    expandableExpandableController.dispose();
    reviewWidgetModel2.dispose();
    footerModel.dispose();
  }
}
