import '../database.dart';

class UserRequestsTable extends SupabaseTable<UserRequestsRow> {
  @override
  String get tableName => 'USER REQUESTS';

  @override
  UserRequestsRow createRow(Map<String, dynamic> data) => UserRequestsRow(data);
}

class UserRequestsRow extends SupabaseDataRow {
  UserRequestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRequestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get requestId => getField<String>('request_id');
  set requestId(String? value) => setField<String>('request_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get refferedBy => getField<String>('reffered_by');
  set refferedBy(String? value) => setField<String>('reffered_by', value);
}
