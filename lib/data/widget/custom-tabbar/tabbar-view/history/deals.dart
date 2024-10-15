import 'package:flutter/material.dart';

class Deals extends StatelessWidget {
  const Deals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white24,
        child: Center(child:  Text('Deals Screen',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            )),
        ));
  }
}
