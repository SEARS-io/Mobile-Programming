import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/constants/text_strings.dart';
import 'package:deygo/screens/authentication/get_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/image_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.75,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _pageIndex = value;
                });
              },
              itemCount: screen_data.length,
              itemBuilder: (context, index) => OnboardingContent(
                image: screen_data[index].image,
                title: screen_data[index].title,
                context: context,
              ),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              ...List.generate(
                screen_data.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: DotIndicator(
                    isActive: index == _pageIndex,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(30),
          ),
          SizedBox(
            width: 300,
            height: 60,
            child: PrimaryButton(
              content: 'Next',
              hasShadow: true,
              onPressed: () {
                _pageIndex == screen_data.length - 1
                    ? Get.to(const GetIn())
                    : (_pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 36 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}

class Onboard {
  final String image, title;

  Onboard({required this.image, required this.title});
}

// ignore: non_constant_identifier_names
final List<Onboard> screen_data = [
  Onboard(image: oImageOne, title: oMessageOne),
  Onboard(image: oImageTwo, title: oMessageTwo),
  Onboard(image: oImageThree, title: oMessageThree),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {super.key,
      required this.context,
      required this.image,
      required this.title});

  final BuildContext context;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        image,
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 6.0, left: 6.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }
}
