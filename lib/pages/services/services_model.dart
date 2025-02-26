import '/components/floating_bottom_nav/floating_bottom_nav_widget.dart';
import '/components/service_selection_btn/service_selection_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'services_widget.dart' show ServicesWidget;
import 'package:flutter/material.dart';

class ServicesModel extends FlutterFlowModel<ServicesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ServiceSelectionBtn component.
  late ServiceSelectionBtnModel serviceSelectionBtnModel1;
  // Model for ServiceSelectionBtn component.
  late ServiceSelectionBtnModel serviceSelectionBtnModel2;
  // Model for ServiceSelectionBtn component.
  late ServiceSelectionBtnModel serviceSelectionBtnModel3;
  // Model for ServiceSelectionBtn component.
  late ServiceSelectionBtnModel serviceSelectionBtnModel4;
  // Model for FloatingBottomNav component.
  late FloatingBottomNavModel floatingBottomNavModel;

  @override
  void initState(BuildContext context) {
    serviceSelectionBtnModel1 =
        createModel(context, () => ServiceSelectionBtnModel());
    serviceSelectionBtnModel2 =
        createModel(context, () => ServiceSelectionBtnModel());
    serviceSelectionBtnModel3 =
        createModel(context, () => ServiceSelectionBtnModel());
    serviceSelectionBtnModel4 =
        createModel(context, () => ServiceSelectionBtnModel());
    floatingBottomNavModel =
        createModel(context, () => FloatingBottomNavModel());
  }

  @override
  void dispose() {
    serviceSelectionBtnModel1.dispose();
    serviceSelectionBtnModel2.dispose();
    serviceSelectionBtnModel3.dispose();
    serviceSelectionBtnModel4.dispose();
    floatingBottomNavModel.dispose();
  }
}
