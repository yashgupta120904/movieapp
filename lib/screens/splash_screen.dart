import 'dart:async';
import 'package:flutter/material.dart';
import 'homescreen.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/movies-app.png', 
            height: 100, 
            width: 100,  
            fit: BoxFit.contain, 
          ),
        ),
      ),
    );
  }
}
