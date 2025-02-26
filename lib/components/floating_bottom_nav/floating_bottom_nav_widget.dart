import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'floating_bottom_nav_model.dart';
export 'floating_bottom_nav_model.dart';

class FloatingBottomNavWidget extends StatefulWidget {
  const FloatingBottomNavWidget({
    super.key,
    required this.currentPage,
  });

  final String? currentPage;

  @override
  State<FloatingBottomNavWidget> createState() =>
      _FloatingBottomNavWidgetState();
}

class _FloatingBottomNavWidgetState extends State<FloatingBottomNavWidget> {
  late FloatingBottomNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FloatingBottomNavModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.85,
              height: 70.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(LandingWidget.routeName);
                    },
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: widget.currentPage == 'Home'
                            ? Color(0xFF5164BF)
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.currentPage == 'Home'
                              ? Color(0xFF5164BF)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.home,
                            color: widget.currentPage == 'Home'
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : Color(0xFF8AD6E8),
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(ServicesWidget.routeName);
                    },
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: widget.currentPage == 'Loan'
                            ? Color(0xFF5164BF)
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.currentPage == 'Loan'
                              ? Color(0xFF5164BF)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: widget.currentPage == 'Loan'
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : Color(0xFF8AD6E8),
                            size: 24.0,
                          ),
                        ),
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
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: widget.currentPage == 'Realestate'
                            ? Color(0xFF5164BF)
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.currentPage == 'Realestate'
                              ? Color(0xFF5164BF)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.insert_chart_rounded,
                            color: widget.currentPage == 'Realestate'
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : Color(0xFF8AD6E8),
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: widget.currentPage == 'User'
                          ? Color(0xFF5164BF)
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setAppLanguage(
                            context,
                            FFLocalizations.of(context).languageCode == 'ENG'
                                ? 'Telugu'
                                : 'English');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.currentPage == 'User'
                              ? Color(0xFF5164BF)
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.language,
                              color: widget.currentPage == 'User'
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : Color(0xFF8AD6E8),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
