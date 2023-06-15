import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String content;
  bool disabled = false;
  bool hasShadow = false;

  PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.content,
      this.disabled = false,
      this.hasShadow = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            textStyle: GoogleFonts.urbanist(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.secondary,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).colorScheme.secondary,
            elevation: 10,
            shadowColor: hasShadow ? Theme.of(context).primaryColor : null,
            alignment: Alignment.center,
            shape: const StadiumBorder(),
            minimumSize: const Size.fromHeight(60),
            disabledBackgroundColor: Theme.of(context).colorScheme.surface,
            disabledForegroundColor: Theme.of(context).colorScheme.onSurface),
        child: Text(content));
  }
}
