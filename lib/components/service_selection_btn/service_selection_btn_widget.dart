import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'service_selection_btn_model.dart';
export 'service_selection_btn_model.dart';

class ServiceSelectionBtnWidget extends StatefulWidget {
  const ServiceSelectionBtnWidget({
    super.key,
    String? serviceName,
    String? serviceImage,
    required this.onClickAction,
  })  : this.serviceName = serviceName ?? 'LOAN',
        this.serviceImage = serviceImage ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/loan-ba2x7a/assets/xyvbge0ukbkp/Hoam_Loan.png';

  final String serviceName;
  final String serviceImage;
  final Future Function()? onClickAction;

  @override
  State<ServiceSelectionBtnWidget> createState() =>
      _ServiceSelectionBtnWidgetState();
}

class _ServiceSelectionBtnWidgetState extends State<ServiceSelectionBtnWidget> {
  late ServiceSelectionBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceSelectionBtnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.serviceImage,
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/loan-ba2x7a/assets/xyvbge0ukbkp/Hoam_Loan.png',
                          ),
                          fit: BoxFit.fill,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Text(
                      valueOrDefault<String>(
                        widget.serviceName,
                        'HOME LOAN',
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
