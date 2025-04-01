import '/components/transaction_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_component_widget.dart' show DashboardComponentWidget;
import 'package:flutter/material.dart';

class DashboardComponentModel
    extends FlutterFlowModel<DashboardComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TransactionCard component.
  late TransactionCardModel transactionCardModel1;
  // Model for TransactionCard component.
  late TransactionCardModel transactionCardModel2;
  // Model for TransactionCard component.
  late TransactionCardModel transactionCardModel3;
  // Model for TransactionCard component.
  late TransactionCardModel transactionCardModel4;
  // Model for TransactionCard component.
  late TransactionCardModel transactionCardModel5;
  // Model for TransactionCard component.
  late TransactionCardModel transactionCardModel6;

  @override
  void initState(BuildContext context) {
    transactionCardModel1 = createModel(context, () => TransactionCardModel());
    transactionCardModel2 = createModel(context, () => TransactionCardModel());
    transactionCardModel3 = createModel(context, () => TransactionCardModel());
    transactionCardModel4 = createModel(context, () => TransactionCardModel());
    transactionCardModel5 = createModel(context, () => TransactionCardModel());
    transactionCardModel6 = createModel(context, () => TransactionCardModel());
  }

  @override
  void dispose() {
    transactionCardModel1.dispose();
    transactionCardModel2.dispose();
    transactionCardModel3.dispose();
    transactionCardModel4.dispose();
    transactionCardModel5.dispose();
    transactionCardModel6.dispose();
  }
}
