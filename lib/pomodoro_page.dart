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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PomodoroTime(duration: currentDuration),
            ElevatedButton(
              onPressed: () {},
              child: Text('Pomodoro Page ${currentDuration.inMinutes}'),
            ),
          ],
        ),
      ),
    );
  }
}

class PomodoroTime extends StatelessWidget {
  const PomodoroTime({
    super.key,
    required this.duration,
  });

  final Duration duration;

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          formatDuration(duration),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}

class PomodoroButtons extends StatelessWidget {
  const PomodoroButtons({
    super.key,
    required this.isRunning,
    required this.runningChanged,
    required this.addDuration,
  });

  final bool isRunning;
  final Function(bool) runningChanged;
  final Function(Duration) addDuration;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
