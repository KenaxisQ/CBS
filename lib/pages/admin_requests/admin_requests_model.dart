import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_requests_widget.dart' show AdminRequestsWidget;
import 'package:flutter/material.dart';

class AdminRequestsModel extends FlutterFlowModel<AdminRequestsWidget> {
  ///  Local state fields for this page.

  List<UserRequestsRow> adminRequestView = [];
  void addToAdminRequestView(UserRequestsRow item) =>
      adminRequestView.add(item);
  void removeFromAdminRequestView(UserRequestsRow item) =>
      adminRequestView.remove(item);
  void removeAtIndexFromAdminRequestView(int index) =>
      adminRequestView.removeAt(index);
  void insertAtIndexInAdminRequestView(int index, UserRequestsRow item) =>
      adminRequestView.insert(index, item);
  void updateAdminRequestViewAtIndex(
          int index, Function(UserRequestsRow) updateFn) =>
      adminRequestView[index] = updateFn(adminRequestView[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in AdminRequests widget.
  List<UserRequestsRow>? userRequests;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UserRequestsRow>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
