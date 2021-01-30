import 'package:flutter/material.dart';

import 'base_stepper.dart';

class ImageStepper extends StatelessWidget {
  /// Each image defines a step. Hence, total number of images determines the total number of steps.
  final List<ImageProvider<dynamic>> images;

  /// Whether to enable or disable the next and previous buttons.
  final bool enableNextPreviousButtons;

  /// Whether to allow tapping a step to move to that step or not.
  final bool enableStepTapping;

  /// Icon to be used for the previous button.
  final Icon previousButtonIcon;

  /// Icon to be used for the next button.
  final Icon nextButtonIcon;

  /// Determines what should happen when a step is reached. This callback provides the __index__ of the step that was reached.
  final OnStepReached onStepReached;

  /// Whether to show the steps horizontally or vertically. __Note: Ensure horizontal stepper goes inside a column and vertical goes inside a row.__
  final Axis direction;

  /// The color of the step when it is not reached.
  final Color stepColor;

  /// The amount of padding inside a step.
  final double stepPadding;

  /// The color of a step when it is reached.
  final Color activeStepColor;

  /// The border color of a step when it is reached.
  final Color activeStepBorderColor;

  /// The border width of the active step.
  final double activeStepBorderWidth;

  /// Determines how far away the border should be drawn from the step when it is reached.
  final double activeStepBorderPadding;

  /// The color of the line that separates the steps.
  final Color lineColor;

  /// The length of the line that separates the steps.
  final double lineLength;

  /// The radius of individual dot within the line that separates the steps.
  final double lineDotRadius;

  /// The radius of a step.
  final double stepRadius;

  /// The animation effect to show when a step is reached.
  final Curve stepReachedAnimationEffect;

  /// The duration of the animation effect to show when a step is reached.
  final Duration stepReachedAnimationDuration;

  /// Whether the stepping is enabled or disabled.
  final bool steppingEnabled;

  /// Whether to go to the next step or not.
  final bool goNext;

  /// Whether to go the next step or not.
  final bool goPrevious;

  /// Whether the scrolling is disabled or not.
  final bool scrollingDisabled;

  /// The currently active step.
  final int activeStep;

  /// Callback, provides the upper bound value.
  final Bound upperBound;

  /// Controls which `BaseStepper` constructor to call.
  final bool _isExternallyControlled;

  /// Used when the stepper is controlled externally using the `goNext` and `goPrevious` properties. In which case, two variables must be maintained in a StatefulWidget to set the values of `gotNext` and `goPrevious` in a call to `setState()`, and if the stepping is moving foward `gotNext` must be set to true and `goPrevious` must be set to `false`. If moving backward `goPrevious` must be set to `true` and `goNext` must be set to `false`.
  ///
  /// For more information, see example [here](https://pub.dev/packages/im_stepper/example).
  @Deprecated(
    'Scheduled to be removed in version 0.1.3. Please consider using the activeStep instead. For more information, see examples on https://pub.dev/packages/im_stepper/example',
  )
  ImageStepper.externallyControlled({
    this.images,
    this.direction = Axis.horizontal,
    this.stepColor,
    this.stepPadding = 1.0,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.activeStepBorderWidth = 0.5,
    this.activeStepBorderPadding = 5.0,
    this.lineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    @Deprecated(
      'Scheduled to be removed in version 0.1.3. Please consider using the activeStep instead. For more information, see examples on https://pub.dev/packages/im_stepper/example',
    )
        this.goNext,
    @Deprecated(
      'Scheduled to be removed in version 0.1.3. Please consider using the activeStep instead. For more information, see examples on https://pub.dev/packages/im_stepper/example',
    )
        this.goPrevious,
    this.scrollingDisabled = false,
    this.activeStep = 0,
    this.upperBound,
  })  : this.enableNextPreviousButtons = false,
        this.enableStepTapping = false,
        this.previousButtonIcon = null,
        this.nextButtonIcon = null,
        this.onStepReached = null,
        this._isExternallyControlled = true;

  /// Used when the stepping is controller either by using the built-in next/previous buttons or by tapping. If stepping needs to be controlled externally then using the `BaseStepper.externallyControlled` constructor is a more optimized approach.
  ///
  /// However, if situation demands using this constructor, but externally controlling the stepper is still required, then `enableNextPreviousButtons`, `enableStepTapping` must be disabled and `previousButtonIcon`, `nextButtonIcon`, and `onStepReached` must be `null`.
  ImageStepper({
    this.images,
    this.enableNextPreviousButtons = true,
    this.enableStepTapping = true,
    this.previousButtonIcon,
    this.nextButtonIcon,
    this.onStepReached,
    this.direction = Axis.horizontal,
    this.stepColor,
    this.stepPadding = 0.0,
    this.activeStepColor,
    this.activeStepBorderColor,
    this.activeStepBorderWidth = 0.5,
    this.activeStepBorderPadding = 1.0,
    this.lineColor,
    this.lineLength = 50.0,
    this.lineDotRadius = 1.0,
    this.stepRadius = 24.0,
    this.stepReachedAnimationEffect = Curves.bounceOut,
    this.stepReachedAnimationDuration = const Duration(seconds: 1),
    this.steppingEnabled = true,
    this.scrollingDisabled = false,
    this.activeStep,
    this.upperBound,
  })  : this._isExternallyControlled = false,
        this.goNext = false,
        this.goPrevious = false;

  @override
  Widget build(BuildContext context) {
    return _isExternallyControlled
        ? BaseStepper.externallyControlled(
            children: _imagesWrappedInCircleAvatar(),
            direction: direction,
            stepColor: stepColor,
            activeStepColor: activeStepColor,
            activeStepBorderColor: activeStepBorderColor,
            activeStepBorderWidth: activeStepBorderWidth,
            lineColor: lineColor,
            lineLength: lineLength,
            lineDotRadius: lineDotRadius,
            stepRadius: stepRadius,
            stepReachedAnimationEffect: stepReachedAnimationEffect,
            stepReachedAnimationDuration: stepReachedAnimationDuration,
            steppingEnabled: steppingEnabled,
            margin: activeStepBorderPadding,
            padding: stepPadding,
            scrollingDisabled: scrollingDisabled,
            goNext: goNext,
            goPrevious: goPrevious,
            activeStep: activeStep,
            upperBound: upperBound,
          )
        : BaseStepper(
            children: _imagesWrappedInCircleAvatar(),
            enableNextPreviousButtons: enableNextPreviousButtons,
            enableStepTapping: enableStepTapping,
            previousButtonIcon: previousButtonIcon,
            nextButtonIcon: nextButtonIcon,
            onStepReached: onStepReached,
            direction: direction,
            stepColor: stepColor,
            activeStepColor: activeStepColor,
            activeStepBorderColor: activeStepBorderColor,
            activeStepBorderWidth: activeStepBorderWidth,
            lineColor: lineColor,
            lineLength: lineLength,
            lineDotRadius: lineDotRadius,
            stepRadius: stepRadius,
            stepReachedAnimationEffect: stepReachedAnimationEffect,
            stepReachedAnimationDuration: stepReachedAnimationDuration,
            steppingEnabled: steppingEnabled,
            margin: activeStepBorderPadding,
            padding: stepPadding,
            scrollingDisabled: scrollingDisabled,
            activeStep: activeStep,
            upperBound: upperBound,
          );
  }

  /// Wraps the images within a CircleAvatar for displaying images in a circle.
  List<CircleAvatar> _imagesWrappedInCircleAvatar() {
    return List.generate(images.length, (index) {
      return CircleAvatar(
        radius: stepRadius,
        backgroundImage: images[index],
      );
    });
  }
}
