import 'package:flutter/material.dart';

class AccuntsPage extends StatefulWidget {
  const AccuntsPage({super.key});

  @override
  State<AccuntsPage> createState() => _AccuntsPageState();
}

class _AccuntsPageState extends State<AccuntsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('AccuntPage'),
      ),
    );
  }
}