import 'package:flutter/material.dart';

class FarmerDetailsPage extends StatefulWidget {
  const FarmerDetailsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FarmerDetailsPageState createState() => _FarmerDetailsPageState();
}

class _FarmerDetailsPageState extends State<FarmerDetailsPage> {
  String? plantType;
  String? soilType;
  String? spacing;
  int? numberOfAcres;
  int? numberOfPlants;
  double? calculatedWater;

  final plantTypes = ['Coconut', 'Banana', 'Mango', 'Guava', 'Pomegranate', 'Sugar cane'];
  final soilTypes = ['Loamy', 'Sandy', 'Clayey', 'Silty', 'Peaty'];
  final spacingOptions = {
    'Coconut': ['6m x 6m', '7m x 7m'],
    'Banana': ['1.8m x 1.8m', '2.1m x 2.1m'],
    'Mango': ['10m x 10m', '12m x 12m'],
    'Guava': ['6m x 6m', '7m x 7m'],
    'Pomegranate': ['4m x 4m', '5m x 5m'],
    'Sugar cane': ['0.9m x 0.9m', '1m x 1m'],
  };

  void calculateWaterRequirement() {
    if (numberOfAcres != null && numberOfPlants != null) {
      setState(() {
        // Simple formula for demonstration; replace with a more accurate calculation
        calculatedWater = numberOfPlants! * 0.5; // Example: 0.5 liters per plant
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Plant Type'),
              value: plantType,
              items: plantTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  plantType = value;
                  spacing = null;
                });
              },
            ),
            if (plantType != null)
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Spacing Between Crops'),
                value: spacing,
                items: spacingOptions[plantType]!.map((spacing) {
                  return DropdownMenuItem(
                    value: spacing,
                    child: Text(spacing),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    spacing = value;
                  });
                },
              ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Soil Type'),
              value: soilType,
              items: soilTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  soilType = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Number of Acres'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                numberOfAcres = int.tryParse(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Number of Plants'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                numberOfPlants = int.tryParse(value);
                calculateWaterRequirement();
              },
            ),
            const SizedBox(height: 20),
            if (calculatedWater != null)
              Text(
                'Required Water: ${calculatedWater!.toStringAsFixed(2)} liters',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
