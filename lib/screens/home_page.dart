
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4FC3F7), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.medical_services,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 30),
                Text(
                  'First Aid App',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Quick first aid guidance for emergencies',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                ElevatedButton.icon(
                  onPressed: () => Get.toNamed('/categories'),
                  icon: Icon(Icons.healing, size: 28),
                  label: Text('General First Aid Principles'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF26A69A),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    minimumSize: Size(double.infinity, 60),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
