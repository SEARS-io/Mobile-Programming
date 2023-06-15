import 'package:flutter/material.dart';

Widget primaryButton(
    {required String content,
    required VoidCallback onPressed,
    required BuildContext context,
    bool disabled = false,
    bool hasShadow = false}) {
  return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
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
