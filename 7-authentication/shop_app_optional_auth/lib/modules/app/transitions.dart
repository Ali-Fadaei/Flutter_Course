import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:animations/animations.dart';

const goDefaultDuration = Duration(milliseconds: 400);

class GoNoTransition extends CustomTransitionPage {
//
  GoNoTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return child;
          },
        );
}

class GoFadeTransition extends CustomTransitionPage {
//
  GoFadeTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return FadeTransition(
              opacity: anim1,
              child: FadeTransition(
                opacity: ReverseAnimation(anim2),
                child: child,
              ),
            );
          },
        );
}

class GoFadeTroughTransition extends CustomTransitionPage {
//
  GoFadeTroughTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
    Color? fillColor,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return FadeThroughTransition(
              animation: anim1,
              secondaryAnimation: anim2,
              fillColor: fillColor,
              child: child,
            );
          },
        );
}

class GoSharedAxisTransition extends CustomTransitionPage {
  //

  GoSharedAxisTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
    Color? fillColor,
    SharedAxisTransitionType type = SharedAxisTransitionType.horizontal,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return SharedAxisTransition(
              animation: anim1,
              secondaryAnimation: anim2,
              fillColor: fillColor,
              transitionType: type,
              child: child,
            );
          },
        );
}

//============================Study Case Transitions============================

class GoSlideDownTransition extends CustomTransitionPage {
//
  GoSlideDownTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(anim1),
              child: child,
            );
          },
        );
}

class GoSlideUpTransition extends CustomTransitionPage {
//
  GoSlideUpTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.0),
                end: Offset.zero,
              ).animate(anim1),
              child: child,
            );
          },
        );
}

class GoSlideLeftTransition extends CustomTransitionPage {
//
  GoSlideLeftTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(anim1),
              child: child,
            );
          },
        );
}

class GoSlideRightTransition extends CustomTransitionPage {
//
  GoSlideRightTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(anim1),
              child: child,
            );
          },
        );
}

class GoHorizontalFadeTransition extends CustomTransitionPage {
//
  GoHorizontalFadeTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            final isRtl = Directionality.of(context) == TextDirection.rtl;
            final enterTwin = isRtl
                ? Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  )
                : Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  );
            final exitTwin = isRtl
                ? Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(-1.0, 0.0),
                  )
                : Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(1.0, 0.0),
                  );
            return SlideTransition(
              position: enterTwin.animate(anim1),
              child: FadeTransition(
                opacity: anim1,
                child: SlideTransition(
                  position: exitTwin.animate(anim2),
                  child: FadeTransition(
                    opacity: ReverseAnimation(anim2),
                    child: child,
                  ),
                ),
              ),
            );
          },
        );
}

class GoZoomTransition extends CustomTransitionPage {
//
  GoZoomTransition({
    required super.key,
    required super.child,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return ScaleTransition(
              scale: anim1,
              child: child,
            );
          },
        );
}

class GoSizeTransition extends CustomTransitionPage {
//
  final Curve curve;

  GoSizeTransition({
    required super.key,
    required super.child,
    this.curve = Curves.ease,
    super.transitionDuration = goDefaultDuration,
  }) : super(
          transitionsBuilder: (context, anim1, anim2, child) {
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: anim1,
                  curve: curve,
                ),
                child: child,
              ),
            );
          },
        );
}
