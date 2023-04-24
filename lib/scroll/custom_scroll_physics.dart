import 'package:flutter/material.dart';

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // reduce the scroll speed by 50%
    return super.applyPhysicsToUserOffset(position, offset * 0.5);
  }

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }
}
