import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CountController extends GetxController {
  // 남은 도전 횟수 카운트
  var _count = 1.obs;
  final _elapsedTime = DateTime.now().obs;
  var firstRecord = 0.obs;
  var secondRecord = 0.obs;
  var thirdRecord = 0.obs;
  var averageRecord = 0.obs;

  incrementCount() => _count.value++;

  updateElapsedTime(DateTime time) => _elapsedTime.value = time;
  getElapsedTime() => _elapsedTime.value;

  resetRecords() {
    firstRecord(0);
    secondRecord(0);
    thirdRecord(0);
  }

  setAverageRecord(int average) => averageRecord(average);

  getPercent(averageRecord) {

    if (averageRecord >= 0 && averageRecord <= 110) {
      return "0.94";
    } else if (averageRecord >= 110 && averageRecord <= 120) {
      return "2.12";
    } else if (averageRecord >= 120 && averageRecord <= 130) {
      return "3.62";
    } else if (averageRecord >= 130 && averageRecord <= 140) {
      return "5.92";
    } else if (averageRecord >= 140 && averageRecord <= 150) {
      return "9.47";
    } else if (averageRecord >= 150 && averageRecord <= 160) {
      return "14.80";
    } else if (averageRecord >= 160 && averageRecord <= 190) {
      return "22.05";
    } else if (averageRecord >= 190 && averageRecord <= 250) {
      return "30.70";
    } else if (averageRecord >= 250 && averageRecord <= 270) {
      return "39.80";
    } else if (averageRecord >= 270 && averageRecord <= 290) {
      return "49.00";
    } else if (averageRecord >= 290 && averageRecord <= 310) {
      return "58.00";
    } else if (averageRecord >= 310 && averageRecord <= 330) {
      return "67.00";
    } else if (averageRecord >= 330 && averageRecord <= 350) {
      return "77.87";
    } else if (averageRecord >= 350 && averageRecord <= 370) {
      return "84.25";
    } else if (averageRecord >= 370 && averageRecord <= 390) {
      return "88.80";
    } else if (averageRecord >= 390 && averageRecord <= 410) {
      return "91.90";
    } else if (averageRecord >= 410 && averageRecord <= 450) {
      return "96.52";
    } else {
      return "100.00";
    }
  }

  String getTierImageResource(int score) {
    if (score >= 0 && score <= 45) {
      return "assets/tier_challenger.png";
    } else if (score > 45 && score <= 60) {
      return "assets/tier_grandmaster.png";
    } else if (score > 60 && score <= 100) {
      return "assets/tier_master.png";
    } else if (score > 100 && score <= 130) {
      return "assets/tier_diamond.png";
    } else if (score > 130 && score <= 160) {
      return "assets/tier_platinum.png";
    } else if (score > 160 && score <= 270) {
      return "assets/tier_gold.png";
    } else if (score > 270 && score <= 330) {
      return "assets/tier_silver.png";
    } else if (score > 330 && score <= 450) {
      return "assets/tier_bronze.png";
    } else {
      return "assets/tier_iron.png";
    }
  }

}
