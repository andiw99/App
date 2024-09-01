

import 'package:flutter/material.dart';

class RebuildPageRoute extends MaterialPageRoute {
  final Function()? onNextRouteChange;
  RebuildPageRoute(this.onNextRouteChange, {required super.builder});

  @override
  void didChangeNext(Route? nextRoute) {
      super.didChangeNext(nextRoute);      
      onNextRouteChange!();
   }
  }

class RebuildIfAuthChangeRoute extends RebuildPageRoute {
  final Function()? onNextRouteChange;
  bool authenticated;
  RebuildIfAuthChangeRoute(this.onNextRouteChange, {required this.authenticated, required super.builder}) : super(onNextRouteChange);

  @override
  void didChangeNext(Route? nextRoute) {
      super.didChangeNext(nextRoute);      
      onNextRouteChange!();
   }
  }