import 'classes_page.dart';
import 'assignments_page.dart';
import 'profile_page.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _command = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _command = val.recognizedWords;
            if (_command.toLowerCase().contains('assignments')) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Opening Assignments...')));
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F6),  // light grey-blue background
      appBar: AppBar(
        backgroundColor: Color(0xFF1565C0), // dark blue
        title: Text('Dashboard', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(_isListening ? Icons.mic : Icons.mic_none, color: Colors.white),
            onPressed: _listen,
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        padding: EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildCard('Classes', Icons.class_),
          _buildCard('Assignments', Icons.assignment),
          _buildCard('Grades', Icons.grade),
          _buildCard('Profile', Icons.person),
          _buildCard('Notifications', Icons.notifications),
        ],
      ),
    );
  }

  Widget _buildCard(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Classes') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ClassesPage()));
        } else if (title == 'Assignments') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AssignmentsPage()));
        } else if (title == 'Profile') {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title clicked')));
        }
      },
      child: Card(
        color: Color(0xFF1E88E5), // lighter blue for cards
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.white),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
