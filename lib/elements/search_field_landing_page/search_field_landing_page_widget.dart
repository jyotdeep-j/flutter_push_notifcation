import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'search_field_landing_page_model.dart';
export 'search_field_landing_page_model.dart';

class SearchFieldLandingPageWidget extends StatefulWidget {
  const SearchFieldLandingPageWidget({
    super.key,
    required this.products,
  });

  final List<ProductsRecord>? products;

  @override
  State<SearchFieldLandingPageWidget> createState() =>
      _SearchFieldLandingPageWidgetState();
}

class _SearchFieldLandingPageWidgetState
    extends State<SearchFieldLandingPageWidget> {
  late SearchFieldLandingPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchFieldLandingPageModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.partners = await queryPartnersRecordOnce();
    });

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x46E0E3E7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(200.0),
                bottomRight: Radius.circular(200.0),
                topLeft: Radius.circular(200.0),
                topRight: Radius.circular(200.0),
              ),
              border: Border.all(
                color: FlutterFlowTheme.of(context).info,
              ),
            ),
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
              child: Material(
                color: Colors.transparent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Container(
                  height: 125.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Autocomplete<String>(
                            initialValue: const TextEditingValue(),
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return _model.searchResults.where((option) {
                                final lowercaseOption = option.toLowerCase();
                                return lowercaseOption.contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return AutocompleteOptionsList(
                                textFieldKey: _model.textFieldKey,
                                textController: _model.textController!,
                                options: options.toList(),
                                onSelected: onSelected,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                                textHighlightStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                                elevation: 4.0,
                                optionBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                optionHighlightColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                              );
                            },
                            onSelected: (String selection) {
                              safeSetState(() =>
                                  _model.textFieldSelectedOption = selection);
                              FocusScope.of(context).unfocus();
                            },
                            fieldViewBuilder: (
                              context,
                              textEditingController,
                              focusNode,
                              onEditingComplete,
                            ) {
                              _model.textFieldFocusNode = focusNode;

                              _model.textController = textEditingController;
                              return TextFormField(
                                key: _model.textFieldKey,
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  const Duration(milliseconds: 100),
                                  () async {
                                    await _model.search(
                                      context,
                                      query: functions.convertToTitleCase(
                                          _model.textController.text),
                                    );
                                  },
                                ),
                                onFieldSubmitted: (_) async {
                                  context.pushNamed(
                                    'SearchPage',
                                    queryParameters: {
                                      'query': serializeParam(
                                        functions.convertToTitleCase(
                                            _model.textController.text),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                autofocus: false,
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                  alignLabelWithHint: true,
                                  hintText: 'Search ${_model.searchType}',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.5,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(5.0),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  suffixIcon:
                                      _model.textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                await _model.search(
                                                  context,
                                                  query: functions
                                                      .convertToTitleCase(_model
                                                          .textController.text),
                                                );
                                                safeSetState(() {});
                                              },
                                              child: const Icon(
                                                Icons.clear,
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              );
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(width: 30.0))
                        .addToStart(const SizedBox(width: 50.0))
                        .addToEnd(const SizedBox(width: 50.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
