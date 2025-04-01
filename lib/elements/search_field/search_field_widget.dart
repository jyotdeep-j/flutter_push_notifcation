import '/backend/backend.dart';
import '/elements/search_field_landing_page/search_field_landing_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'search_field_model.dart';
export 'search_field_model.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    super.key,
    required this.products,
  });

  final List<ProductsRecord>? products;

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  late SearchFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchFieldModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.partners = await queryPartnersRecordOnce();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithModel(
      model: _model.searchFieldLandingPageModel,
      updateCallback: () => safeSetState(() {}),
      child: SearchFieldLandingPageWidget(
        products: widget.products!,
      ),
    );
  }
}
