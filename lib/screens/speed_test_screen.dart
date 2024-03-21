import 'package:flutter/material.dart';
import 'dart:math';

class SpeedTestScreen extends StatefulWidget {
  const SpeedTestScreen({Key? key}) : super(key: key);

  @override
  State<SpeedTestScreen> createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends State<SpeedTestScreen> {
  int _count = 1;
  int _timerCount = 3;
  double _elapsedTime = 0;
  double _firstRecord = 0;
  double _secondRecord = 0;
  double _thirdRecord = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() async {
    for (int i = 3; i >= 0; i--) {
      setState(() {
        _timerCount = i;
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
            const SizedBox(height: 100),
            _buildTimerOrButton(),
            const SizedBox(height: 20),
            if (_count > 1) Text('1st: ${_firstRecord.toString()}'),
            if (_count > 2) Text('2nd: ${_secondRecord.toString()}'),
          ],
        ),
      ),
    );
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
}

class RandomColorButton extends StatefulWidget {
  final VoidCallback onButtonClick;
  final bool isAnimating;

  const RandomColorButton({
    Key? key,
    required this.onButtonClick,
    required this.isAnimating,
  }) : super(key: key);

  @override
  State<RandomColorButton> createState() => _RandomColorButtonState();
}

class _RandomColorButtonState extends State<RandomColorButton> {
  Color _randomColor = Colors.grey;
  String _buttonText = 'Get Ready';
  int _greenColorTimestamp = 0;

  @override
  void initState() {
    super.initState();
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
      _randomColor = Colors.green;
      _buttonText = 'Click Me';
      _greenColorTimestamp = DateTime.now().millisecondsSinceEpoch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _randomColor == Colors.green ? widget.onButtonClick : null,
      style: ElevatedButton.styleFrom(
        foregroundColor: _randomColor,
        fixedSize: const Size(300, 300),
      ),
      child: Text(
        _buttonText,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}