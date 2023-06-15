import 'package:deygo/screens/splash_screen/splash_screen.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(children: [
        const SizedBox.expand(
          child: Image(image: AssetImage(sBackground), fit: BoxFit.cover),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOut,
            bottom: splashController.animate.value ? 0 : -250,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromRGBO(118, 111, 111, 0.1),
                      Color.fromRGBO(118, 111, 111, 0.3),
                      Color.fromRGBO(118, 111, 111, 0.5),
                      Color.fromRGBO(118, 111, 111, 0.5),
                      Color.fromRGBO(118, 111, 111, 0.5),
                    ]),
              ),
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sWelcome,
                      style: GoogleFonts.urbanist(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      sAppName,
                      style: GoogleFonts.urbanist(
                          color: Theme.of(context).primaryColor,
                          fontSize: 75,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(10),
                    ),
                    SizedBox(
                      width: 350,
                      child: Text(
                        sAppTagLine,
                        style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
