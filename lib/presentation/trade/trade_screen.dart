import 'package:flutter/material.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Text('Trade Screen'),
    );
  }
}
