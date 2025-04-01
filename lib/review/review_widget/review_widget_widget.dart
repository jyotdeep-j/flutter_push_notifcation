import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'review_widget_model.dart';
export 'review_widget_model.dart';

class ReviewWidgetWidget extends StatefulWidget {
  const ReviewWidgetWidget({
    super.key,
    required this.product,
  });

  final DocumentReference? product;

  @override
  State<ReviewWidgetWidget> createState() => _ReviewWidgetWidgetState();
}

class _ReviewWidgetWidgetState extends State<ReviewWidgetWidget> {
  late ReviewWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewWidgetModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your message',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Manrope',
                    letterSpacing: 0.0,
                  ),
              hintText: 'Write your message...',
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Manrope',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryText,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              contentPadding: const EdgeInsets.all(20.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  fontSize: 13.0,
                  letterSpacing: 0.0,
                ),
            maxLines: 5,
            minLines: 1,
            validator: _model.textControllerValidator.asValidator(context),
          ),
          Text(
            'Give your rating',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Manrope',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          RatingBar.builder(
            onRatingUpdate: (newValue) =>
                safeSetState(() => _model.ratingBarValue = newValue),
            itemBuilder: (context, index) => const Icon(
              Icons.star_rounded,
              color: Color(0xFFF6C035),
            ),
            direction: Axis.horizontal,
            initialRating: _model.ratingBarValue ??= 0.0,
            unratedColor: const Color(0xFFE3E3E3),
            itemCount: 5,
            itemSize: 22.0,
            glowColor: const Color(0xFFF6C035),
          ),
          FFButtonWidget(
            onPressed: () async {
              await ReviewsRecord.createDoc(widget.product!)
                  .set(createReviewsRecordData(
                rating: _model.ratingBarValue?.round(),
                createdAt: getCurrentTimestamp,
                modifiedAt: getCurrentTimestamp,
                text: _model.textController.text,
                customer: currentUserReference,
              ));
            },
            text: 'Submit',
            options: FFButtonOptions(
              width: 254.0,
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Manrope',
                    color: FlutterFlowTheme.of(context).info,
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
        ].divide(const SizedBox(height: 16.0)),
      ),
    );
  }
}
