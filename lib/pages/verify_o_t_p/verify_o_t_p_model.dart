import '/backend/supabase/supabase.dart';
import '/components/o_t_p_component/o_t_p_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_o_t_p_widget.dart' show VerifyOTPWidget;
import 'package:flutter/material.dart';

class VerifyOTPModel extends FlutterFlowModel<VerifyOTPWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OTP_Component component.
  late OTPComponentModel oTPComponentModel;
  // Stores action output result for [Custom Action - confirmOtp] action in Button-Login widget.
  String? confirmOtpResponse;
  // Stores action output result for [Backend Call - Query Rows] action in Button-Login widget.
  List<UserRolesRow>? userRoleRecored;

  @override
  void initState(BuildContext context) {
    oTPComponentModel = createModel(context, () => OTPComponentModel());
  }

  @override
  void dispose() {
    oTPComponentModel.dispose();
  }
}
