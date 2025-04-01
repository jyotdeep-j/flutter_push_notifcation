import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/elements/empty_container/empty_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/plan/f_a_q_editor/f_a_q_editor_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'detail_tab_model.dart';
export 'detail_tab_model.dart';

class DetailTabWidget extends StatefulWidget {
  const DetailTabWidget({
    super.key,
    required this.ref,
    required this.onNext,
    required this.onBack,
  });

  final ProductsRecord? ref;
  final Future Function()? onNext;
  final Future Function()? onBack;

  @override
  State<DetailTabWidget> createState() => _DetailTabWidgetState();
}

class _DetailTabWidgetState extends State<DetailTabWidget> {
  late DetailTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailTabModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.faqs =
          widget.ref!.faqs.toList().cast<FrequentlyAskedQuestionStruct>();
      _model.moreInfo = functions.convertToJson(valueOrDefault<String>(
        widget.ref?.moreProductInfo,
        '[{insert: }]',
      ));
      _model.guide = functions.convertToJson(valueOrDefault<String>(
        widget.ref?.installationGuide,
        '[{insert: }]',
      ));
      safeSetState(() {});
    });

    _model.titleFieldTextController ??= TextEditingController();
    _model.titleFieldFocusNode ??= FocusNode();

    _model.answerFieldTextController ??= TextEditingController();
    _model.answerFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                'Share a high-level introduction to your product',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            RichText(
              textScaler: MediaQuery.of(context).textScaler,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Tell more about your product       ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextSpan(
                    text: '*required',
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 314.0,
                    child: custom_widgets.RichTextEditor(
                      width: double.infinity,
                      height: 314.0,
                      initData: widget.ref?.moreProductInfo,
                      saveFormattedText: (formattedText) async {
                        await widget.ref!.reference
                            .update(createProductsRecordData(
                          moreProductInfo: formattedText.toString(),
                        ));
                        _model.moreInfo = formattedText;
                        safeSetState(() {});
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                'Frequently Asked Question (FAQ)',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Text(
              'Tell buyers about their common question right here if they purchase your product \n(e.g.,products, services, policies, or anything else).',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Text(
              'FAQ Question',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              'An example of a question might be \"How do I place an order?\"',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Manrope',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 758.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryText,
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
                        TextFormField(
                          controller: _model.titleFieldTextController,
                          focusNode: _model.titleFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Enter title here',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          validator: _model.titleFieldTextControllerValidator
                              .asValidator(context),
                        ),
                        Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        Text(
                          'Your answer',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        TextFormField(
                          controller: _model.answerFieldTextController,
                          focusNode: _model.answerFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                            hintText:
                                'Lorem ipsum dolor sit amet consectetur. Libero consectetur lorem malesuada in. Integer eget in nascetur lectus velit scelerisque ipsum. Sagittis morbi dui pulvinar nunc eget a vulputate. Ut fringilla tellus gravida eu massa tempor fermentum. Lorem ipsum dolor sit amet consectetur. Libero consectetur lorem malesuada in. Integer eget in nascetur lectus velit scelerisque ipsum. Sagittis morbi dui pulvinar nunc eget',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          maxLines: 20,
                          minLines: 1,
                          validator: _model.answerFieldTextControllerValidator
                              .asValidator(context),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                _model.addToFaqs(FrequentlyAskedQuestionStruct(
                                  question:
                                      _model.titleFieldTextController.text,
                                  answer: _model.answerFieldTextController.text,
                                ));
                                safeSetState(() {});

                                await widget.ref!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'faqs':
                                          getFrequentlyAskedQuestionListFirestoreData(
                                        _model.faqs,
                                      ),
                                    },
                                  ),
                                });
                                safeSetState(() {
                                  _model.titleFieldTextController?.clear();
                                  _model.answerFieldTextController?.clear();
                                });
                              },
                              text: 'Save',
                              icon: const Icon(
                                Icons.save,
                                size: 13.0,
                              ),
                              options: FFButtonOptions(
                                width: 146.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Colors.black,
                                      fontSize: 14.0,
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
                          ),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Add FAQ (${_model.faqs.length.toString()}/8)',
                icon: const Icon(
                  Icons.add,
                  size: 13.0,
                ),
                options: FFButtonOptions(
                  width: 200.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Manrope',
                        color: Colors.black,
                        fontSize: 14.0,
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
            ),
            Builder(
              builder: (context) {
                final faq = _model.faqs.toList().take(8).toList();
                if (faq.isEmpty) {
                  return const EmptyContainerWidget();
                }

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: faq.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 30.0),
                  itemBuilder: (context, faqIndex) {
                    final faqItem = faq[faqIndex];
                    return DragTarget<int>(
                      onAcceptWithDetails: (details) async {
                        safeSetState(() {});

                        safeSetState(() {});

                        safeSetState(() {});
                      },
                      builder: (context, _, __) {
                        return Draggable<int>(
                          data: faqIndex,
                          feedback: Material(
                            type: MaterialType.transparency,
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: FAQEditorWidget(
                                key: Key('Keyuda_${faqIndex}_of_${faq.length}'),
                                faq: faqItem,
                                update: (faq) async {
                                  _model.updateFaqsAtIndex(
                                    faqIndex,
                                    (_) => faq!,
                                  );
                                  safeSetState(() {});

                                  await widget.ref!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'faqs':
                                            getFrequentlyAskedQuestionListFirestoreData(
                                          _model.faqs,
                                        ),
                                      },
                                    ),
                                  });
                                },
                                delete: (data) async {
                                  _model.removeAtIndexFromFaqs(faqIndex);
                                  safeSetState(() {});

                                  await widget.ref!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'faqs':
                                            getFrequentlyAskedQuestionListFirestoreData(
                                          _model.faqs,
                                        ),
                                      },
                                    ),
                                  });
                                },
                              ),
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: FAQEditorWidget(
                              key: Key('Keyuda_${faqIndex}_of_${faq.length}'),
                              faq: faqItem,
                              update: (faq) async {
                                _model.updateFaqsAtIndex(
                                  faqIndex,
                                  (_) => faq!,
                                );
                                safeSetState(() {});

                                await widget.ref!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'faqs':
                                          getFrequentlyAskedQuestionListFirestoreData(
                                        _model.faqs,
                                      ),
                                    },
                                  ),
                                });
                              },
                              delete: (data) async {
                                _model.removeAtIndexFromFaqs(faqIndex);
                                safeSetState(() {});

                                await widget.ref!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'faqs':
                                          getFrequentlyAskedQuestionListFirestoreData(
                                        _model.faqs,
                                      ),
                                    },
                                  ),
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            RichText(
              textScaler: MediaQuery.of(context).textScaler,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Import File       ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextSpan(
                    text: '*required',
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
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.center,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (_model.uploadedFileUrls.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            'You have selected ${valueOrDefault<String>(
                              _model.uploadedFileUrls.length.toString(),
                              '0',
                            )} files to upload.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  final selectedFiles = await selectFiles(
                                    multiFile: true,
                                  );

                                  print("check apth dfdhf ${selectedFiles?.first.filePath}");
                                  if (selectedFiles != null) {
                                    safeSetState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {



                                      selectedUploadedFiles = selectedFiles
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedFiles.map(
                                          (f) async => await uploadData(
                                              f.storagePath, f.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedFiles.length &&
                                        downloadUrls.length ==
                                            selectedFiles.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFiles =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls = downloadUrls;
                                      });
                                      showUploadMessage(
                                        context,
                                        'Success!',
                                      );
                                    } else {
                                      safeSetState(() {});
                                      showUploadMessage(
                                        context,
                                        'Failed to upload file',
                                      );
                                      return;
                                    }
                                  }

                                  await widget.ref!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'files': _model.uploadedFileUrls,
                                      },
                                    ),
                                  });

                                  _model.updatePage(() {});
                                },
                                text: 'Import File',
                                icon: const Icon(
                                  Icons.file_upload_outlined,
                                  size: 16.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                              Text(
                                'Import your file in here with any \ntype and extension ',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        );
                      }
                    },
                  ),
                ),
                if (_model.uploadedFileUrls.isNotEmpty)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      safeSetState(() {
                        _model.isDataUploading = false;
                        _model.uploadedLocalFiles = [];
                        _model.uploadedFileUrls = [];
                      });

                      await widget.ref!.reference.update({
                        ...mapToFirestore(
                          {
                            'files': FieldValue.delete(),
                          },
                        ),
                      });
                    },
                    child: Text(
                      'Clear Selected Files',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).error,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
              ],
            ),
            RichText(
              textScaler: MediaQuery.of(context).textScaler,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Installation Guide       ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextSpan(
                    text: '*required',
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 314.0,
                    child: custom_widgets.RichTextEditor(
                      width: double.infinity,
                      height: 314.0,
                      initData: widget.ref?.moreProductInfo,
                      saveFormattedText: (formattedText) async {
                        await widget.ref!.reference
                            .update(createProductsRecordData(
                          installationGuide: formattedText.toString(),
                        ));
                        _model.guide = formattedText;
                        safeSetState(() {});
                      },
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await widget.onBack?.call();
                  },
                  text: 'Back',
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: 147.0,
                    height: 45.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Manrope',
                          color: const Color(0xFF121212),
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.guide == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please provide an installation guide',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else if (_model.moreInfo == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please add a detailed description of your product',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else if (!(_model.uploadedFileUrls.isNotEmpty)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select files to be uploaded',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            await widget.onNext?.call();
                          }
                        },
                        child: Container(
                          width: 144.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(50.0),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 2.0, 0.0),
                                child: Text(
                                  'Next',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: const Color(0xFF121212),
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF121212),
                                size: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(width: 40.0)),
            ),
          ].divide(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
