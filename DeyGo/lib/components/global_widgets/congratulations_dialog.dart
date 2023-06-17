import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class CongratulationDialog extends StatefulWidget {
  const CongratulationDialog({
    super.key,
  });

  @override
  State<CongratulationDialog> createState() => _CongratulationDialogState();
}

class _CongratulationDialogState extends State<CongratulationDialog>
    with TickerProviderStateMixin {
  AnimationController? controller;

  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller!.view, curve: Curves.linear);
    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
      children: [
        const Image(
          image: AssetImage(fpImagePerson),
          width: 228,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          fpCongratulations,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          fpAccountReady,
          style:
              GoogleFonts.urbanist(fontWeight: FontWeight.w300, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        RotationTransition(
          turns: animation!,
          child: const Image(
            image: AssetImage(gImageLoading),
            width: 87,
            height: 95,
          ),
        )
      ],
    );
  }
}
