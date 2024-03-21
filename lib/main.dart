import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_reaction_speed/screens/reaction_test_screen.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true),
    darkTheme: ThemeData.dark(),
    home: const MyHomePage()));

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('버튼이 초록색으로 바뀌면 터치하세요'),
            const Text(' 3번의 기회가 주어지며 3초 뒤 시작합니다'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const ReactionTestScreen());
                },
                child: Text('시작하기')),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }
}
