import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/components/inputs/inputs.dart';
import 'package:flutter/material.dart';
import 'package:deygo/constants/icon_strings.dart';

import '../../components/global_widgets/congratulations_dialog.dart';
import '../../constants/text_strings.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const ImageIcon(
                  AssetImage(iconBackArrow),
                ),
              ),
              Text(
                epTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 28),
              ),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
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
