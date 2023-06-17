import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/components/inputs/inputs.dart';
import 'package:flutter/material.dart';
import 'package:deygo/constants/icon_strings.dart';

import '../../components/global_widgets/congratulations_dialog.dart';
import '../../constants/text_strings.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController unionNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(iconBackArrow),
                ),
              ),
              Text(
                fpTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 28),
              ),
            ],
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(30),
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 245, 248, 1),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const ImageIcon(
                  AssetImage(iconPerson),
                  size: 82.54,
                  color: Color.fromRGBO(233, 233, 240, 1),
                ),
              ),
              Positioned(
                  bottom: -5,
                  right: 95,
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(254, 187, 27, 1)),
                    child: const ImageIcon(
                      AssetImage(iconEdit),
                      size: 20,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          TextInput(controller: fullNameController, hintText: fpFullName),
          const SizedBox(
            height: 22,
          ),
          TextInput(controller: emailController, hintText: fpEmail),
          const SizedBox(
            height: 22,
          ),
          TextInput(controller: locationController, hintText: fpLocation),
          const SizedBox(
            height: 22,
          ),
          TextInput(controller: unionNumberController, hintText: fpUnionNumber),
          const SizedBox(
            height: 90,
          ),
          PrimaryButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => const CongratulationDialog(),
              );
            },
            content: fpContinue,
            hasShadow: true,
          ),
          const SizedBox(
            height: 45,
          ),
        ]),
      ),
    );
  }
}
