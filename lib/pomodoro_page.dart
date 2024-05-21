import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro/app_router.dart';

class PomodoroPage extends StatefulWidget {
  const PomodoroPage({
    super.key,
  });

  final Duration startDuration = const Duration(minutes: 20);

  @override
  State<PomodoroPage> createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  Duration currentDuration = const Duration(seconds: 0);
  Timer? pomodoroTimer;

  @override
  void initState() {
    currentDuration = widget.startDuration;
    super.initState();
  }

  @override
  void dispose() {
    pomodoroTimer?.cancel();
    super.dispose();
  }

  void resetTimer() {
    setState(() {
      pomodoroTimer?.cancel();
    });
    //TODO
  }

  void decrementDuration() {
    if (currentDuration.inSeconds > 0) {
      setState(() {
        currentDuration = Duration(seconds: currentDuration.inSeconds - 1);
      });
    } else {
      resetTimer();
    }
  }

  void startPomdoroTimer() {
    Duration? decremetDuration;
    if (kDebugMode) {
      decremetDuration = const Duration(milliseconds: 500);
    } else {
      decremetDuration = const Duration(seconds: 1);
    }

    pomodoroTimer = Timer.periodic(decremetDuration, (timer) {
      decrementDuration();
    });
  }

  void pausePomodoroTimer() {
    pomodoroTimer?.cancel();
  }

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
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Pomodoro Page ${currentDuration.inSeconds}'),
        ),
      ),
    );
  }
}
