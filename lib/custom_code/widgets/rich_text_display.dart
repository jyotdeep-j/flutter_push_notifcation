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
import 'package:flutter_quill/quill_delta.dart';

class RichTextDisplay extends StatefulWidget {
  const RichTextDisplay({
    super.key,
    this.width,
    this.height,
    required this.text,
  });

  final double? width;
  final double? height;
  final String? text;

  @override
  State<RichTextDisplay> createState() => _RichTextDisplayState();
}

class _RichTextDisplayState extends State<RichTextDisplay> {
  late QuillController _controller;
  late Delta delta;

  dynamic convertToJson(String json) {
    json = json.replaceAll('{', '{"');
    json = json.replaceAll(': ', '": "');
    json = json.replaceAll(', ', '", "');
    json = json.replaceAll('}', '"}');

    json = json.replaceAll('"{', '{');
    json = json.replaceAll('}"', '}');
    json = json.replaceAll('\n', '\\n');
    json = json.replaceAll('""', '"null"');
    return json;
  }

  @override
  void initState() {
    super.initState();
    print('Text from widget');
    print(widget.text);
    print(convertToJson(widget.text!));
    try {
      // Initialize the QuillController with the Delta
      _controller = QuillController(
        document: widget.text != null
            ? Document.fromJson(
                jsonDecode(
                  convertToJson(widget.text!),
                ),
              )
            : Document(),
        selection: TextSelection.collapsed(offset: 0),
      );
    } catch (e) {
      _controller = QuillController(
        document: Document(),
        selection: TextSelection.collapsed(offset: 0),
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return QuillEditor.basic(
      configurations: QuillEditorConfigurations(
        controller: _controller,
      ),
    );
  }
}
