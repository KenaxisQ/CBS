import '../database.dart';

class EducationLoanTable extends SupabaseTable<EducationLoanRow> {
  @override
  String get tableName => 'EDUCATION LOAN';

  @override
  EducationLoanRow createRow(Map<String, dynamic> data) =>
      EducationLoanRow(data);
}

class EducationLoanRow extends SupabaseDataRow {
  EducationLoanRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EducationLoanTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get education => getField<String>('education');
  set education(String? value) => setField<String>('education', value);

  String? get loanType => getField<String>('loan_type');
  set loanType(String? value) => setField<String>('loan_type', value);

  double? get loanAmount => getField<double>('loan_amount');
  set loanAmount(double? value) => setField<double>('loan_amount', value);

  String? get otherLoans => getField<String>('other_loans');
  set otherLoans(String? value) => setField<String>('other_loans', value);

  int? get cibil => getField<int>('cibil');
  set cibil(int? value) => setField<int>('cibil', value);

  String? get loanMode => getField<String>('loan_mode');
  set loanMode(String? value) => setField<String>('loan_mode', value);
}
