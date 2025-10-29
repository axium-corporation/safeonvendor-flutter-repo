// import 'package:app_settings/app_settings.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class GeoLocationController extends GetxController {
//   Future<void> openAppSettings() async {
//     await AppSettings.openAppSettings();
//   }

//   Future<Position> determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.',
//       );
//     }
//     return Geolocator.getCurrentPosition();
//   }

//   dynamic getLocation(dynamic context) async {
//     try {
//       final Position position = await determinePosition();
//       Utils.latLong = position;
//       return position;
//     } catch (e) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Location Services'),
//             content: Text(e.toString()),
//             actions: [
//               TextButton(
//                 child: const Text('OK'),
//                 onPressed: () async {
//                   if (e.toString() ==
//                       'Location permissions are permanently denied, we cannot request permissions.') {
//                     Navigator.of(context).pop();
//                     await openAppSettings();
//                     // getLocation();
//                   } else {
//                     Navigator.of(context).pop();
//                   }
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }
