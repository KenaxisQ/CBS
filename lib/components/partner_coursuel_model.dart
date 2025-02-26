import '/flutter_flow/flutter_flow_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'partner_coursuel_widget.dart' show PartnerCoursuelWidget;
import 'package:flutter/material.dart';

class PartnerCoursuelModel extends FlutterFlowModel<PartnerCoursuelWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
