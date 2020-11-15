import 'package:flutter/material.dart';

import 'opacity_animated.dart';

class CustomLine extends StatelessWidget {
  /// Whether this indicator is selected or not.
  final bool isSelected;

  /// The child to be placed within the indicator.
  final Widget child;

  /// Action to be taken when this indictor is pressed.
  final Function onPressed;

  /// Color of this indicator when it is not selected.
  final Color color;

  /// Color of this indicator when it is selected.
  final Color activeColor;

  /// Border color of this indicator when it is selected.
  final Color activeBorderColor;

  /// The border width of this indicator when it is selected.
  final activeBorderWidth;

  /// Radius of this indicator.
  final double radius;

  /// The amount of padding around each side of the child.
  final double padding;

  /// The amount of margin around each side of the indicator.
  final double margin;

  CustomLine({
    this.isSelected = false,
    this.child,
    this.onPressed,
    this.color,
    this.activeColor,
    this.activeBorderColor,
    this.radius = 24.0,
    this.padding = 5.0,
    this.margin = 1.0,
    this.activeBorderWidth = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return OpacityAnimated(
      animationDisabled: !isSelected,
      child: Container(
        padding: isSelected ? EdgeInsets.all(margin) : EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey,
          border: isSelected
              ? Border.all(
                  color: activeBorderColor ?? Colors.blue,
                  width: activeBorderWidth,
                )
              : Border.all(
                  color: Colors.grey,
                  width: activeBorderWidth,
                ),
          // shape: BoxShape.circle,
        ),
        height: 8,
        // width: double.infinity,
      ),
    );
  }
}
