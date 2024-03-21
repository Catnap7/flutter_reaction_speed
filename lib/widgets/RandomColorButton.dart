import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_reaction_speed/controller/CountController.dart';
import 'package:get/get.dart';

class RandomColorButton extends StatefulWidget {
  final VoidCallback onButtonClick;
  final bool isAnimating;

  const RandomColorButton({
    super.key,
    required this.isAnimating,
    required this.onButtonClick,
  });

  @override
  State<RandomColorButton> createState() => _RandomColorButtonState();
}

class _RandomColorButtonState extends State<RandomColorButton>
    with SingleTickerProviderStateMixin {
  final countController = Get.put(CountController());
  late Animation<double> _animation;
  late AnimationController _controller;
  Color _boxColor = Colors.red[400]!;
  String _buttonText = 'Get Ready';

  @override
  void initState() {
    super.initState();
    initAnimation();
    _changeColor();
  }

  @override
  void didUpdateWidget(covariant RandomColorButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating && !oldWidget.isAnimating) {
      _changeColor();
    }
  }

  void _changeColor() async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(3000) + 3000));
    setState(() {
      _boxColor = Colors.green[500]!;
      _buttonText = 'Click Me';
      countController.updateElapsedTime(DateTime.now());
    });
  }

  void _resetColor() {
    setState(() {
      _boxColor = Colors.red[400]!;
      _buttonText = 'Get Ready';
    });
  }

  void initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _boxColor == Colors.green[500]
            ? {
                widget.onButtonClick(),
                _resetColor(),
                _changeColor(),
              }
            : Get.snackbar('알림', '너무 빨리 눌렀습니다');
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
    );
  }
}
