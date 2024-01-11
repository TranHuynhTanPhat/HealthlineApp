// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:bt1/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startTimer() {
    Future.delayed(const Duration(seconds: 10), _goNext);
  }

  _goNext() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Họ và Tên: Trần Huỳnh Tấn Phát', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text('MSSV: 20110695', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text('Ngày sinh: 08/05/2002', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text('Quê quán: Bà Rịa Vũng Tàu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
