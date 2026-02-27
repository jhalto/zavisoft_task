import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zavisoft_task/core/const/images_path.dart';
import 'package:zavisoft_task/core/utils/loader.dart';
import 'package:zavisoft_task/feature/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
 controller;
    return const Scaffold(
      body: Stack(children: [JumpingLogo(), JumpingText(),]),
    );
  }
}

class JumpingLogo extends StatefulWidget {
  const JumpingLogo({super.key});

  @override
  State<JumpingLogo> createState() => _JumpingLogoState();
}

class _JumpingLogoState extends State<JumpingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Sequence: drop -> big bounce -> smaller bounces -> settle
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: -400.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -100.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: -100.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -50.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: -50.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: -20.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: -20.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
    ]).animate(_controller);

    // Start immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value), // moves logo vertically
          child: child,
        );
      },
      child: Center(child: Image.asset(ImagesPath.logo, width: 360,height: 140,)),
    );
  }
}

class JumpingText extends StatefulWidget {
  const JumpingText({super.key});

  @override
  State<JumpingText> createState() => _JumpingTextState();
}

class _JumpingTextState extends State<JumpingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Sequence: drop -> big bounce -> smaller bounces -> settle
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 400.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 100.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 100.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 50.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 50.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 20.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 20.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1,
      ),
    ]).animate(_controller);

    // Start immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value), // moves logo vertically
          child: child,
        );
      },
      child: Center(child: Padding(
        padding: const EdgeInsets.only(top: 220),
        child: loader,
      )),
    );
  }
}