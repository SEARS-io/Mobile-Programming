// import 'package:deygo/presentation/custom_icons_icons.dart';
import 'package:flutter/material.dart';

Widget phoneInput({required BuildContext context}) {
  return TextFormField(
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.phone),
      border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      hintText: 'Phone Number',
      contentPadding: const EdgeInsets.all(25),
      fillColor: Theme.of(context).colorScheme.surface,
      // prefixIconColor: Theme.of(context).colorScheme.onSurface,
      focusColor: Theme.of(context).colorScheme.primary,
      filled: true,
      errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
    ),
    textAlign: TextAlign.left,
    keyboardType: TextInputType.phone,
  );
}

Widget passwordInput({required BuildContext context}) {
  return TextFormField(
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: const Icon(Icons.remove_red_eye),
      border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      hintText: 'Password',
      contentPadding: const EdgeInsets.all(25),
      fillColor: Theme.of(context).colorScheme.surface,
      // prefixIconColor: Theme.of(context).colorScheme.onSurface,
      filled: true,
      focusColor: Theme.of(context).colorScheme.primary,
      errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
    ),
    textAlign: TextAlign.left,
    keyboardType: TextInputType.text,
    obscureText: true,
  );
}

Widget textInput(
    {required BuildContext context, String hintText = 'Enter Text'}) {
  return TextFormField(
    decoration: InputDecoration(
      border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      hintText: hintText,
      contentPadding: const EdgeInsets.all(25),
      fillColor: Theme.of(context).colorScheme.surface,
      // prefixIconColor: Theme.of(context).colorScheme.onSurface,
      filled: true,
      focusColor: Theme.of(context).colorScheme.primary,
      errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
    ),
    textAlign: TextAlign.left,
    keyboardType: TextInputType.text,
  );
}
