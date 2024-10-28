import 'package:flutter/material.dart';

class ElevatedBtn extends StatefulWidget {
  @override
  State<ElevatedBtn> createState() => _ElevatedBtnState();
}

class _ElevatedBtnState extends State<ElevatedBtn> {
  double scaleFactor = 1.0;
  Offset _offset = Offset.zero;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestureDetector Example"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: MouseRegion(
          cursor: SystemMouseCursors.click, // Change the cursor to a pointer
          child: GestureDetector(
            onTap: () {
              _showSnackBar("Gesture Detector Button Pressed");
            },
            onDoubleTap: () {
              _showSnackBar("Gesture Detector Button Double Tapped");
            },
            onLongPress: () {
              _showSnackBar("Gesture Detector Button Long Pressed");
            },
            onPanUpdate: (details) {
              setState(() {
                _offset = Offset(
                  _offset.dx + details.delta.dx,
                  _offset.dy + details.delta.dy,
                );
              });
            },
            child: Transform.translate(
              offset: _offset,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: const Text(
                  "Gesture Detector Button",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Gesture Detector Example',
    debugShowCheckedModeBanner: false,
    home: ElevatedBtn(),
  ));
}
