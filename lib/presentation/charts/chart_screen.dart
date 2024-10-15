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
      child: Center(child:  Text('Chart Screen',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.primary,
    )),
    ));
  }
}
