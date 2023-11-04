import 'dart:async';
import 'dart:convert';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:finathon_app/screen/MapScreen/location_lat_long.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../../utils/app_colors.dart';
import 'custom_marker_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng mapLatLong;
  final _searchcontroller = TextEditingController();
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  Future<Map<String, double>> getLatLong(String locationName) async {
    const apiKey = 'AIzaSyALCnT6XrB-ltS-UDE1LZa8P1TZcEUQmIw';
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$locationName&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));
    final responseBody = json.decode(response.body);

    if (responseBody['status'] == 'OK') {
      final location = responseBody['results'][0]['geometry']['location'];
      final lat = location['lat'];
      final lng = location['lng'];
      return {'lat': lat, 'lng': lng};
    } else {
      throw Exception('Failed to retrieve latitude and longitude');
    }
  }

  //intial positon
  static const CameraPosition _intialpositon = CameraPosition(
    target: LatLng(19.115755, 72.88141659999999),
    zoom: 13,
  );

  //markers

  final List<Marker> _markers = [];

  loaddata() async {
    for (int i = 0; i < ExpensesList.expenses.length; i++) {
      _markers.add(
        Marker(
            markerId: const MarkerId(
              "i",
            ),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(
                ExpensesList.expenses[i].lat, ExpensesList.expenses[i].lng),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                MyCard(
                  expense: ExpensesList.expenses[i],
                ),
                LatLng(
                    ExpensesList.expenses[i].lat, ExpensesList.expenses[i].lng),
              );
            }),
      );
    }
    setState(() {});
    //
  }

  // ExpensesList explistObj = ExpensesList();
  // List<Expense> list = await explistObj.giveExpenseList();
  // print(list[0].amount);
  // for (int i = 0; i < list.length; i++) {
  //   print(list[i].lat);
  //   _markers.add(
  //     Marker(
  //         markerId: MarkerId("i",),
  //         icon: BitmapDescriptor.defaultMarker,
  //         position: LatLng(list[i].lat, list[i].lat),
  //         onTap: () {
  //           _customInfoWindowController.addInfoWindow!(
  //             MyCard(expense: list[i],),
  //             LatLng(list[i].lat, list[i].lat),
  //           );
  //         }
  //
  //     ),
  //   );
  //   setState(() {
  //
  //   });
  // }

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              GoogleMap(
                onTap: (postions) {
                  _customInfoWindowController.hideInfoWindow!();
                  setState(() {});
                },
                initialCameraPosition: _intialpositon,
                markers: Set.of(_markers),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  _customInfoWindowController.googleMapController = controller;
                },
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 100,
                width: 150,
                offset: 35,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Container(
                    // color: Colors.black,

                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: R.primaryColor.withOpacity(0.2),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _searchcontroller,
                        textAlignVertical: TextAlignVertical.center,
                        onSubmitted: (String value) async {
                          final latlongmap = await getLatLong(value);
                          GoogleMapController controller =
                              await _controller.future;
                          controller.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                            target: LatLng(latlongmap['lat']!.toDouble(),
                                latlongmap['lng']!.toDouble()),
                            zoom: 14,
                          )));
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          counterStyle: const TextStyle(fontSize: 50),
                          labelStyle: const TextStyle(fontSize: 20),
                          labelText: "Search Location",
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.add_location,
                            size: 30,
                          ),
                          suffix: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchcontroller.clear();
                            },
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
