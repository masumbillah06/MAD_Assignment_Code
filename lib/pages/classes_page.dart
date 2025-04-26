import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  final List<Map<String, dynamic>> classSchedule = [
    {
      'subject': 'Mathematics',
      'days': ['Monday', 'Wednesday', 'Friday'],
      'time': '10:00 AM - 11:00 AM',
    },
    {
      'subject': 'Physics',
      'days': ['Tuesday', 'Thursday'],
      'time': '1:00 PM - 2:30 PM',
    },
    {
      'subject': 'Computer Science',
      'days': ['Monday', 'Thursday'],
      'time': '3:00 PM - 4:00 PM',
    },
    {
      'subject': 'English Literature',
      'days': ['Wednesday', 'Friday'],
      'time': '11:15 AM - 12:15 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F6),
      appBar: AppBar(
        backgroundColor: Color(0xFF1565C0),
        title: Text('Class Routine', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: classSchedule.length,
        itemBuilder: (context, index) {
          final item = classSchedule[index];
          return _buildClassCard(item['subject'], item['days'], item['time']);
        },
      ),
    );
  }

  Widget _buildClassCard(String subject, List<String> days, String time) {
    return Card(
      color: Color(0xFF1E88E5),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.white70),
                SizedBox(width: 6),
                Text(
                  days.join(', '),
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.white70),
                SizedBox(width: 6),
                Text(
                  time,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
