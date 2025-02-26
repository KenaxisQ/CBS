import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'o_t_p_component_model.dart';
export 'o_t_p_component_model.dart';

class OTPComponentWidget extends StatefulWidget {
  const OTPComponentWidget({super.key});

  @override
  State<OTPComponentWidget> createState() => _OTPComponentWidgetState();
}

class _OTPComponentWidgetState extends State<OTPComponentWidget> {
  late OTPComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OTPComponentModel());

    _model.pinCodeFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'ehs1qg6m' /* OTP */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Fira Sans Condensed',
                    color: Color(0xFF5063BF),
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
          child: PinCodeTextField(
            autoDisposeControllers: false,
            appContext: context,
            length: 6,
            textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Fira Sans Condensed',
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            enableActiveFill: false,
            autoFocus: true,
            focusNode: _model.pinCodeFocusNode,
            enablePinAutofill: false,
            errorTextSpace: 16.0,
            showCursor: true,
            cursorColor: FlutterFlowTheme.of(context).primary,
            obscureText: false,
            hintCharacter: '-',
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
              fieldHeight: 44.0,
              fieldWidth: 44.0,
              borderWidth: 2.0,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              shape: PinCodeFieldShape.underline,
              activeColor: Color(0xFF5063BF),
              inactiveColor: FlutterFlowTheme.of(context).alternate,
              selectedColor: FlutterFlowTheme.of(context).primary,
            ),
            controller: _model.pinCodeController,
            onChanged: (_) {},
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _model.pinCodeControllerValidator.asValidator(context),
          ),
        ),
      ],
    );
  }
}
