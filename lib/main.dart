import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Map Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FlutterMap(
          options: MapOptions(
            // マップ生成時のマップの中心地
            center: LatLng(35.658034, 139.701636),
            zoom: 14,
          ),
          layers: [
            TileLayerOptions(
              // urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              urlTemplate:
                  // Gray
                  "https://api.maptiler.com/maps/jp-mierune-gray/256/{z}/{x}/{y}.png?key=sOt92OC2qu6D9tV04ulO",
              // Dark
              // "https://api.maptiler.com/maps/jp-mierune-dark/256/{z}/{x}/{y}.png?key=sOt92OC2qu6D9tV04ulO",
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayerOptions(markers: [
              Marker(
                point: LatLng(35.658034, 139.701636),
                builder: (ctx) => const Icon(
                  Icons.location_pin,
                  color: Colors.redAccent,
                ),
              ),
            ]),
          ],
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
              onSourceTapped: null,
            ),
          ],
        ));
  }
}
