import '/backend/backend.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/product/brief_product_card/brief_product_card_widget.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  Local state fields for this page.

  CouponsRecord? coupon;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  CouponsRecord? couponData;
  // Model for BriefProductCard component.
  late BriefProductCardModel briefProductCardModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    briefProductCardModel = createModel(context, () => BriefProductCardModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    briefProductCardModel.dispose();
    footerModel.dispose();
  }
}
