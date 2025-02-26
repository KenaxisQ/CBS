import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'c_b_s_logo_model.dart';
export 'c_b_s_logo_model.dart';

/// Logo for CBS
class CBSLogoWidget extends StatefulWidget {
  const CBSLogoWidget({super.key});

  @override
  State<CBSLogoWidget> createState() => _CBSLogoWidgetState();
}

class _CBSLogoWidgetState extends State<CBSLogoWidget> {
  late CBSLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CBSLogoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
      child: Stack(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xFF5063BF),
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional(20.0, 0.0),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0xFF8EDFEB),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
