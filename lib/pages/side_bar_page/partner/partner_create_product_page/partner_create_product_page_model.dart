import '/backend/backend.dart';
import '/components/category_tab_widget.dart';
import '/components/detail_tab_widget.dart';
import '/components/pricing_tab_widget.dart';
import '/components/product_info_tab_widget.dart';
import '/elements/header/header_widget.dart';
import '/elements/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'partner_create_product_page_widget.dart'
    show PartnerCreateProductPageWidget;
import 'package:flutter/material.dart';

class PartnerCreateProductPageModel
    extends FlutterFlowModel<PartnerCreateProductPageWidget> {
  ///  Local state fields for this page.

  bool onePlan = false;

  dynamic moreInfo;

  dynamic guide;

  DocumentReference? categoryRef;

  List<DocumentReference> tagRef = [];
  void addToTagRef(DocumentReference item) => tagRef.add(item);
  void removeFromTagRef(DocumentReference item) => tagRef.remove(item);
  void removeAtIndexFromTagRef(int index) => tagRef.removeAt(index);
  void insertAtIndexInTagRef(int index, DocumentReference item) =>
      tagRef.insert(index, item);
  void updateTagRefAtIndex(int index, Function(DocumentReference) updateFn) =>
      tagRef[index] = updateFn(tagRef[index]);

  List<FrequentlyAskedQuestionStruct> faqs = [];
  void addToFaqs(FrequentlyAskedQuestionStruct item) => faqs.add(item);
  void removeFromFaqs(FrequentlyAskedQuestionStruct item) => faqs.remove(item);
  void removeAtIndexFromFaqs(int index) => faqs.removeAt(index);
  void insertAtIndexInFaqs(int index, FrequentlyAskedQuestionStruct item) =>
      faqs.insert(index, item);
  void updateFaqsAtIndex(
          int index, Function(FrequentlyAskedQuestionStruct) updateFn) =>
      faqs[index] = updateFn(faqs[index]);

  List<PlanStruct> plans = [];
  void addToPlans(PlanStruct item) => plans.add(item);
  void removeFromPlans(PlanStruct item) => plans.remove(item);
  void removeAtIndexFromPlans(int index) => plans.removeAt(index);
  void insertAtIndexInPlans(int index, PlanStruct item) =>
      plans.insert(index, item);
  void updatePlansAtIndex(int index, Function(PlanStruct) updateFn) =>
      plans[index] = updateFn(plans[index]);

  ProductsRecord? editProduct;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PartnerCreateProductPage widget.
  List<TagsRecord>? tags;
  // Stores action output result for [Backend Call - Create Document] action in PartnerCreateProductPage widget.
  ProductsRecord? draftProduct;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ProductInfoTab component.
  late ProductInfoTabModel productInfoTabModel;
  // Model for CategoryTab component.
  late CategoryTabModel categoryTabModel;
  // Model for DetailTab component.
  late DetailTabModel detailTabModel;
  // Model for PricingTab component.
  late PricingTabModel pricingTabModel;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    sideBarModel = createModel(context, () => SideBarModel());
    productInfoTabModel = createModel(context, () => ProductInfoTabModel());
    categoryTabModel = createModel(context, () => CategoryTabModel());
    detailTabModel = createModel(context, () => DetailTabModel());
    pricingTabModel = createModel(context, () => PricingTabModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    sideBarModel.dispose();
    tabBarController?.dispose();
    productInfoTabModel.dispose();
    categoryTabModel.dispose();
    detailTabModel.dispose();
    pricingTabModel.dispose();
  }
}
