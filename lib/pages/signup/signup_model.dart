import '/components/c_b_s_logo/c_b_s_logo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CBS_Logo component.
  late CBSLogoModel cBSLogoModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - getPhoneOtp] action in Button widget.
  String? isOtpSent;

  @override
  void initState(BuildContext context) {
    cBSLogoModel = createModel(context, () => CBSLogoModel());
  }

  @override
  void dispose() {
    cBSLogoModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
