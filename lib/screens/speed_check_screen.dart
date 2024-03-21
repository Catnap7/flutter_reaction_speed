/*
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_speed/controller/CountController.dart';
import 'package:get/get.dart';

class SpeedCheckScreen extends StatefulWidget {
  const SpeedCheckScreen({super.key});

  @override
  State<SpeedCheckScreen> createState() => _SpeedCheckScreenState();
}

class _SpeedCheckScreenState extends State<SpeedCheckScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Color _boxColor = Colors.red[400]!;
  DateTime? _colorChangeTime;
  Duration? _reactionTime;
  int _timerCount = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
    _controller.repeat();
  }



  Widget _buildTimerOrButton() {
    if (_timerCount > 0) {
      return Text(
        '$_timerCount',
        style: Theme.of(context).textTheme.displayLarge,
      );
    } else {
      return RandomColorButton(
        onButtonClick: _handleButtonClick,
        isAnimating: _timerCount == 0,
      );
    }
  }

  void _handleButtonClick() {
    setState(() {
      _elapsedTime = DateTime.now().millisecondsSinceEpoch.toDouble();
      _count++;
      _timerCount = 3;
      if (_count == 2) {
        _firstRecord = _elapsedTime;
      } else if (_count == 3) {
        _secondRecord = _elapsedTime;
      } else if (_count == 4) {

        // Navigator.of(context).pushNamed(ReactionSpeedScreens.leaderBoardScreen);
      }
    });
    _startTimer();
  }

  void _startTimer() async {
    for (int i = 3; i >= 0; i--) {
      setState(() {
        _timerCount = i;
      });
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CountController _countController = Get.put(CountController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "버튼이 초록색으로 바뀌면 터치하세요",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20), // Spacing between Text and SizedBox
            GestureDetector(
              onTap: () {
                if (_boxColor != Colors.green[500]) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('너무 빨리 눌렀습니다!')),
                  );
                  Get.back();
                }

                if (_colorChangeTime != null) {
                  // Calculate reaction time
                  _reactionTime = DateTime.now().difference(_colorChangeTime!);
                  setState(() {});
                }
                _controller.stop();
                // _controller.dispose();
                // Navigator.pop(context);
              },
              child: SizedBox(
                width: 300,
                height: 300,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        // 버튼 배경
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _boxColor,
                          ),
                        ),
                        // 물결 효과
                        Opacity(
                          opacity: 1 - _animation.value,
                          child: Container(
                            width: 300 * _animation.value,
                            height: 300 * _animation.value,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              _reactionTime != null
                  ? "Reaction Time: ${_reactionTime!.inMilliseconds} ms"
                  : "",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
*/
