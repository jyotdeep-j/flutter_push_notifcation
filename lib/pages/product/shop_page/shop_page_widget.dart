import '/backend/backend.dart';
import '/elements/categories/categories_widget.dart';
import '/elements/expert_footer/expert_footer_widget.dart';
import '/elements/footer/footer_widget.dart';
import '/elements/header/header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/product/products_grid/products_grid_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'shop_page_model.dart';
export 'shop_page_model.dart';

class ShopPageWidget extends StatefulWidget {
  const ShopPageWidget({
    super.key,
    this.category,
  });

  final String? category;

  @override
  State<ShopPageWidget> createState() => _ShopPageWidgetState();
}

class _ShopPageWidgetState extends State<ShopPageWidget> {
  late ShopPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.category != null && widget.category != '') {
        _model.active = widget.category!;
        safeSetState(() {});

        safeSetState(() {});
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductsRecord>>(
      stream: queryProductsRecord(
        queryBuilder: (productsRecord) => productsRecord
            .where(
              'is_approved',
              isEqualTo: true,
            )
            .where(
              'is_draft',
              isEqualTo: false,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ProductsRecord> shopPageProductsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StickyHeader(
                        overlapHeaders: false,
                        header: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/Frame_65.png',
                              ).image,
                            ),
                          ),
                          child: wrapWithModel(
                            model: _model.headerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: const HeaderWidget(),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 60.0),
                              child: wrapWithModel(
                                model: _model.categoriesModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CategoriesWidget(
                                  active: _model.active,
                                  onChanged: (value) async {
                                    var shouldSetState = false;
                                    _model.active = value!;
                                    safeSetState(() {});
                                    if (_model.categoriesModel.webValue ==
                                        '    All    ') {
                                      _model.activeTag = null;
                                      _model.categoryRef = null;
                                      safeSetState(() {});
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      _model.category =
                                          await queryCategoriesRecordOnce(
                                        queryBuilder: (categoriesRecord) =>
                                            categoriesRecord.where(
                                          'name',
                                          isEqualTo: value,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      shouldSetState = true;
                                      _model.categoryRef =
                                          _model.category?.reference;
                                      safeSetState(() {});
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (shouldSetState) safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  35.0, 0.0, 35.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.categoriesModel.webValue ==
                                                '    All    '
                                            ? 'Featured Products'
                                            : 'Shop by ${_model.categoriesModel.webValue}',
                                        'Featured Products',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minWidth: 105.0,
                                        maxWidth: 325.0,
                                      ),
                                      decoration: const BoxDecoration(),
                                      child: Visibility(
                                        visible: _model.active != '    All    ',
                                        child: StreamBuilder<List<TagsRecord>>(
                                          stream: _model.tagsCache(
                                            uniqueQueryKey:
                                                valueOrDefault<String>(
                                              _model.categoryRef?.id,
                                              'N/A',
                                            ),
                                            requestFn: () => queryTagsRecord(
                                              parent: _model.categoryRef,
                                              queryBuilder: (tagsRecord) =>
                                                  tagsRecord.orderBy('name'),
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<TagsRecord>dropDownTagsRecordList = snapshot.data!;

                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropDownValue ??=
                                                    'All Categories',
                                              ),
                                              options: dropDownTagsRecordList
                                                  .map((e) => e.name)
                                                  .toList()
                                                  .sortedList(
                                                      keyOf: (e) => e,
                                                      desc: false),
                                              onChanged: (val) async {
                                                safeSetState(() =>
                                                    _model.dropDownValue = val);
                                                var shouldSetState = false;
                                                if (_model.dropDownValue ==
                                                    'All Categories') {
                                                  _model.activeTag = null;
                                                  safeSetState(() {});
                                                  if (shouldSetState) {
                                                    safeSetState(() {});
                                                  }
                                                  return;
                                                } else {
                                                  _model.queryTag =
                                                      await queryTagsRecordOnce(
                                                    parent: _model.categoryRef,
                                                    queryBuilder:
                                                        (tagsRecord) =>
                                                            tagsRecord.where(
                                                      'name',
                                                      isEqualTo:
                                                          _model.dropDownValue,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  shouldSetState = true;
                                                  _model.activeTag = _model
                                                      .queryTag?.reference;
                                                  safeSetState(() {});
                                                  if (shouldSetState) {
                                                    safeSetState(() {});
                                                  }
                                                  return;
                                                }

                                                if (shouldSetState) {
                                                  safeSetState(() {});
                                                }
                                              },
                                              width: double.infinity,
                                              height: 65.0,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: const Color(0xFF121212),
                                                    fontSize: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 14.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 16.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointLarge) {
                                                        return 20.0;
                                                      } else {
                                                        return 20.0;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              hintText: 'All Categories',
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: Color(0xFF121212),
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 2.0,
                                              borderRadius: 100.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      25.0, 0.0, 25.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 20.0)),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.productsGridModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: ProductsGridWidget(
                                productList: () {
                                  if ((_model.activeTag != null) &&
                                      (_model.categoryRef != null)) {
                                    return shopPageProductsRecordList
                                        .where((e) =>
                                            (e.category ==
                                                _model.categoryRef) &&
                                            e.tags.contains(_model.activeTag))
                                        .toList();
                                  } else if (_model.categoryRef != null) {
                                    return shopPageProductsRecordList
                                        .where((e) =>
                                            e.category == _model.categoryRef)
                                        .toList();
                                  } else {
                                    return shopPageProductsRecordList;
                                  }
                                }(),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.expertFooterModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const ExpertFooterWidget(),
                            ),
                            wrapWithModel(
                              model: _model.footerModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const FooterWidget(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
