// import 'package:deygo/presentation/custom_icons_icons.dart';
import 'package:deygo/constants/icon_strings.dart';
import 'package:deygo/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../redux/actions.dart';

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
        prefixIcon: const ImageIcon(AssetImage(icon237)),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        hintText: 'Phone Number',
        contentPadding: const EdgeInsets.all(20),
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
        prefixIcon: const ImageIcon(AssetImage(iconLock)),
        suffixIcon: IconButton(
          icon: showPassword
              ? const Icon(Icons.remove_red_eye)
              : const ImageIcon(AssetImage(iconEyeCrossed)),
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
        contentPadding: const EdgeInsets.all(20),
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
        contentPadding: const EdgeInsets.all(20),
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

class CheckBoxInput extends StatelessWidget {
  CheckBoxInput(
      {super.key,
      required this.title,
      required this.onChanged,
      required this.value,
      this.internalState = false});

  final String title;
  final void Function(bool?) onChanged;
  final bool? value;
  bool internalState = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) {
        return store.state.isDriver;
      },
      builder: (context, bool isDriver) => CheckboxListTile(
        title: Text(
          title,
          style: GoogleFonts.urbanist(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.secondary),
        ),
        value: internalState ? isDriver : value,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 3,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        onChanged: (val) {
          internalState
              ? StoreProvider.of<AppState>(context).dispatch(
                  UpdateIsDriverAction(val ?? false),
                )
              : onChanged(val);
        },
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Theme.of(context).primaryColor,
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 3,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        dense: true,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
      ),
    );
  }
}
