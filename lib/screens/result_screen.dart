import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reaction_speed/controller/CountController.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final countController = Get.find<CountController>();

    final averageRecord = (countController.firstRecord.value +
            countController.secondRecord.value +
            countController.thirdRecord.value) ~/ 3;

    countController.setAverageRecord(averageRecord);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('티어 산정은 3번의 반응속도 평균을 기준으로 합니다'),
            const SizedBox(height: 40),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: BackdropFilter(
                    blendMode: BlendMode.darken,
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Stack(
                      children: [
                        Image.asset(countController.getTierImageResource(averageRecord)),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  spreadRadius: 4,
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            RichText(
              text: TextSpan(
                text: '상위 ',
                style: Theme.of(context).textTheme.bodyLarge,
                children: <TextSpan>[
                  TextSpan(
                    text: '${countController.getPercent(averageRecord)}%',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // 원하는 스타일 적용
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text('1st : ${countController.firstRecord}ms',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('2nd : ${countController.secondRecord}ms',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('3rd : ${countController.thirdRecord}ms',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            Text('평균 : ${averageRecord}ms',
                style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  countController.resetRecords();
                  Get.back();
                },
                child: Text('다시하기')),
          ],
        ),
      ),
    );
  }
}
