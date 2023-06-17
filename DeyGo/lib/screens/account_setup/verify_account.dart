import 'dart:io';

import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/components/inputs/inputs.dart';
import 'package:deygo/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:deygo/constants/icon_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/global_widgets/congratulations_dialog.dart';
import '../../constants/text_strings.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController unionNumberController = TextEditingController();

  File? _frontImageFile;
  File? _backImageFile;

  @override
  Widget build(BuildContext context) {
    final disabled = ((_frontImageFile == null) || (_backImageFile == null));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
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
                vaTitle,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              vaUpload,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700, fontSize: 21, letterSpacing: 2),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          FileUpload(
            title: vaFront,
            file: _frontImageFile,
            setImage: (XFile file) {
              setState(() {
                _frontImageFile = File(file.path);
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          FileUpload(
            title: vaBack,
            file: _backImageFile,
            setImage: (XFile file) {
              setState(() {
                _backImageFile = File(file.path);
              });
            },
          ),
          const SizedBox(
            height: 120,
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
            disabled: disabled,
          ),
          const SizedBox(
            height: 45,
          ),
        ]),
      ),
    );
  }
}

class FileUpload extends StatelessWidget {
  FileUpload({
    super.key,
    required this.title,
    required this.setImage,
    required this.file,
  });

  final String title;
  final void Function(XFile) setImage;
  final File? file;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final active = file != null;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext builder) => SimpleDialog(
                    alignment: Alignment.center,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    title: const Text(vaSelect),
                    children: [
                      TextButton(
                        onPressed: () {
                          _pickImageFromGallery();
                          Navigator.of(context).pop();
                        },
                        child: const Text(vaSelectGallery),
                      ),
                      TextButton(
                        onPressed: () {
                          _pickImageFromCamera();
                          Navigator.of(context).pop();
                        },
                        child: const Text(vaSelectCamera),
                      ),
                    ],
                  ));
        },
        child: Container(
          alignment: Alignment.center,
          height: 160,
          decoration: active
              ? BoxDecoration(
                  color: const Color.fromRGBO(254, 187, 27, 0.1),
                  border: Border.all(
                    color: const Color.fromRGBO(254, 187, 27, 1),
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                )
              : BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 0.3),
                  border: Border.all(
                    color: const Color.fromRGBO(158, 158, 158, 1),
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  const AssetImage(vaImageUpload),
                  size: 65,
                  color: active
                      ? const Color.fromRGBO(254, 187, 27, 1)
                      : const Color.fromRGBO(33, 33, 33, 1),
                ),
                Text(file != null ? file!.path.split('/').last : title,
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                      color: active
                          ? const Color.fromRGBO(254, 187, 27, 1)
                          : Theme.of(context).colorScheme.secondary,
                    ))
              ]),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setImage(pickedFile);
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setImage(pickedFile);
    }
  }
}
