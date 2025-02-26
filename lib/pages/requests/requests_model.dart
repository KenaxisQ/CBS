import '/components/request_cards/request_cards_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'requests_widget.dart' show RequestsWidget;
import 'package:flutter/material.dart';

class RequestsModel extends FlutterFlowModel<RequestsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for RequestCards dynamic component.
  late FlutterFlowDynamicModels<RequestCardsModel> requestCardsModels;

  @override
  void initState(BuildContext context) {
    requestCardsModels = FlutterFlowDynamicModels(() => RequestCardsModel());
  }

  @override
  void dispose() {
    requestCardsModels.dispose();
  }
}
