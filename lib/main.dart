import 'package:flutter/material.dart';

void main() {
  runApp(TrafficLightApp());
}

class TrafficLightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrafficLightPage(),
    );
  }
}

class TrafficLightPage extends StatefulWidget {
  @override
  _TrafficLightPageState createState() => _TrafficLightPageState();
}

class _TrafficLightPageState extends State<TrafficLightPage> {
  int _currentLight = 0; // 0 = แดง, 1 = เหลือง, 2 = เขียว

  void _changeLight() {
    setState(() {
      _currentLight = (_currentLight + 1) % 3; // วนลูป 0 -> 1 -> 2 -> 0
    });
  }

  double getOpacity(int lightIndex) {
    return _currentLight == lightIndex ? 1.0 : 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade800, width: 4),
              ),
              child: Column(
                children: [
                  // ไฟแดง
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: getOpacity(0),
                    child: _buildLight(Colors.red),
                  ),
                  SizedBox(height: 20),
                  // ไฟเหลือง
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: getOpacity(1),
                    child: _buildLight(Colors.yellow),
                  ),
                  SizedBox(height: 20),
                  // ไฟเขียว
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: getOpacity(2),
                    child: _buildLight(Colors.green),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _changeLight,
              child: Text(
                "เปลี่ยนไฟจราจร 🚦",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 243, 81),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLight(Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 5, // ความหนากรอบ
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}
