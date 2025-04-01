import '/backend/backend.dart';
import '/components/filter_component_widget.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/footer_with_contact_field/footer_with_contact_field_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/product/products_grid/products_grid_widget.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  String searchType = 'Products';

  List<ProductsRecord> queriedProducts = [];
  void addToQueriedProducts(ProductsRecord item) => queriedProducts.add(item);
  void removeFromQueriedProducts(ProductsRecord item) =>
      queriedProducts.remove(item);
  void removeAtIndexFromQueriedProducts(int index) =>
      queriedProducts.removeAt(index);
  void insertAtIndexInQueriedProducts(int index, ProductsRecord item) =>
      queriedProducts.insert(index, item);
  void updateQueriedProductsAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      queriedProducts[index] = updateFn(queriedProducts[index]);

  List<PartnersRecord> queriedPartners = [];
  void addToQueriedPartners(PartnersRecord item) => queriedPartners.add(item);
  void removeFromQueriedPartners(PartnersRecord item) =>
      queriedPartners.remove(item);
  void removeAtIndexFromQueriedPartners(int index) =>
      queriedPartners.removeAt(index);
  void insertAtIndexInQueriedPartners(int index, PartnersRecord item) =>
      queriedPartners.insert(index, item);
  void updateQueriedPartnersAtIndex(
          int index, Function(PartnersRecord) updateFn) =>
      queriedPartners[index] = updateFn(queriedPartners[index]);

  String? localQuery;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for FilterComponent component.
  late FilterComponentModel filterComponentModel1;
  // State field(s) for TextField-Web widget.
  FocusNode? textFieldWebFocusNode;
  TextEditingController? textFieldWebTextController;
  String? Function(BuildContext, String?)? textFieldWebTextControllerValidator;
  // State field(s) for TextField-Tablet widget.
  FocusNode? textFieldTabletFocusNode;
  TextEditingController? textFieldTabletTextController;
  String? Function(BuildContext, String?)?
      textFieldTabletTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Model for FilterComponent component.
  late FilterComponentModel filterComponentModel2;
  // Model for ProductsGrid component.
  late ProductsGridModel productsGridModel;
  // Model for FooterWithContactField component.
  late FooterWithContactFieldModel footerWithContactFieldModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    filterComponentModel1 = createModel(context, () => FilterComponentModel());
    filterComponentModel2 = createModel(context, () => FilterComponentModel());
    productsGridModel = createModel(context, () => ProductsGridModel());
    footerWithContactFieldModel =
        createModel(context, () => FooterWithContactFieldModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    filterComponentModel1.dispose();
    textFieldWebFocusNode?.dispose();
    textFieldWebTextController?.dispose();

    textFieldTabletFocusNode?.dispose();
    textFieldTabletTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController3?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();

    filterComponentModel2.dispose();
    productsGridModel.dispose();
    footerWithContactFieldModel.dispose();
    footerModel.dispose();
  }
}
