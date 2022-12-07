import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map/pages/home.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapState();
}

class _MapState extends State<Mapa> {
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
    Marker marcadorThiago = Marker(
      markerId: MarkerId('Thiago'),
      position: LatLng(-5.024776, -42.805268),
      infoWindow: InfoWindow(title: 'Thiago'),
    );
    Marker marcadorTadeu = Marker(
      markerId: MarkerId('Tadeu'),
      position: LatLng(-5.18655478888011, -42.750673059643375),
      infoWindow: InfoWindow(title: "Tadeu")
    );
    Marker marcadorEva = Marker(
      markerId: MarkerId('Eva'),
      position: LatLng(-5.096157048548517, -42.811067261834815),
      infoWindow: InfoWindow(title: "Eva")
    );
    Marker marcadorPedro = Marker(
      markerId: MarkerId('Pedro'),
      position: LatLng(-5.18655478888011, -42.750673059643375),
      infoWindow: InfoWindow(title: "Pedro")
    );
    marcadoresLocal.add(marcadorThiago);
    marcadoresLocal.add(marcadorTadeu);
    marcadoresLocal.add(marcadorEva);
    marcadoresLocal.add(marcadorPedro);

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
    return Scaffold(
        appBar: AppBar(
        title: Text('Mapa'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () { 
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => Home())
                );
              }
            );
          }
        )
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
      );    
  }
}
