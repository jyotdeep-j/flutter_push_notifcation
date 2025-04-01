import '/backend/backend.dart';
import '/elements/categories/categories_widget.dart';
import '/elements/expert_footer/expert_footer_widget.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/product/products_grid/products_grid_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'shop_page_widget.dart' show ShopPageWidget;
import 'package:flutter/material.dart';

class ShopPageModel extends FlutterFlowModel<ShopPageWidget> {
  ///  Local state fields for this page.

  String active = '    All    ';

  List<String> tags = [];
  void addToTags(String item) => tags.add(item);
  void removeFromTags(String item) => tags.remove(item);
  void removeAtIndexFromTags(int index) => tags.removeAt(index);
  void insertAtIndexInTags(int index, String item) => tags.insert(index, item);
  void updateTagsAtIndex(int index, Function(String) updateFn) =>
      tags[index] = updateFn(tags[index]);

  DocumentReference? categoryRef;

  DocumentReference? activeTag;

  ///  State fields for stateful widgets in this page.

  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Categories component.
  late CategoriesModel categoriesModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Categories widget.
  CategoriesRecord? category;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  TagsRecord? queryTag;
  // Model for ProductsGrid component.
  late ProductsGridModel productsGridModel;
  // Model for ExpertFooter component.
  late ExpertFooterModel expertFooterModel;
  // Model for Footer component.
  late FooterModel footerModel;

  /// Query cache managers for this widget.

  final _tagsCacheManager = StreamRequestManager<List<TagsRecord>>();
  Stream<List<TagsRecord>> tagsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TagsRecord>> Function() requestFn,
  }) =>
      _tagsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTagsCacheCache() => _tagsCacheManager.clear();
  void clearTagsCacheCacheKey(String? uniqueKey) =>
      _tagsCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    categoriesModel = createModel(context, () => CategoriesModel());
    productsGridModel = createModel(context, () => ProductsGridModel());
    expertFooterModel = createModel(context, () => ExpertFooterModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    categoriesModel.dispose();
    productsGridModel.dispose();
    expertFooterModel.dispose();
    footerModel.dispose();

    /// Dispose query cache managers for this widget.

    clearTagsCacheCache();
  }
}
