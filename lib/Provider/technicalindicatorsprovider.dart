import 'package:get/get.dart';
import 'package:technical_indicatos/Controllers/TechControllers.dart';
import 'package:technical_indicatos/Models/MyCell1.dart';
import 'package:technical_indicatos/Models/MyCell2.dart';
import 'package:technical_indicatos/Models/MyCell3.dart';
import 'package:technical_indicatos/Models/Tech.dart';

class TechnicalIndicatorsProvider extends GetConnect {
  TechController techController = Get.find();
  Future<void> getData({String time}) async {
    var response = await get(
        """https://api.bottomstreet.com/api/data?page=forex_detail&filter_name=identifier&filter_value=USDJPY""");
    var data = response.body;
    var tech = Tech.fromJson(data);
    techController.tech.value = tech;
    if (tech != null) {
      print("tech is not null");
      var currenttime = techController.currenttime.value;
      if (time != null) {
        currenttime = time;
      }
      print(tech.technicalIndicator[currenttime].technicalIndicator.buy);
      techController.movingaverage.value =
          tech.technicalIndicator[currenttime].movingAverages;
      techController.techindicator.value =
          tech.technicalIndicator[currenttime].technicalIndicator;
      print(
          "Summary text :${tech.technicalIndicator[currenttime].summary.summaryText}");
      techController.summarytext.value =
          tech.technicalIndicator[currenttime].summary.summaryText;

      print(
          "technical indicator value ${tech.technicalIndicator[currenttime].technicalIndicator.text}");
      //fill moving average tables
      getMovingAverageDataByType(
          techController.movingaveragestabledatatype.value);
      //fill oscillator table
      techController.secondtablecellslist.value = techController
          .techindicator.value.tableData
          .map((e) => MyCell2(
              name: e.name,
              value: double.parse(e.value),
              action: e.action.toString().split(".")[1]))
          .toList();
      //fill pivot points table
      getpivotpointsDataByType(techController.pivotpointstype.value);
    } else {
      print("null tech");
    }
  }

  void getpivotpointsDataByType(String datatype) {
    var time = techController.currenttime.value;
    print(
        "pivot points datatype ${techController.pivotpointstype.value} time $time");
    if (techController.pivotpointstype.value == "CLASSIC") {
      var pivotlist = techController
          .tech.value.technicalIndicator[time].pivotPoints.classic
          .toJson()
          .entries
          .map((e) => MyCell3(
              name: e.key,
              value: double.tryParse(e.value) == null
                  ? "-"
                  : (double.parse(e.value)).toString()))
          .toList();
      techController.thirdtablecellslist.value = pivotlist;
    }
    if (techController.pivotpointstype.value == "CAMARILLA") {
      var pivotlist = techController
          .tech.value.technicalIndicator[time].pivotPoints.camarilla
          .toJson()
          .entries
          .map((e) => MyCell3(
              name: e.key,
              value: double.tryParse(e.value) == null
                  ? "-"
                  : (double.parse(e.value)).toString()))
          .toList();
      techController.thirdtablecellslist.value = pivotlist;
    }
    if (techController.pivotpointstype.value == "DEMARK") {
      var pivotlist = techController
          .tech.value.technicalIndicator[time].pivotPoints.demark
          .toJson()
          .entries
          .map((e) => MyCell3(
              name: e.key,
              value: double.tryParse(e.value) == null
                  ? "-"
                  : (double.parse(e.value)).toString()))
          .toList();
      techController.thirdtablecellslist.value = pivotlist;
    }
    if (techController.pivotpointstype.value == "FIBONACCI") {
      var pivotlist = techController
          .tech.value.technicalIndicator[time].pivotPoints.fibonacci
          .toJson()
          .entries
          .map((e) => MyCell3(
              name: e.key,
              value: double.tryParse(e.value) == null
                  ? "-"
                  : (double.parse(e.value)).toString()))
          .toList();
      techController.thirdtablecellslist.value = pivotlist;
    }
    if (techController.pivotpointstype.value == "WOODIE") {
      var pivotlist = techController
          .tech.value.technicalIndicator[time].pivotPoints.woodie
          .toJson()
          .entries
          .map((e) => MyCell3(
              name: e.key,
              value: double.tryParse(e.value) == null
                  ? "-"
                  : (double.parse(e.value)).toString()))
          .toList();
      techController.thirdtablecellslist.value = pivotlist;
    }
    techController.thirdtablecellslist.refresh();
    print(techController.thirdtablecellslist.length);
  }

  void getMovingAverageDataByType(String datatype) {
    var time = techController.currenttime.value;
    print("moving average datatype $datatype time $time");
    if (techController.movingaveragestabledatatype.value == "EXPONENTIAL") {
      techController.firsttablecellslist.value = techController.tech.value
          .technicalIndicator[time].movingAverages.tableData.exponential
          .map((e) => MyCell1(
              period: e.title.toString().split(".")[1].toString(),
              type: e.type.toString().split(".")[1].toString(),
              value: double.parse(e.value)))
          .toList();
      techController.firsttablecellslist.refresh();
    }
    if (techController.movingaveragestabledatatype.value == "SIMPLE") {
      techController.firsttablecellslist.value = techController
          .tech.value.technicalIndicator[time].movingAverages.tableData.simple
          .map((e) => MyCell1(
              period: e.title.toString().split(".")[1].toString(),
              type: e.type.toString().split(".")[1].toString(),
              value: double.parse(e.value)))
          .toList();
      techController.firsttablecellslist.refresh();
    }
  }
}
