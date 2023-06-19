import 'dart:async';

import 'package:deygo/screens/dashboard/zoom_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../components/global_widgets/ping.dart';

// import 'package:deygo/constants/icon_strings.dart';
// import '../../components/global_widgets/congratulations_dialog.dart';
// import '../../constants/text_strings.dart';

class DeygoMap extends StatefulWidget {
  const DeygoMap({super.key});

  @override
  State<DeygoMap> createState() => _DeygoMapState();
}

class _DeygoMapState extends State<DeygoMap> {
  static final LatLng sourceLocation = LatLng(4.151706, 9.273344);
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: sourceLocation,
          zoom: 14,
          onTap: (tapPosition, point) {
            final mkr = Marker(
              point: point,
              builder: (ctx) => const Ping(),
            );
            setState(() {
              markers.add(mkr);
            });
          },
        ),
        nonRotatedChildren: const [
          FlutterMapZoomButtons(
            minZoom: 4,
            maxZoom: 19,
            mini: true,
            padding: 10,
            alignment: Alignment.bottomLeft,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: sourceLocation,
                builder: (ctx) => const Ping(),
              ),
              ...markers,
            ],
          )
        ],
      ),
    );
  }
}
