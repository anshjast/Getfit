import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../services/ai_service.dart';

class AestheticDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      appBar: AppBar(
        title: Text("GETFIT: V-TAPER PROJECT", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [Icon(Icons.person_outline), SizedBox(width: 15)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeightCard(),
            SizedBox(height: 25),

            Text("DAILY FUEL", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            _buildMacroSection(),
            SizedBox(height: 25),

            Text("TODAY'S MISSION", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            _buildWorkoutCard("Back & Rear Delts", "Width Focus • 4 Exercises"),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current: 58.0 kg", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              Text("Goal: 65.0 kg", style: TextStyle(color: Colors.white70)),
            ],
          ),
          CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 5.0,
            percent: 0.15,
            center: Text("15%", style: TextStyle(color: Colors.white, fontSize: 12)),
            progressColor: Colors.white,
            backgroundColor: Colors.white24,
          ),
        ],
      ),
    );
  }

  Widget _buildMacroSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _macroRing("PROTEIN", 0.65, "82/125g", Colors.orangeAccent),
        _macroRing("CALORIES", 0.45, "900/2000", Colors.blueAccent),
      ],
    );
  }

  Widget _macroRing(String label, double percent, String value, Color color) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          LinearPercentIndicator(
            lineHeight: 8.0,
            percent: percent,
            progressColor: color,
            backgroundColor: Colors.white10,
            barRadius: Radius.circular(10),
          ),
          SizedBox(height: 10),
          Text(label, style: TextStyle(color: Colors.white54, fontSize: 10)),
          Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard(String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.orangeAccent.withOpacity(0.1), child: Icon(Icons.fitness_center, color: Colors.orangeAccent)),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.white38, fontSize: 12)),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 15),
        ],
      ),
    );
  }
}