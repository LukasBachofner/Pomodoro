import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/app_router.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro'),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppRoutes.settings.routeName);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Center(
        child: Text('Pomodoro Page'),
      ),
    );
  }
}
