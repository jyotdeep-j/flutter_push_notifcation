import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'get_in_touch_model.dart';
export 'get_in_touch_model.dart';

class GetInTouchWidget extends StatefulWidget {
  const GetInTouchWidget({super.key});

  @override
  State<GetInTouchWidget> createState() => _GetInTouchWidgetState();
}

class _GetInTouchWidgetState extends State<GetInTouchWidget> {
  late GetInTouchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetInTouchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
