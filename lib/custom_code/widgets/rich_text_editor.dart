// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_quill/flutter_quill.dart';

class RichTextEditor extends StatefulWidget {
  const RichTextEditor({
    super.key,
    this.width,
    this.height,
    this.initData,
    required this.saveFormattedText,
  });

  final double? width;
  final double? height;
  final String? initData;
  final Future Function(dynamic formattedText) saveFormattedText;

  @override
  State<RichTextEditor> createState() => _RichTextEditorState();
}

class _RichTextEditorState extends State<RichTextEditor> {
  late QuillController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = (widget.initData == null || (widget.initData == ''))
        ? QuillController.basic()
        : QuillController(
            document: Document.fromJson(
              jsonDecode(
                convertToJson(widget.initData!),
              ),
            ),
            selection: TextSelection.collapsed(offset: 0),
          );
    _controller.addListener(() {
      widget.saveFormattedText(_controller.document.toDelta().toJson());
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        QuillToolbar.simple(
          configurations: QuillSimpleToolbarConfigurations(
            controller: _controller,
            toolbarIconAlignment: WrapAlignment.start,
            buttonOptions: QuillSimpleToolbarButtonOptions(
              base: QuillToolbarBaseButtonOptions(
                iconTheme: QuillIconTheme(
                  iconButtonSelectedData: IconButtonData(
                      color: FlutterFlowTheme.of(context).primaryText),
                  iconButtonUnselectedData: IconButtonData(
                      color: FlutterFlowTheme.of(context).primaryText),
                ),
              ),
            ),
            sectionDividerColor: FlutterFlowTheme.of(context).primaryText,
            showFontFamily: false,
            showFontSize: false,
            showStrikeThrough: false,
            showInlineCode: false,
            showColorButton: false,
            showBackgroundColorButton: false,
            showClearFormat: false,
            showListCheck: false,
            showLeftAlignment: false,
            showCenterAlignment: false,
            showRightAlignment: false,
            showJustifyAlignment: false,
            showHeaderStyle: false,
            showCodeBlock: false,
            showQuote: false,
            showIndent: false,
            showUndo: false,
            showRedo: false,
            showSearchButton: false,
            showSubscript: false,
            showSuperscript: false,
          ),
        ),
        Expanded(
          child: QuillEditor.basic(
            focusNode: _focusNode,
            configurations: QuillEditorConfigurations(
              autoFocus: true,
              controller: _controller,
              padding: EdgeInsets.all(20),
            ),
          ),
        ),
      ],
    );
  }
}
