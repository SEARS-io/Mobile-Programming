import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/components/inputs/inputs.dart';
import 'package:flutter/material.dart';
import 'package:deygo/constants/icon_strings.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool? _rememberMe = false;
  bool? _isDriver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          Column(children: [
            SizedBox.fromSize(
              size: const Size.fromHeight(30),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(iconBackArrow),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 350,
                child: Text(
                  aLoginAccount,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 46),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size.fromHeight(20),
            ),
            PhoneInput(controller: phoneNumberController),
            const SizedBox(
              height: 24,
            ),
            PasswordInput(controller: passwordController),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              child: CheckBoxInput(
                title: aRemember,
                value: _rememberMe,
                onChanged: (val) {
                  setState(() {
                    _rememberMe = val;
                  });
                },
              ),
            ),
            SizedBox(
              width: 200,
              child: CheckBoxInput(
                title: aDriver,
                value: _isDriver,
                onChanged: (val) {
                  setState(() {
                    _isDriver = val;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            PrimaryButton(
              onPressed: () {},
              content: aLogin,
              hasShadow: true,
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: Color.fromRGBO(217, 217, 217, 0.95),
                    height: 1,
                    thickness: 1,
                    endIndent: 17,
                  ),
                ),
                Text(
                  aContinueWith,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: const Color.fromRGBO(102, 102, 102, 1)),
                ),
                const Expanded(
                  child: Divider(
                    color: Color.fromRGBO(217, 217, 217, 0.95),
                    height: 1,
                    thickness: 1,
                    indent: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Image(
                        image: AssetImage(aImageGoogle), width: 27.0),
                    label: Text(
                      aGoogle,
                      style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Image(image: AssetImage(aImageFb), width: 27.0),
                    label: Text(
                      aFacebook,
                      style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  aNoAccount,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: const Color.fromRGBO(118, 111, 111, 0.65)),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      aSignUp,
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: const Color.fromRGBO(230, 176, 0, 1),
                      ),
                    ))
              ],
            ),
          ]),
        ]),
      ),
    );
  }
}
