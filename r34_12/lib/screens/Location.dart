import 'package:flutter/material.dart';
import 'package:market_app/routes/route_name.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? selectedZone;
  String? selectedArea;

  final List<String> zones = [
    "Banasree",
    "Nasr City",
    "Maadi",
    "Zayed",
  ];

  final List<String> areas = [
    "Types of your area",
    "Area 1",
    "Area 2",
    "Area 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Map Icon
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/854/854878.png",
              height: 120,
            ),

            const SizedBox(height: 25),

            const Text(
              "Select Your Location",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Switch on your location to stay in tune with\nwhat’s happening in your area",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 40),

            // Zone Dropdown
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Your Zone",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 5),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
              child: DropdownButton<String>(
                value: selectedZone,
                hint: const Text("Select your zone"),
                isExpanded: true,
                underline: const SizedBox(),
                items: zones.map((zone) {
                  return DropdownMenuItem(
                    value: zone,
                    child: Text(zone),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedZone = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 25),

            // Area Dropdown
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Your Area",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 5),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
              child: DropdownButton<String>(
                value: selectedArea,
                hint: const Text("Types of your area"),
                isExpanded: true,
                underline: const SizedBox(),
                items: areas.map((area) {
                  return DropdownMenuItem(
                    value: area,
                    child: Text(area),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedArea = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 45),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedZone == null || selectedArea == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select both options"),
                      ),
                    );
                    return;
                  }

                  Navigator.pushNamed(context, RouteName.home);


                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
