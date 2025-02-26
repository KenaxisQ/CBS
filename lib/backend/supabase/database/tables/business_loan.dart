import '../database.dart';

class BusinessLoanTable extends SupabaseTable<BusinessLoanRow> {
  @override
  String get tableName => 'BUSINESS_LOAN';

  @override
  BusinessLoanRow createRow(Map<String, dynamic> data) => BusinessLoanRow(data);
}

class BusinessLoanRow extends SupabaseDataRow {
  BusinessLoanRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BusinessLoanTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get mode => getField<String>('mode');
  set mode(String? value) => setField<String>('mode', value);

  String? get loanType => getField<String>('loan_type');
  set loanType(String? value) => setField<String>('loan_type', value);

  String? get businessType => getField<String>('business_type');
  set businessType(String? value) => setField<String>('business_type', value);

  double? get loanAmount => getField<double>('loan_amount');
  set loanAmount(double? value) => setField<double>('loan_amount', value);

  String? get otherLoans => getField<String>('other_loans');
  set otherLoans(String? value) => setField<String>('other_loans', value);

  String? get cibil => getField<String>('cibil');
  set cibil(String? value) => setField<String>('cibil', value);

  String? get requiredLoan => getField<String>('required_loan');
  set requiredLoan(String? value) => setField<String>('required_loan', value);
}
