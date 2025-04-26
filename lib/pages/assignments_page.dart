import 'package:flutter/material.dart';

class AssignmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F6),
      appBar: AppBar(
        backgroundColor: Color(0xFF1565C0),
        title: Text('Assignments', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildAssignmentCard('Math Homework', 'Due: 30th April'),
          _buildAssignmentCard('Physics Lab Report', 'Due: 1st May'),
          _buildAssignmentCard('Computer Project', 'Due: 5th May'),
        ],
      ),
    );
  }

  Widget _buildAssignmentCard(String title, String dueDate) {
    return Card(
      color: Color(0xFF1E88E5),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(dueDate, style: TextStyle(color: Colors.white70)),
        leading: Icon(Icons.assignment, color: Colors.white),
      ),
    );
  }
}
