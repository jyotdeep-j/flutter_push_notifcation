import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/elements/empty_container/empty_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/plan/feature_editor/feature_editor_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'plan_details_model.dart';
export 'plan_details_model.dart';

class PlanDetailsWidget extends StatefulWidget {
  const PlanDetailsWidget({
    super.key,
    required this.update,
    required this.delete,
    required this.plan,
  });

  final Future Function(PlanStruct? plan)? update;
  final Future Function()? delete;
  final PlanStruct? plan;

  @override
  State<PlanDetailsWidget> createState() => _PlanDetailsWidgetState();
}

class _PlanDetailsWidgetState extends State<PlanDetailsWidget> {
  late PlanDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.plan = widget.plan;
      safeSetState(() {});
    });

    _model.nameFieldTextController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();

    _model.priceFieldTextController ??= TextEditingController();
    _model.priceFieldFocusNode ??= FocusNode();

    _model.discountFieldTextController ??= TextEditingController();
    _model.discountFieldFocusNode ??= FocusNode();

    _model.festureFieldTextController ??= TextEditingController();
    _model.festureFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 837.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: const Color(0xFFA2A0A0),
          width: 2.0,
        ),
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 342.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Plan name       ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                TextSpan(
                                  text: '*required',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            child: TextFormField(
                              controller: _model.nameFieldTextController,
                              focusNode: _model.nameFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.nameFieldTextController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  _model.updatePlanStruct(
                                    (e) => e
                                      ..name =
                                          _model.nameFieldTextController.text,
                                  );
                                  safeSetState(() {});
                                  await widget.update?.call(
                                    _model.plan,
                                  );
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: '-',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              validator: _model.nameFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ].divide(const SizedBox(height: 15.0)),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 342.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Visibility(
                        visible: !valueOrDefault<bool>(
                          _model.isFree,
                          false,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Listing price       ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  TextSpan(
                                    text: '*required',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Container(
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: TextFormField(
                                controller: _model.priceFieldTextController,
                                focusNode: _model.priceFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.priceFieldTextController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    _model.updatePlanStruct(
                                      (e) => e
                                        ..price = double.tryParse(_model
                                            .priceFieldTextController.text),
                                    );
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.priceFieldTextController?.text =
                                          formatNumber(
                                        widget.plan!.price,
                                        formatType: FormatType.custom,
                                        currency: '\$',
                                        format: '#,##0',
                                        locale: '',
                                      );
                                      _model.priceFieldFocusNode
                                          ?.requestFocus();
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        _model.priceFieldTextController
                                                ?.selection =
                                            TextSelection.collapsed(
                                          offset: _model
                                              .priceFieldTextController!
                                              .text
                                              .length,
                                        );
                                      });
                                    });
                                    await widget.update?.call(
                                      _model.plan,
                                    );
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: '-',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 10.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model
                                    .priceFieldTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                          ].divide(const SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 342.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Visibility(
                        visible: valueOrDefault<bool>(
                          !_model.isFree && _model.hasDiscount,
                          true,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Comparison price     ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        TextSpan(
                                          text: 'optional',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                Icon(
                                  Icons.help,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 21.0,
                                ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
                            Container(
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller:
                                          _model.discountFieldTextController,
                                      focusNode: _model.discountFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.discountFieldTextController',
                                        const Duration(milliseconds: 2000),
                                        () async {
                                          _model.updatePlanStruct(
                                            (e) => e
                                              ..discountPrice = double.tryParse(
                                                  _model
                                                      .discountFieldTextController
                                                      .text),
                                          );
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.discountFieldTextController
                                                ?.text = formatNumber(
                                              widget.plan!.discountPrice,
                                              formatType: FormatType.custom,
                                              currency: '\$',
                                              format: '#,##0',
                                              locale: '',
                                            );
                                            _model.discountFieldFocusNode
                                                ?.requestFocus();
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              _model.discountFieldTextController
                                                      ?.selection =
                                                  TextSelection.collapsed(
                                                offset: _model
                                                    .discountFieldTextController!
                                                    .text
                                                    .length,
                                              );
                                            });
                                          });
                                          await widget.update?.call(
                                            _model.plan,
                                          );
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: '-',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                15.0, 10.0, 15.0, 10.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      validator: _model
                                          .discountFieldTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]'))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(const SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 0.0,
                runSpacing: 5.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: Checkbox(
                          value: _model.freebieCheckboxValue ??= _model.isFree,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.freebieCheckboxValue = newValue!);
                            if (newValue!) {
                              _model.updatePlanStruct(
                                (e) => e
                                  ..discountPrice = 0.0
                                  ..price = 0.0,
                              );
                              _model.isFree = true;
                              safeSetState(() {});
                              await widget.update?.call(
                                _model.plan,
                              );
                            } else {
                              _model.isFree = false;
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          activeColor: FlutterFlowTheme.of(context).secondary,
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                        child: Text(
                          'This is a freebie',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!valueOrDefault<bool>(
                        _model.isFree,
                        false,
                      ))
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: Checkbox(
                            value: _model.discountCheckboxValue ??=
                                _model.hasDiscount,
                            onChanged: (newValue) async {
                              safeSetState(() =>
                                  _model.discountCheckboxValue = newValue!);
                              if (newValue!) {
                                _model.updatePlanStruct(
                                  (e) =>
                                      e..onSale = _model.discountCheckboxValue,
                                );
                                _model.hasDiscount = true;
                                safeSetState(() {});
                                await widget.update?.call(
                                  _model.plan,
                                );
                              } else {
                                _model.updatePlanStruct(
                                  (e) =>
                                      e..onSale = _model.discountCheckboxValue,
                                );
                                _model.hasDiscount = false;
                                safeSetState(() {});
                                await widget.update?.call(
                                  _model.plan,
                                );
                              }
                            },
                            side: BorderSide(
                              width: 2,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            activeColor: FlutterFlowTheme.of(context).secondary,
                            checkColor: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                      if (!valueOrDefault<bool>(
                        _model.isFree,
                        false,
                      ))
                        Text(
                          'This plan has a discount',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                    ],
                  ),
                ],
              ),
              Text(
                'List features',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                'Tell buyers what they will get if they purchase your product (e.g., analytics and reporting, custom logo and branding, user seats, storage, integrations).',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Plan features       ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        TextSpan(
                          text: '(Max. 20)',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Text(
                    'An example of a feature might be \"fast service\"',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(
                    width: 558.0,
                    child: TextFormField(
                      controller: _model.festureFieldTextController,
                      focusNode: _model.festureFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Manrope',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                        hintText: '-',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Manrope',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                          ),
                      maxLength: 100,
                      validator: _model.festureFieldTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      _model.updatePlanStruct(
                        (e) => e
                          ..updateFeatures(
                            (e) =>
                                e.add(_model.festureFieldTextController.text),
                          ),
                      );
                      safeSetState(() {});
                      await widget.update?.call(
                        _model.plan,
                      );
                      safeSetState(() {
                        _model.festureFieldTextController?.clear();
                      });
                    },
                    text: 'Add a feature (${valueOrDefault<String>(
                      _model.plan?.features.length.toString(),
                      '0',
                    )}/20)',
                    icon: const Icon(
                      Icons.add,
                      size: 16.0,
                    ),
                    options: FFButtonOptions(
                      width: 252.0,
                      height: 45.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Manrope',
                                color: Colors.black,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                  ),
                ].divide(const SizedBox(height: 15.0)),
              ),
              Builder(
                builder: (context) {
                  final feature = _model.plan?.features.toList() ?? [];
                  if (feature.isEmpty) {
                    return const EmptyContainerWidget();
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: feature.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                    itemBuilder: (context, featureIndex) {
                      final featureItem = feature[featureIndex];
                      return FeatureEditorWidget(
                        key: Key('Keyiin_${featureIndex}_of_${feature.length}'),
                        feature: featureItem,
                        delete: () async {
                          _model.updatePlanStruct(
                            (e) => e
                              ..updateFeatures(
                                (e) => e.removeAt(featureIndex),
                              ),
                          );
                          safeSetState(() {});
                        },
                        update: (feature) async {
                          _model.updatePlanStruct(
                            (e) => e
                              ..updateFeatures(
                                (e) => e[featureIndex] = feature!,
                              ),
                          );
                          safeSetState(() {});
                        },
                      );
                    },
                  );
                },
              ),
              FFButtonWidget(
                onPressed: () async {
                  await widget.delete?.call();
                },
                text: 'Delete Plan',
                icon: const Icon(
                  Icons.delete,
                  size: 16.0,
                ),
                options: FFButtonOptions(
                  height: 45.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(45.0, 0.0, 45.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0x00D3F26A),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Manrope',
                        color: const Color(0xFFBF1818),
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Color(0xFFBF1818),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
            ].divide(const SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
