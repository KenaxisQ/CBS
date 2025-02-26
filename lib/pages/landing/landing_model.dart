import '/backend/supabase/supabase.dart';
import '/components/floating_bottom_nav/floating_bottom_nav_widget.dart';
import '/components/partner_coursuel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'landing_widget.dart' show LandingWidget;
import 'package:flutter/material.dart';

class LandingModel extends FlutterFlowModel<LandingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in landing widget.
  List<UserRolesRow>? userRoleFetched;
  // Stores action output result for [Custom Action - logout] action in Button widget.
  bool? response;
  // Model for PartnerCoursuel component.
  late PartnerCoursuelModel partnerCoursuelModel;
  // Model for FloatingBottomNav component.
  late FloatingBottomNavModel floatingBottomNavModel;

  @override
  void initState(BuildContext context) {
    partnerCoursuelModel = createModel(context, () => PartnerCoursuelModel());
    floatingBottomNavModel =
        createModel(context, () => FloatingBottomNavModel());
  }

  @override
  void dispose() {
    partnerCoursuelModel.dispose();
    floatingBottomNavModel.dispose();
  }
}
