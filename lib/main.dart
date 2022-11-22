import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-5.0888166,-42.813416);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _marcadores = {};

  void initState() {
    super.initState();
    // _localizacaoAtual();
    _carregarMarcadores();
    _determinePosition();
  }

  _localizacaoAtual() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print('Localização: ' + position.toString());
  }

  _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadorIfpi = Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088544046019581, -42.81123803149089),
      infoWindow: InfoWindow(title: 'IFPI CAMPUS TERESINA CENTRAL'),
    );
    Marker marcadorIfpiSul = Marker(
      markerId: MarkerId('IFPI SUL'),
      position: LatLng(-5.101723, -42.813114),
      infoWindow: InfoWindow(title: "IFPI CAMPUS ZONA SUL")
    );
    marcadoresLocal.add(marcadorIfpi);
    marcadoresLocal.add(marcadorIfpiSul);
    setState(() {
      _marcadores = marcadoresLocal;
    });
  }

  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nogg Map'),
          backgroundColor: Colors.green[400],
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 14.0,
          ),
          markers: _marcadores,
        ),
      ),
    );    
  }
}
