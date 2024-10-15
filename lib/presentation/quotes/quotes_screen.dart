import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Text('Quotes Screen'),
    );

  }
}
