import '/components/floating_bottom_nav/floating_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'realestate_widget.dart' show RealestateWidget;
import 'package:flutter/material.dart';

class RealestateModel extends FlutterFlowModel<RealestateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for offerType widget.
  String? offerTypeValue;
  FormFieldController<String>? offerTypeValueController;
  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  // State field(s) for details widget.
  FocusNode? detailsFocusNode;
  TextEditingController? detailsTextController;
  String? Function(BuildContext, String?)? detailsTextControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for Referrer widget.
  FocusNode? referrerFocusNode;
  TextEditingController? referrerTextController;
  String? Function(BuildContext, String?)? referrerTextControllerValidator;
  // Stores action output result for [Custom Action - insertRealestate] action in Button widget.
  String? response;
  // Model for FloatingBottomNav component.
  late FloatingBottomNavModel floatingBottomNavModel;

  @override
  void initState(BuildContext context) {
    floatingBottomNavModel =
        createModel(context, () => FloatingBottomNavModel());
  }

  @override
  void dispose() {
    detailsFocusNode?.dispose();
    detailsTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    referrerFocusNode?.dispose();
    referrerTextController?.dispose();

    floatingBottomNavModel.dispose();
  }
}
