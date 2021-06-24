import 'package:get/get.dart';
import 'package:technical_indicatos/Models/Tech.dart';

class TechController extends GetxController {
  final movingaverage = MovingAverages().obs;
  final techindicator = TechnicalIndicatorTechnicalIndicator().obs;
  final firsttablecellslist = [].obs;
  final secondtablecellslist = [].obs;
  final thirdtablecellslist = [].obs;
  final movingaveragestabledatatype = "EXPONENTIAL".obs;
  final pivotpointstype = "CLASSIC".obs;
  final currenttime = "1min".obs;
  final summarytext = "Neutral".obs;
  final tech = Tech().obs;
}
