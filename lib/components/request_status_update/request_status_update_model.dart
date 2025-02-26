import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'request_status_update_widget.dart' show RequestStatusUpdateWidget;
import 'package:flutter/material.dart';

class RequestStatusUpdateModel
    extends FlutterFlowModel<RequestStatusUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserRequestsRow>? updateResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
