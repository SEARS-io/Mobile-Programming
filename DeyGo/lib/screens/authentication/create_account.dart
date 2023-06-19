import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/components/inputs/inputs.dart';
import 'package:deygo/redux/actions.dart';
import 'package:deygo/screens/account_setup/fill_profile.dart';
import 'package:flutter/material.dart';
import 'package:deygo/constants/icon_strings.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';
import '../../redux/app_state.dart';
import '../../redux/models.dart';
import 'login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const ImageIcon(
                  AssetImage(iconBackArrow),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 300,
                child: Text(
                  aCreateAccount,
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
                internalState: true,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            PrimaryButton(
              onPressed: () {
                toNextPage(context);
              },
              content: aSignUp,
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
                  aAlreadyAccount,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: const Color.fromRGBO(118, 111, 111, 0.65)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Login()));
                    },
                    child: Text(
                      aSignIn,
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

  bool toNextPage(BuildContext context) {
    if (phoneNumberController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Validity Error'),
          content: const Text('Please Fill All Fields'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, 'Ok'),
                child: const Text('Ok'))
          ],
        ),
      );

      return false;
    }

    final String phoneNumber = phoneNumberController.text;
    final String password = passwordController.text;

    final User _user = User(tel: phoneNumber, password: password);

    StoreProvider.of<AppState>(context).dispatch(UpdateUserAction(_user));

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const FillProfile()));

    return true;
  }
}
