import '/flutter_flow/flutter_flow_util.dart';
import '/landing_page/saa_s_big_card/saa_s_big_card_widget.dart';
import '/landing_page/saa_s_card1/saa_s_card1_widget.dart';
import '/landing_page/saa_s_card2/saa_s_card2_widget.dart';
import '/landing_page/saa_s_card3/saa_s_card3_widget.dart';
import '/landing_page/saa_s_card4/saa_s_card4_widget.dart';
import 'empower_business_session_widget.dart' show EmpowerBusinessSessionWidget;
import 'package:flutter/material.dart';

class EmpowerBusinessSessionModel
    extends FlutterFlowModel<EmpowerBusinessSessionWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SaaSBigCard component.
  late SaaSBigCardModel saaSBigCardModel1;
  // Model for SaaSCard1 component.
  late SaaSCard1Model saaSCard1Model1;
  // Model for SaaSCard2 component.
  late SaaSCard2Model saaSCard2Model;
  // Model for SaaSCard3 component.
  late SaaSCard3Model saaSCard3Model;
  // Model for SaaSCard4 component.
  late SaaSCard4Model saaSCard4Model;
  // Model for SaaSBigCard component.
  late SaaSBigCardModel saaSBigCardModel2;
  // Model for SaaSCard1 component.
  late SaaSCard1Model saaSCard1Model2;
  // Model for SaaSCard1 component.
  late SaaSCard1Model saaSCard1Model3;
  // Model for SaaSCard1 component.
  late SaaSCard1Model saaSCard1Model4;
  // Model for SaaSCard1 component.
  late SaaSCard1Model saaSCard1Model5;

  @override
  void initState(BuildContext context) {
    saaSBigCardModel1 = createModel(context, () => SaaSBigCardModel());
    saaSCard1Model1 = createModel(context, () => SaaSCard1Model());
    saaSCard2Model = createModel(context, () => SaaSCard2Model());
    saaSCard3Model = createModel(context, () => SaaSCard3Model());
    saaSCard4Model = createModel(context, () => SaaSCard4Model());
    saaSBigCardModel2 = createModel(context, () => SaaSBigCardModel());
    saaSCard1Model2 = createModel(context, () => SaaSCard1Model());
    saaSCard1Model3 = createModel(context, () => SaaSCard1Model());
    saaSCard1Model4 = createModel(context, () => SaaSCard1Model());
    saaSCard1Model5 = createModel(context, () => SaaSCard1Model());
  }

  @override
  void dispose() {
    saaSBigCardModel1.dispose();
    saaSCard1Model1.dispose();
    saaSCard2Model.dispose();
    saaSCard3Model.dispose();
    saaSCard4Model.dispose();
    saaSBigCardModel2.dispose();
    saaSCard1Model2.dispose();
    saaSCard1Model3.dispose();
    saaSCard1Model4.dispose();
    saaSCard1Model5.dispose();
  }
}
