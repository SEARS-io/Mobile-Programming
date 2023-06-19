import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/components/inputs/inputs.dart';
import 'package:deygo/screens/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:deygo/constants/icon_strings.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/global_widgets/congratulations_dialog.dart';
import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';
import '../../redux/app_state.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final isDriver = StoreProvider.of<AppState>(context).state.isDriver;
    final user = isDriver
        ? StoreProvider.of<AppState>(context).state.driver!.user
        : StoreProvider.of<AppState>(context).state.passenger!.user;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Image(
                  image: AssetImage(gImagePageIcon),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                pTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 28),
              ),
            ],
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(10),
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
            height: 8,
          ),
          Text(
            user!.name!,
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "+237 ${user.tel}",
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          Divider(
            height: 25,
            thickness: 1,
            color: Theme.of(context).colorScheme.surface,
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileItem(
            icon: iconPersonOutlined,
            title: pEditProfile,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EditProfile()));
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ProfileItem(
            icon: iconLocationOutlined,
            title: pAddress,
          ),
          const SizedBox(
            height: 30,
          ),
          ProfileItem(
            icon: iconWallet,
            title: pPaymentHistory,
          ),
          const SizedBox(
            height: 30,
          ),
          ProfileItem(
            icon: iconBell,
            title: pNotification,
          ),
          const SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                ImageIcon(
                  const AssetImage(iconExit),
                  size: 34,
                  color: Theme.of(context).colorScheme.onError,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  pLogOut,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      letterSpacing: 1,
                      color: Theme.of(context).colorScheme.onError),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  ProfileItem(
      {super.key, required this.icon, required this.title, this.onPressed});

  final String icon;
  final String title;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage(icon),
                size: 24,
                color: Colors.black,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    letterSpacing: 1),
              ),
            ],
          ),
          const RotatedBox(
            quarterTurns: 3,
            child: ImageIcon(
              AssetImage(iconChevron),
              size: 16,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
