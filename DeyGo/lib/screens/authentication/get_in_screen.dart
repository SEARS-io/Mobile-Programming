import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/constants/image_strings.dart';
import 'package:deygo/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetIn extends StatelessWidget {
  const GetIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(children: [
          const Spacer(),
          Image(
            image: const AssetImage(aImageGetIn),
            width: MediaQuery.of(context).size.width * 0.7,
            fit: BoxFit.cover,
          ),
          Text(
            aGetIn,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(30),
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Image(image: AssetImage(aImageFb), width: 27.0),
              label: Text(
                aFbContinue,
                style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(16),
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Image(image: AssetImage(aImageGoogle), width: 27.0),
              label: Text(
                aGoogleContinue,
                style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(19),
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
                aOr,
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
          SizedBox.fromSize(
            size: const Size.fromHeight(37),
          ),
          SizedBox(
            width: double.infinity,
            child: PrimaryButton(onPressed: () {}, content: aSignInPassword),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(20),
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
          const Spacer(),
        ]),
      ),
    );
  }
}
