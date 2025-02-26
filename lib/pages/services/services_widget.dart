import '/components/floating_bottom_nav/floating_bottom_nav_widget.dart';
import '/components/service_selection_btn/service_selection_btn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'services_model.dart';
export 'services_model.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  static String routeName = 'Services';
  static String routePath = '/services';

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  late ServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Container(
                                width: 70.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5164BF),
                                  borderRadius: BorderRadius.circular(25.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(LandingWidget.routeName);
                                  },
                                  child: Icon(
                                    Icons.keyboard_backspace_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'l4iwav2o' /* Select type of loan you want */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.95,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF8EDFEB),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(HomeLoanFormWidget.routeName);
                          },
                          child: wrapWithModel(
                            model: _model.serviceSelectionBtnModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: ServiceSelectionBtnWidget(
                              serviceName: 'HOME LOAN',
                              serviceImage:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/loan-ba2x7a/assets/xyvbge0ukbkp/Hoam_Loan.png',
                              onClickAction: () async {},
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(BussinesLoanFormWidget.routeName);
                          },
                          child: wrapWithModel(
                            model: _model.serviceSelectionBtnModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: ServiceSelectionBtnWidget(
                              serviceName: 'BUSSINESS LOAN',
                              serviceImage:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/loan-ba2x7a/assets/uz6et3wtutv9/BUSSINESS_LOAN.png',
                              onClickAction: () async {},
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context
                                .pushNamed(EducationLoanFormWidget.routeName);
                          },
                          child: wrapWithModel(
                            model: _model.serviceSelectionBtnModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: ServiceSelectionBtnWidget(
                              serviceName: 'EDUCATION LOAN',
                              serviceImage:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/loan-ba2x7a/assets/lx184ty8f7o5/Education_Loan.png',
                              onClickAction: () async {},
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(RealestateWidget.routeName);
                          },
                          child: wrapWithModel(
                            model: _model.serviceSelectionBtnModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: ServiceSelectionBtnWidget(
                              serviceName: 'REALESTATE',
                              serviceImage:
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/loan-ba2x7a/assets/bvilr2ligxat/realestate.png',
                              onClickAction: () async {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.floatingBottomNavModel,
                        updateCallback: () => safeSetState(() {}),
                        child: FloatingBottomNavWidget(
                          currentPage: 'Loan',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
