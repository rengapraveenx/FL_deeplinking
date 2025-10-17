import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to the Deep Linking Demo!'),
            ElevatedButton(
              onPressed: () {
                context.go('/details/123');
              },
              child: const Text('Go to Details (ID: 123)'),
            ),
          ],
        ),
      ),
    );
  }
}
