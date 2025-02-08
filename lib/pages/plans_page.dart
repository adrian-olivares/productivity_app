import 'package:flutter/material.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans Page'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              'You are on the Plans Page!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
