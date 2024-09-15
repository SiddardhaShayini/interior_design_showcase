import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(InteriorDesignApp());
}

class InteriorDesignApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interior Design Showcase',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: InteriorDesignShowcase(),
    );
  }
}

class InteriorDesignShowcase extends StatefulWidget {
  @override
  _InteriorDesignShowcaseState createState() => _InteriorDesignShowcaseState();
}

class _InteriorDesignShowcaseState extends State<InteriorDesignShowcase> {
  final List<String> _rooms = [
    'assets/living_room.jpg',
    'assets/bedroom.jpg',
    'assets/kitchen.jpg',
    'assets/bathroom.jpg',
  ];

  int _currentRoom = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Interior Design Showcase'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Design Your Dream Space',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Select a Room:',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _rooms.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            'Room ${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              _currentRoom = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      _rooms[_currentRoom],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Swipe to explore more designs',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _currentRoom =
                                (_currentRoom - 1 + _rooms.length) %
                                    _rooms.length;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _currentRoom = (_currentRoom + 1) % _rooms.length;
                          });
                        },
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
}
