import 'package:flutter/material.dart';

class Ping extends StatefulWidget {
  const Ping({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Ping> createState() => _PingState();
}

class _PingState extends State<Ping> with TickerProviderStateMixin {
  AnimationController? controller;

  Animation<double>? animation;

  _PingState();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation =
        CurvedAnimation(parent: controller!.view, curve: Curves.easeInOut);
    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: ScaleTransition(
            scale: animation!,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(254, 187, 27, 0.4),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(254, 187, 27, 1),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        )
      ],
    );
  }
}
