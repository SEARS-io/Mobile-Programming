// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/components/inputs/inputs.dart';
import 'package:deygo/http/http.dart';
import 'package:deygo/redux/actions.dart';
import 'package:deygo/screens/account_setup/verify_account.dart';
import 'package:deygo/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:deygo/constants/icon_strings.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/global_widgets/congratulations_dialog.dart';
import '../../constants/text_strings.dart';
import '../../redux/app_state.dart';
import '../../redux/models.dart';

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

  final HTTP requests = HTTP();

  @override
  void dispose() {
    requests.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDriver = StoreProvider.of<AppState>(context).state.isDriver;
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
          Container(
            child: isDriver
                ? TextInput(
                    controller: unionNumberController, hintText: fpUnionNumber)
                : null,
          ),
          const SizedBox(
            height: 90,
          ),
          PrimaryButton(
            onPressed: () async {
              // showDialog(
              //   context: context,
              //   barrierDismissible: false,
              //   builder: (BuildContext context) => const CongratulationDialog(),
              // );
              createAccount(context);
              // await Future.delayed(
              //   const Duration(milliseconds: 1200),
              //   () {
              //     Navigator.of(context).pushReplacement(
              //         MaterialPageRoute(builder: (context) => const Dashboard()));
              //   },
              // );
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

  void createAccount(BuildContext context) async {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        locationController.text.isEmpty) {
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
      return;
    }

    final isDriver = StoreProvider.of<AppState>(context).state.isDriver;

    if (isDriver) {
      if (unionNumberController.text.isEmpty) {
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
        return;
      }
    }

    showDialog(
        context: context, builder: (context) => const CongratulationDialog());

    final fullName = fullNameController.text;
    final email = emailController.text;
    final location = locationController.text;
    final unionNumber = unionNumberController.text;

    final Location _loc = Location(name: location);

    final oldUser = StoreProvider.of<AppState>(context).state.user;
    final user = User(
      password: oldUser!.password,
      tel: oldUser.tel,
      email: email,
      name: fullName,
      current_location: _loc,
    );

    if (isDriver) {
      // Driver Create
      final _driver = {
        'union_num': unionNumber,
        'rating': 0.0,
        'user': {
          'data': {
            'tel': user.tel,
            'email': user.email,
            'password': user.password,
            'name': user.name,
            'location': {
              'data': {'name': user.current_location!.name}
            }
          }
        }
      };
      final resdriver = await requests.Post(
        'driver/create',
        {'driver': _driver},
      );
      final driver = resdriver['insert_driver_one'];
      if (driver == null) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Opps'),
            content:
                const Text('Apologies, an error occured. Please try again'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Ok'),
                  child: const Text('Ok'))
            ],
          ),
        );
        return;
      } else {
        final newDriver = Driver.fromResponse(driver);
        StoreProvider.of<AppState>(context)
            .dispatch(UpdateDriverAction(newDriver));
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const VerifyAccount()));
      }
    } else {
      // Passenger Create
      final _passenger = {
        'user': {
          'data': {
            'tel': user.tel,
            'email': user.email,
            'password': user.password,
            'name': user.name,
            'location': {
              'data': {'name': user.current_location!.name}
            }
          }
        }
      };
      final respassenger = await requests.Post(
        'passenger/create',
        {'passenger': _passenger},
      );
      final passenger = respassenger['insert_passenger_one'];
      if (passenger == null) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Opps'),
            content:
                const Text('Apologies, an error occured. Please try again'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Ok'),
                  child: const Text('Ok'))
            ],
          ),
        );
        return;
      } else {
        final newPassenger = Passenger.fromResponse(passenger);
        StoreProvider.of<AppState>(context).dispatch(
          UpdatePassengerAction(newPassenger),
        );
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Dashboard(
                  isDriver: false,
                )));
      }
    }
  }
}
