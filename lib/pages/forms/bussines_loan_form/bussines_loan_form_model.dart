import '/components/floating_bottom_nav/floating_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'bussines_loan_form_widget.dart' show BussinesLoanFormWidget;
import 'package:flutter/material.dart';

class BussinesLoanFormModel extends FlutterFlowModel<BussinesLoanFormWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for loanMode widget.
  String? loanModeValue;
  FormFieldController<String>? loanModeValueController;
  // State field(s) for loanType widget.
  String? loanTypeValue;
  FormFieldController<String>? loanTypeValueController;
  // State field(s) for bussinessType widget.
  FocusNode? bussinessTypeFocusNode;
  TextEditingController? bussinessTypeTextController;
  String? Function(BuildContext, String?)? bussinessTypeTextControllerValidator;
  // State field(s) for requiredLoan widget.
  String? requiredLoanValue;
  FormFieldController<String>? requiredLoanValueController;
  // State field(s) for OtherLoans widget.
  FocusNode? otherLoansFocusNode;
  TextEditingController? otherLoansTextController;
  String? Function(BuildContext, String?)? otherLoansTextControllerValidator;
  // State field(s) for Cibil widget.
  FocusNode? cibilFocusNode;
  TextEditingController? cibilTextController;
  String? Function(BuildContext, String?)? cibilTextControllerValidator;
  // State field(s) for LoanAmount widget.
  FocusNode? loanAmountFocusNode;
  TextEditingController? loanAmountTextController;
  String? Function(BuildContext, String?)? loanAmountTextControllerValidator;
  // State field(s) for Referrer widget.
  FocusNode? referrerFocusNode;
  TextEditingController? referrerTextController;
  String? Function(BuildContext, String?)? referrerTextControllerValidator;
  // Stores action output result for [Custom Action - insertBussinessLoan] action in Button widget.
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
    bussinessTypeFocusNode?.dispose();
    bussinessTypeTextController?.dispose();

    otherLoansFocusNode?.dispose();
    otherLoansTextController?.dispose();

    cibilFocusNode?.dispose();
    cibilTextController?.dispose();

    loanAmountFocusNode?.dispose();
    loanAmountTextController?.dispose();

    referrerFocusNode?.dispose();
    referrerTextController?.dispose();

    floatingBottomNavModel.dispose();
  }
}
