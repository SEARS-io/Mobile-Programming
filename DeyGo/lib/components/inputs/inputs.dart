// import 'package:deygo/presentation/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class InputBase extends StatelessWidget {
  const InputBase({super.key, required this.controller});

  final TextEditingController controller;
}

class PhoneInput extends InputBase {
  const PhoneInput({super.key, required super.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.urbanist(),
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
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary)),
      ),
      textAlign: TextAlign.left,
      keyboardType: TextInputType.phone,
    );
  }
}

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;

  const PasswordInput({super.key, required this.controller});

  @override
  // ignore: no_logic_in_create_state
  State<PasswordInput> createState() => _PasswordInputState(controller);
}

class _PasswordInputState extends State<PasswordInput> {
  final TextEditingController controller;

  _PasswordInputState(this.controller);

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.urbanist(),
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(showPassword
              ? Icons.remove_red_eye_outlined
              : Icons.remove_red_eye),
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
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
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary)),
      ),
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      obscureText: !showPassword,
    );
  }
}

class TextInput extends InputBase {
  const TextInput(
      {this.hintText = 'Enter Text', super.key, required super.controller});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.urbanist(),
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
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary)),
      ),
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
    );
  }
}
