import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: const Text('Messages Screen'),
    );
  }
}
