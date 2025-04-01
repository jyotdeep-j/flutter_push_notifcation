import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_field_landing_page_widget.dart'
    show SearchFieldLandingPageWidget;
import 'package:flutter/material.dart';

class SearchFieldLandingPageModel
    extends FlutterFlowModel<SearchFieldLandingPageWidget> {
  ///  Local state fields for this component.

  String searchType = 'Products';

  List<String> searchResults = [];
  void addToSearchResults(String item) => searchResults.add(item);
  void removeFromSearchResults(String item) => searchResults.remove(item);
  void removeAtIndexFromSearchResults(int index) =>
      searchResults.removeAt(index);
  void insertAtIndexInSearchResults(int index, String item) =>
      searchResults.insert(index, item);
  void updateSearchResultsAtIndex(int index, Function(String) updateFn) =>
      searchResults[index] = updateFn(searchResults[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in SearchFieldLandingPage widget.
  List<PartnersRecord>? partners;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }

  /// Action blocks.
  Future search(
    BuildContext context, {
    required String? query,
  }) async {
    List<ProductsRecord>? productList;
    List<PartnersRecord>? partnerList;

    if (searchType == 'Products') {
      productList = await queryProductsRecordOnce(
        queryBuilder: (productsRecord) => productsRecord.where(
          'name',
          isGreaterThanOrEqualTo: query,
        ),
        limit: 10,
      );
      searchResults = productList
          .unique((e) => e)
          .unique((e) => e)
          .map((e) => e.name)
          .toList()
          .toList()
          .cast<String>();
    } else if (searchType == 'Partners') {
      partnerList = await queryPartnersRecordOnce(
        queryBuilder: (partnersRecord) => partnersRecord.where(
          'name',
          isGreaterThanOrEqualTo: query,
        ),
        limit: 10,
      );
      searchResults = partnerList
          .unique((e) => e)
          .unique((e) => e)
          .map((e) => e.name)
          .toList()
          .toList()
          .cast<String>();
    }
  }
}
