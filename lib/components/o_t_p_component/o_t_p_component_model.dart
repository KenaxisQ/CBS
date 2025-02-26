import '/flutter_flow/flutter_flow_util.dart';
import 'o_t_p_component_widget.dart' show OTPComponentWidget;
import 'package:flutter/material.dart';

class OTPComponentModel extends FlutterFlowModel<OTPComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
