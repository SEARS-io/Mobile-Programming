import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bookings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: const TabBarView(children: [
          Bookings(),
          Center(child: Text('Tab 2')),
          Center(child: Text('Tab 3')),
        ]),
        bottomNavigationBar: StyleProvider(
          style: Style(),
          child: ConvexAppBar(
            style: TabStyle.reactCircle,
            items: const [
              TabItem(icon: Icons.receipt_long_outlined, title: 'Bookings'),
              TabItem(icon: Icons.location_on, title: 'Home'),
              TabItem(icon: Icons.person, title: 'Profile'),
            ],
            height: 65,
            backgroundColor: Colors.white70,
            // color: const Color.fromRGBO(33, 33, 33, 1),
            color: const Color.fromARGB(255, 121, 121, 121),
            activeColor: const Color.fromRGBO(254, 187, 27, 1),
            onTap: (int i) {
              setState(() {
                _pageIndex = i;
              });
            },
          ),
        ),
        floatingActionButton: _pageIndex == 0
            ? FloatingActionButton(
                onPressed: () {},
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.add,
                  size: 35,
                ),
              )
            : null,
      ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 30;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return GoogleFonts.urbanist(
        fontSize: 15, color: color, fontWeight: FontWeight.w600);
  }
}
