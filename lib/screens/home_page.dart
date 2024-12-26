import 'package:flutter/material.dart';
import 'weather_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGRI IRRIGATION'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            buildFeatureButton(context, 'Time Based', Icons.access_time),
            buildFeatureButton(context, 'Moisture Level', Icons.water_damage),
            buildFeatureButton(context, 'Temperature Level', Icons.thermostat),
            buildFeatureButton(context, 'Water Level', Icons.invert_colors),
            buildFeatureButton(context, 'Time Based Fertilizer', Icons.access_time_filled),
            buildFeatureButton(context, 'Humidity Level', Icons.opacity),
            buildFeatureButton(context, 'Solienoid Condition', Icons.settings),
            buildFeatureButton(context, 'Sand/Silt', Icons.grain),
            buildFeatureButton(context, 'Weather', Icons.cloud, onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherPage()),
              );
            }),
            // Remove or comment out unnecessary buttons
            // buildFeatureButton(context, 'Drip Common Setting', Icons.grass),
            // buildFeatureButton(context, 'Common Calibration', Icons.tune),
            // buildFeatureButton(context, 'Charge From', Icons.battery_charging_full),
            // buildFeatureButton(context, 'Adjust Percentage', Icons.percent),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureButton(BuildContext context, String title, IconData icon, {VoidCallback? onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue, backgroundColor: Colors.white,
        padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap ?? () {
        // Placeholder for navigation or action
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
