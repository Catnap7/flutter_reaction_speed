import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_reaction_speed/controller/CountController.dart';
import 'package:flutter_reaction_speed/screens/result_screen.dart';
import 'package:flutter_reaction_speed/widgets/RandomColorButton.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ReactionTestScreen extends StatefulWidget {
  const ReactionTestScreen({super.key});

  @override
  State<ReactionTestScreen> createState() => _ReactionTestScreenState();
}

class _ReactionTestScreenState extends State<ReactionTestScreen> {

  final countController = Get.put(CountController());

  final _count = 1.obs;
  final _timerCount = 3.obs;
  int _elapsedTime = 0;

  @override
  void initState() {
    super.initState();
    // _startTimer();
  }

  // 화면이 켜지면 3초 타이머 시작
  void _startTimer() async {
    for (int i = 3; i >= 0; i--) {
      setState(() {
        _timerCount.value = i;
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count/3'),
            const SizedBox(height: 20),
            const Text(
              "버튼이 초록색으로 바뀌면 터치하세요",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 100),
            _buildTimerOrButton(),
            const SizedBox(height: 20),
            Obx(() => Column(
              children: [
                Text(countController.firstRecord.value == 0 ?  "" : '1st: ${countController.firstRecord}ms'),
                Text(countController.secondRecord.value == 0 ?  "" : '2nd: ${countController.secondRecord}ms'),
                Text(countController.thirdRecord.value == 0 ?  "" : '3rd: ${countController.thirdRecord}ms' ),
              ],
            )),
              ],
        ),
      ),
    );
  }

  Widget _buildTimerOrButton() {

    if (_timerCount < 0) {
      return Text(
        '$_timerCount',
        style: Theme.of(context).textTheme.displayLarge,
      );
    } else {
      return RandomColorButton(
        onButtonClick: _handleButtonClick,
        isAnimating: _timerCount.value == 0,
      );
    }
  }

  // 버튼 클릭 제어
  void _handleButtonClick() {
    setState(() {
      _elapsedTime = DateTime.now().difference(countController.getElapsedTime()).inMilliseconds;
      _count.value++;
      _timerCount.value = 3;
      if (_count.value == 2) {
        countController.firstRecord(_elapsedTime);
      } else if (_count.value == 3) {
        countController.secondRecord(_elapsedTime);
      } else if (_count.value == 4) {
        countController.thirdRecord(_elapsedTime);
        Get.off(() => const ResultScreen());
      }
    });
    _startTimer();
  }
}

