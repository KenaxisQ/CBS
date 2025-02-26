import '../database.dart';

class HouseLoanTable extends SupabaseTable<HouseLoanRow> {
  @override
  String get tableName => 'HOUSE LOAN';

  @override
  HouseLoanRow createRow(Map<String, dynamic> data) => HouseLoanRow(data);
}

class HouseLoanRow extends SupabaseDataRow {
  HouseLoanRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HouseLoanTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get mode => getField<String>('mode');
  set mode(String? value) => setField<String>('mode', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  bool? get registeration => getField<bool>('registeration');
  set registeration(bool? value) => setField<bool>('registeration', value);

  String? get occupation => getField<String>('occupation');
  set occupation(String? value) => setField<String>('occupation', value);

  String? get otherLoans => getField<String>('other_loans');
  set otherLoans(String? value) => setField<String>('other_loans', value);

  double? get cibil => getField<double>('cibil');
  set cibil(double? value) => setField<double>('cibil', value);

  double? get loanAmount => getField<double>('loan_amount');
  set loanAmount(double? value) => setField<double>('loan_amount', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
