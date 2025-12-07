 import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final MapController _mapController = MapController();
  bool _isLoading = true;
  bool _hasLocationPermission = false;
  bool _isDisposed = false;

  LatLng driverLocation = const LatLng(30.0444, 31.2357);
  LatLng userLocation = const LatLng(0, 0);

  double distanceKm = 0.0;
  double durationHours = 0.0;

  String orderStatus = "On The Way 🚚";
  Timer? _driverTimer;

  @override
  void initState() {
    super.initState();
    _checkAndInitializeLocation();
  }

  @override
  void dispose() {
    _isDisposed = true;
    _driverTimer?.cancel();
    super.dispose();
  }

  Future<void> _checkAndInitializeLocation() async {
    if (_isDisposed) return;

    setState(() => _isLoading = true);

    _hasLocationPermission = await _handleLocationPermission();

    if (_hasLocationPermission) {
      await _getUserLocation();
    } else {
      userLocation = const LatLng(30.0444, 31.2357); // default location
    }

    if (_isDisposed) return;

    _calculateDistance();
    _startDriverMovementSimulation();

    if (!_isDisposed) setState(() => _isLoading = false);
  }

  Future<bool> _handleLocationPermission() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return false;

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return false;
      }

      if (permission == LocationPermission.deniedForever) return false;

      return permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
    } catch (_) {
      return false;
    }
  }

  Future<void> _getUserLocation() async {
    try {
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: const Duration(seconds: 10),
      );
      if (!_isDisposed) {
        setState(() {
          userLocation = LatLng(pos.latitude, pos.longitude);
        });
      }
    } catch (_) {
      if (!_isDisposed) {
        setState(() {
          userLocation = const LatLng(30.0444, 31.2357);
        });
      }
    }
  }

  void _calculateDistance() {
    if (_isDisposed) return;

    final Distance distance = Distance();
    distanceKm = distance.as(
      LengthUnit.Kilometer,
      userLocation,
      driverLocation,
    );
    durationHours = distanceKm / 40;
    if (!_isDisposed) setState(() {});
  }

  void _startDriverMovementSimulation() {
    _driverTimer?.cancel();

    _driverTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_isDisposed) {
        timer.cancel();
        return;
      }

      setState(() {
        driverLocation = LatLng(
          driverLocation.latitude - 0.001,
          driverLocation.longitude + 0.001,
        );
      });

      _calculateDistance();

      if (distanceKm < 0.5 && orderStatus != "Arriving Soon 🚚✨") {
        if (!_isDisposed) setState(() => orderStatus = "Arriving Soon 🚚✨");
      }

      if (distanceKm < 0.2 && orderStatus != "Delivered ✔") {
        if (!_isDisposed) setState(() => orderStatus = "Delivered ✔");
        timer.cancel();
      }
    });
  }

  Future<void> _openAppSettings() async {
    try {
      await Geolocator.openAppSettings();
    } catch (e) {
      print("Error opening app settings: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Colors
    Color locationButtonColor =
        _hasLocationPermission ? Colors.green[700]! : Colors.green[400]!;
    Color settingsButtonColor = Colors.grey;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Your Order"),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: userLocation,
                    initialZoom: 14,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.flutter_sesseion_8v2',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: userLocation,
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.green,
                            size: 40,
                          ),
                        ),
                        Marker(
                          point: driverLocation,
                          width: 40,
                          height: 40,
                          child: const Icon(
                            Icons.delivery_dining,
                            color: Colors.deepOrangeAccent,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: [userLocation, driverLocation],
                          color: Colors.green.withOpacity(0.7),
                          strokeWidth: 3,
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              orderStatus == "Delivered ✔"
                                  ? Icons.check_circle
                                  : orderStatus == "Arriving Soon 🚚✨"
                                      ? Icons.directions_car
                                      : Icons.pending,
                              color: orderStatus == "Delivered ✔"
                                  ? Colors.green
                                  : orderStatus == "Arriving Soon 🚚✨"
                                      ? Colors.orange
                                      : Colors.green,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                orderStatus,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow(
                          Icons.flag,
                          "Distance to driver",
                          "${distanceKm.toStringAsFixed(2)} km",
                        ),
                        _buildInfoRow(
                          Icons.access_time,
                          "Estimated arrival",
                          "${(durationHours * 60).toStringAsFixed(0)} min",
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                icon: const Icon(Icons.location_on),
                                label: Text(
                                  _hasLocationPermission
                                      ? "Location Enabled"
                                      : "Enable Location",
                                ),
                                onPressed: _hasLocationPermission
                                    ? null
                                    : () async {
                                        await _checkAndInitializeLocation();
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: locationButtonColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12),
                                  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(12),
  side: _hasLocationPermission 
      ? BorderSide.none  // No border when enabled
      : BorderSide(
          color: locationButtonColor,
          width: 1,
        ),
),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            OutlinedButton.icon(
                              icon: const Icon(Icons.settings),
                              label: const Text("Settings"),
                              onPressed: _openAppSettings,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: settingsButtonColor,
                                side: BorderSide(
                                  color: settingsButtonColor,
                                  width: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(label, style: TextStyle(color: Colors.grey[700])),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
