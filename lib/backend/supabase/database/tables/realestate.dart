import '../database.dart';

class RealestateTable extends SupabaseTable<RealestateRow> {
  @override
  String get tableName => 'REALESTATE';

  @override
  RealestateRow createRow(Map<String, dynamic> data) => RealestateRow(data);
}

class RealestateRow extends SupabaseDataRow {
  RealestateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RealestateTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get offerType => getField<String>('offer_type');
  set offerType(String? value) => setField<String>('offer_type', value);

  String? get propertyType => getField<String>('property_type');
  set propertyType(String? value) => setField<String>('property_type', value);

  String? get propertyDetails => getField<String>('property_details');
  set propertyDetails(String? value) =>
      setField<String>('property_details', value);

  String? get propertyAddress => getField<String>('property_address');
  set propertyAddress(String? value) =>
      setField<String>('property_address', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
