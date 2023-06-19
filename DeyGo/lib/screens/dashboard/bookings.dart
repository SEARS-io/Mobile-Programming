import 'package:deygo/components/buttons/primary.button.dart';
import 'package:deygo/constants/icon_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';
import '../../redux/app_state.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    final isDriver = StoreProvider.of<AppState>(context).state.isDriver;
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
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
                Text(
                  isDriver ? bTitleDriver : bTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 28),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: TabBar(
                dividerColor: Colors.orange,
                indicatorWeight: 3.5,
                indicatorColor: const Color.fromRGBO(254, 187, 27, 1),
                labelColor: const Color.fromRGBO(254, 187, 27, 1),
                labelStyle: const TextStyle(
                    fontFamily: 'urbanist',
                    fontFamilyFallback: ['urbanist', 'sans serif'],
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
                unselectedLabelColor: const Color.fromRGBO(158, 158, 158, 1),
                tabs: [
                  Tab(text: isDriver ? gTabActiveDriver : gTabActive),
                  const Tab(text: gTabCompleted),
                  const Tab(text: gTabCancelled),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: TabBarView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: ListView(
                      children: [
                        Accordion(),
                        SizedBox(
                          height: 15,
                        ),
                        Accordion(),
                      ],
                    ),
                  ),
                  Center(
                    child: Text('Bookings 2'),
                  ),
                  Center(
                    child: Text('Bookings 3'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
  });

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isOpen ? 285 : 114,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              blurRadius: 10,
              offset: Offset(0, 6)),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buea Town',
                          style: GoogleFonts.urbanist(
                            fontSize: 28,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Chip(
                          label: Text(
                            'pending',
                            style: GoogleFonts.urbanist(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.onSurface,
                                letterSpacing: 1),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 4),
                          backgroundColor:
                              const Color.fromRGBO(217, 217, 217, 0.5),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '1500',
                          style: GoogleFonts.urbanist(
                            fontSize: 28,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'FCFA',
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Color.fromRGBO(158, 158, 158, 0.3),
                  height: 1,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mar 23rd, 2023  |  2:30pm',
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: const Color.fromRGBO(87, 88, 88, 1),
                        letterSpacing: 1,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Ride id:',
                          style: GoogleFonts.urbanist(
                              fontSize: 7,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                        Text(
                          '00a8909f-15b2-4558-941b-715c76a9b402',
                          style: GoogleFonts.urbanist(
                              fontSize: 6,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const From(),
                const SizedBox(
                  height: 10,
                ),
                const To(),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 30,
                    width: 300,
                    child: PrimaryButton(
                      onPressed: () {},
                      content: 'Track Driver',
                      padding: 5,
                      hasShadow: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            right: 170,
            child: AnimatedRotation(
              turns: _isOpen ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isOpen = !_isOpen;
                  });
                },
                icon: const ImageIcon(
                  AssetImage(iconChevron),
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class From extends StatelessWidget {
  const From({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage(brImageFrom),
          width: 34,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Location',
              style: GoogleFonts.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            Text(
              'Mile 16, Grand Mall',
              style: GoogleFonts.urbanist(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            )
          ],
        )
      ],
    );
  }
}

class To extends StatelessWidget {
  const To({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage(brImageTo),
          width: 34,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Destination',
              style: GoogleFonts.urbanist(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            Text(
              'Mile 16, Grand Mall',
              style: GoogleFonts.urbanist(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            )
          ],
        )
      ],
    );
  }
}
