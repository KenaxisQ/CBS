import '/components/floating_bottom_nav/floating_bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_loan_form_widget.dart' show HomeLoanFormWidget;
import 'package:flutter/material.dart';

class HomeLoanFormModel extends FlutterFlowModel<HomeLoanFormWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for HomeLoanMode widget.
  String? homeLoanModeValue;
  FormFieldController<String>? homeLoanModeValueController;
  // State field(s) for HouseType widget.
  String? houseTypeValue;
  FormFieldController<String>? houseTypeValueController;
  // State field(s) for HouseRegistration widget.
  String? houseRegistrationValue;
  FormFieldController<String>? houseRegistrationValueController;
  // State field(s) for HomeLoanOccupation widget.
  String? homeLoanOccupationValue;
  FormFieldController<String>? homeLoanOccupationValueController;
  // State field(s) for MonthlyIncome widget.
  FocusNode? monthlyIncomeFocusNode;
  TextEditingController? monthlyIncomeTextController;
  String? Function(BuildContext, String?)? monthlyIncomeTextControllerValidator;
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
  // Stores action output result for [Custom Action - insertHomeLoan] action in Button widget.
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
    monthlyIncomeFocusNode?.dispose();
    monthlyIncomeTextController?.dispose();

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
