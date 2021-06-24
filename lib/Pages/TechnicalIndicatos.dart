import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:technical_indicatos/Controllers/TechControllers.dart';
import 'package:technical_indicatos/Provider/technicalindicatorsprovider.dart';

class TechnicalIndicatos extends StatelessWidget {
  TechnicalIndicatos({Key key}) : super(key: key);
  final TechController techController = Get.find();
  final TechnicalIndicatorsProvider techprovider =
      TechnicalIndicatorsProvider();

  final timelist = [
    "1 MIN",
    "5 MIN",
    "15 MIN",
    "30 MIN",
    "1 HR",
    "5 HR",
    "1 DAY",
    "1 WK",
    "1 MON"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        appBar: buildAppBar(),
        body: ListView(
          shrinkWrap: true,
          children: [
            //Drop Down Button
            builddropdownbutton(),
            //Summary Text
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: buildHeadingText("Summary")),
            //
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: buildMyColorBar(),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildListTime(),
                  )
                ],
              ),
            ),
            buildHeadingText("Moving Averages"),
            //Buy Button
            buildBuyBtn(),
            //7 ,- ,5
            Obx(() => buildCountBuy([
                  techController.movingaverage.value.buy,
                  "-",
                  techController.movingaverage.value.sell
                ])),
            //Buy,Neutral ,Sell
            buildBuyNeutralSell(),
            //Exponential button
            buildSecondaryDropDownBtn1(context, ["EXPONENTIAL", "SIMPLE"]),
            //First Data Table
            buildFirstDataTable(context),
            //Oscillators text
            buildHeadingText("Oscillators"),
            //STrong CEll BTN
            buildStrongCellBtn(),
            //1,1,9
            Obx(() => buildCountBuy([
                  techController.techindicator.value.buy,
                  techController.techindicator.value.neutral,
                  techController.techindicator.value.sell
                ])),
            //Buy,Neutral ,Sell
            buildBuyNeutralSell(),
            buildSecondDataTable(context),
            buildHeadingText('Pivot Points'),
            buildSecondaryDropDownBtn2(context,
                ["CLASSIC", "CAMARILLA", "DEMARK", "FIBONACCI", "WOODIE"]),
            buildThirdDataTable(context)
          ],
        ),
      ),
    );
  }

  Padding buildHeadingText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.ibmPlexSans(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Padding buildMovingAvengerText() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Moving Averages",
            style: GoogleFonts.ibmPlexSans(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Theme buildThirdDataTable(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 100),
        child: Obx(() => DataTable(
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.transparent),
            headingRowHeight: 0,
            horizontalMargin: 20,
            columnSpacing: 50,
            dividerThickness: 0,
            showBottomBorder: false,
            dataRowColor: MaterialStateProperty.all(Colors.transparent),
            columns: <DataColumn>[
              DataColumn(
                //numeric: true,
                label: Text(
                  '',
                  style: GoogleFonts.ibmPlexSans(),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  '',
                  style: GoogleFonts.ibmPlexSans(),
                ),
              ),
            ],
            rows: techController.thirdtablecellslist
                .map((e) => DataRow(cells: [
                      DataCell(Text(
                        e.name.toString().toUpperCase(),
                        textAlign: TextAlign.start,
                        style: GoogleFonts.ibmPlexSans(),
                      )),
                      DataCell(Text(
                        e.value.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(),
                      )),
                    ]))
                .toList())),
      ),
    );
  }

  Theme buildSecondDataTable(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(() => DataTable(
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Color(0xff121212)),
            headingRowHeight: 35,
            horizontalMargin: 20,
            columnSpacing: 50,
            dividerThickness: 0,
            showBottomBorder: false,
            dataRowColor: MaterialStateProperty.all(Colors.transparent),
            columns: <DataColumn>[
              DataColumn(
                //numeric: true,
                label: Text(
                  'Name',
                  style: GoogleFonts.ibmPlexSans(),
                ),
              ),
              DataColumn(
                //numeric: true,
                label: Text(
                  'Value',
                  style: GoogleFonts.ibmPlexSans(),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Action',
                  style: GoogleFonts.ibmPlexSans(),
                ),
              ),
            ],
            rows: techController.secondtablecellslist
                .map((e) => DataRow(cells: [
                      DataCell(Text(
                        e.name,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.ibmPlexSans(),
                      )),
                      DataCell(Text(
                        e.value.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSans(),
                      )),
                      DataCell(Text(
                        e.action,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.ibmPlexSans(
                            color: e.action == "SELL"
                                ? Color(0xffFF2E50)
                                : e.action == "BUY"
                                    ? Color(0xff007AFF)
                                    : e.action == "NEUTRAL"
                                        ? Color(0xffFFB946)
                                        : Colors.white54),
                      ))
                    ]))
                .toList())),
      ),
    );
  }

  Theme buildFirstDataTable(BuildContext context) {
    var tabledata = techController.firsttablecellslist;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(() => DataTable(
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Color(0xff121212)),
              headingRowHeight: 35,
              horizontalMargin: 0,
              columnSpacing: 80,
              dividerThickness: 0,
              showBottomBorder: false,
              dataRowColor: MaterialStateProperty.all(Colors.transparent),
              columns: <DataColumn>[
                DataColumn(
                  //numeric: true,
                  label: Text(
                    'TITLE',
                    style: GoogleFonts.ibmPlexSans(color: Colors.white54),
                  ),
                ),
                DataColumn(
                  //numeric: true,
                  label: Text(
                    'VALUE',
                    style: GoogleFonts.ibmPlexSans(color: Colors.white54),
                  ),
                ),
                DataColumn(
                  numeric: true,
                  label: Text(
                    'TYPE',
                    style: GoogleFonts.ibmPlexSans(color: Colors.white54),
                  ),
                ),
              ],
              rows: tabledata
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.period,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.ibmPlexSans())),
                        DataCell(Text(e.value.toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ibmPlexSans())),
                        DataCell(Text(
                          e.type,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.ibmPlexSans(
                              color: e.type == "SELL"
                                  ? Color(0xffFF2E50)
                                  : Color(0xff007AFF)),
                        ))
                      ]))
                  .toList()))),
    );
  }

  Padding buildSecondaryDropDownBtn1(BuildContext context, List<String> items) {
    var currentvalue = items[0].obs;
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: Container(
                  color: Color(0xFF121212),
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        Obx(() => Container(
                            height: Get.height * 0.2,
                            color: Colors.black,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: items
                                      .map((e) => e == currentvalue.value
                                          ? ListTile(
                                              leading: Icon(Icons.done),
                                              title: Text(e),
                                              onTap: () {
                                                currentvalue.value = e;
                                                techController
                                                    .movingaveragestabledatatype
                                                    .value = e;
                                                techprovider
                                                    .getMovingAverageDataByType(
                                                        techController
                                                            .movingaveragestabledatatype
                                                            .value);
                                                Get.back();
                                              },
                                            )
                                          : ListTile(
                                              leading: Container(
                                                height: 20,
                                                width: 10,
                                              ),
                                              title: Text(e),
                                              onTap: () {
                                                currentvalue.value = e;
                                                techController
                                                    .movingaveragestabledatatype
                                                    .value = e;
                                                techprovider
                                                    .getMovingAverageDataByType(
                                                  techController
                                                      .movingaveragestabledatatype
                                                      .value,
                                                );
                                                Get.back();
                                              }))
                                      .toList(),
                                )))),
                      );
                    },
                    child: DropdownButton(
                      items: items
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "$e",
                                  style: GoogleFonts.ibmPlexSans(
                                      color: Colors.white),
                                ),
                              )))
                          .toList(),
                      dropdownColor: Colors.transparent,
                      isExpanded: true,
                      iconSize: 18,
                      elevation: 10,
                      underline: Container(),
                      iconDisabledColor: Colors.white,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: currentvalue.value,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Padding buildSecondaryDropDownBtn2(BuildContext context, List<String> items) {
    var currentvalue = items[0].obs;
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: Container(
                  color: Color(0xFF121212),
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        Obx(() => Container(
                            height: Get.height * 0.3,
                            color: Colors.black,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: items
                                      .map((e) => e == currentvalue.value
                                          ? ListTile(
                                              leading: Icon(Icons.done),
                                              title: Text(e),
                                              onTap: () {
                                                currentvalue.value = e;
                                                techController
                                                    .pivotpointstype.value = e;
                                                techprovider
                                                    .getpivotpointsDataByType(
                                                        techController
                                                            .pivotpointstype
                                                            .value);
                                                Get.back();
                                              },
                                            )
                                          : ListTile(
                                              leading: Container(
                                                height: 20,
                                                width: 10,
                                              ),
                                              title: Text(e),
                                              onTap: () {
                                                currentvalue.value = e;
                                                techController
                                                    .pivotpointstype.value = e;
                                                techprovider
                                                    .getpivotpointsDataByType(
                                                        techController
                                                            .pivotpointstype
                                                            .value);
                                                Get.back();
                                              }))
                                      .toList(),
                                )))),
                      );
                    },
                    child: DropdownButton(
                      items: items
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "$e",
                                  style: GoogleFonts.ibmPlexSans(
                                      color: Colors.white),
                                ),
                              )))
                          .toList(),
                      dropdownColor: Colors.transparent,
                      isExpanded: true,
                      iconSize: 18,
                      elevation: 10,
                      underline: Container(),
                      iconDisabledColor: Colors.white,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: currentvalue.value,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Padding buildStrongCellBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffFF2E50)),
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              child: Obx(() => Text(
                    "${techController.techindicator.value.text}",
                    style: GoogleFonts.ibmPlexSans(fontSize: 14),
                  )))
        ],
      ),
    );
  }

  Padding buildBuyBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              child: Obx(() => Text(
                    "${techController.movingaverage.value.text}",
                    style: GoogleFonts.ibmPlexSans(fontSize: 16),
                  )))
        ],
      ),
    );
  }

  Padding buildCountBuy(List list) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: list
            .map(
              (e) => Text("$e", style: GoogleFonts.ibmPlexSans(fontSize: 20)),
            )
            .toList(),
      ),
    );
  }

  Padding buildBuyNeutralSell() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Buy ",
              style:
                  GoogleFonts.ibmPlexSans(fontSize: 16, color: Colors.white54)),
          Text("Neutral",
              style:
                  GoogleFonts.ibmPlexSans(fontSize: 16, color: Colors.white54)),
          Text("Sell",
              style:
                  GoogleFonts.ibmPlexSans(fontSize: 16, color: Colors.white54))
        ],
      ),
    );
  }

  Widget buildListTime() {
    final selectedindex = 0.obs;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(timelist.length, (index) {
              return GestureDetector(
                onTap: () async {
                  selectedindex.value = index;
                  if (selectedindex.value == 0) {
                    techController.currenttime.value = "1min";
                  }
                  if (selectedindex.value == 1) {
                    techController.currenttime.value = "5min";
                  }
                  if (selectedindex.value == 2) {
                    techController.currenttime.value = "15min";
                  }
                  if (selectedindex.value == 3) {
                    techController.currenttime.value = "30min";
                  }
                  if (selectedindex.value == 4) {
                    techController.currenttime.value = "1hour";
                  }
                  if (selectedindex.value == 5) {
                    techController.currenttime.value = "5hour";
                  }
                  if (selectedindex.value == 6) {
                    techController.currenttime.value = "daily";
                  }
                  if (selectedindex.value == 7) {
                    techController.currenttime.value = "weekly";
                  }
                  if (selectedindex.value == 8) {
                    techController.currenttime.value = "monthly";
                  }
                  await techprovider.getData();
                  techprovider.getpivotpointsDataByType(
                      techController.pivotpointstype.value);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: (index == selectedindex.value)
                      ? Container(
                          height: 30,
                          width: 55,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text(timelist[index])),
                        )
                      : Container(
                          height: 30,
                          width: 55,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white24),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            timelist[index],
                            style: TextStyle(color: Colors.white24),
                          )),
                        ),
                ),
              );
            }),
          )),
    );
  }

  Padding builddropdownbutton() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 30, top: 10),
      child: Container(
        color: Color(0xFF121212),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: DropdownButton(
          items: [
            DropdownMenuItem(
                child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Technical Indictors",
                style: GoogleFonts.ibmPlexSans(fontWeight: FontWeight.w500),
              ),
            ))
          ],
          dropdownColor: Colors.transparent,
          isExpanded: true,
          iconSize: 18,
          elevation: 10,
          underline: Container(),
          iconDisabledColor: Colors.white,
          icon: Icon(Icons.keyboard_arrow_down),
          onTap: () {},
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 18,
        ),
        onPressed: () {},
      ),
      title: Text(
        "USD /INR",
        style: GoogleFonts.ibmPlexSans(fontSize: 25),
      ),
    );
  }

  Widget buildMyColorBar() {
    var colors = [
      Color(0xff007AFF),
      Color(0xff007AFF).withOpacity(0.5),
      Color(0xFFFFB946),
      Color(0xFFFF2E50).withOpacity(0.5),
      Color(0xFFFF2E50)
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              techController.summarytext.value == "Strong Buy"
                  ? showWithToolTip(
                      tooltipcolor: colors[0],
                      barcolor: colors[0],
                      text: techController.summarytext.value)
                  : Container(
                      height: 60,
                      width: 8,
                      decoration: BoxDecoration(
                          color: colors[0],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          )),
                    ),
              techController.summarytext.value == "Buy"
                  ? showWithToolTip(
                      tooltipcolor: colors[1],
                      barcolor: colors[1],
                      text: techController.summarytext.value)
                  : Container(
                      height: 60,
                      width: 8,
                      decoration: BoxDecoration(
                          color: colors[1],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          )),
                    ),
              techController.summarytext.value == "Neutral"
                  ? showWithToolTip(
                      tooltipcolor: colors[2],
                      barcolor: colors[2],
                      text: techController.summarytext.value)
                  : Container(
                      height: 60,
                      width: 8,
                      decoration: BoxDecoration(
                          color: colors[2],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          )),
                    ),
              techController.summarytext.value == "Sell"
                  ? showWithToolTip(
                      tooltipcolor: colors[3],
                      barcolor: colors[3],
                      text: techController.summarytext.value)
                  : Container(
                      height: 60,
                      width: 8,
                      decoration: BoxDecoration(
                          color: colors[3],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          )),
                    ),
              techController.summarytext.value == "Strong Sell"
                  ? showWithToolTip(
                      tooltipcolor: colors[4],
                      barcolor: colors[4],
                      text: techController.summarytext.value)
                  : Container(
                      height: 60,
                      width: 8,
                      decoration: BoxDecoration(
                          color: colors[4],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          )),
                    ),
            ],
          )),
    );
  }

  Padding showWithToolTip({Color tooltipcolor, String text, Color barcolor}) {
    return Padding(
      padding: EdgeInsets.only(left: 0),
      child: widget(
              child: SimpleTooltip(
          minimumOutSidePadding: 5,
          tooltipTap: () {
            //print("Tooltip tap");
          },
          backgroundColor: tooltipcolor,
          borderColor: tooltipcolor,
          maxHeight: 40,
          minWidth: 90,
          borderRadius: 4,
          ballonPadding: EdgeInsets.all(0),
          animationDuration: Duration(seconds: 1),
          show: true,
          tooltipDirection: TooltipDirection.horizontal,
          arrowLength: 14,
          arrowBaseWidth: 20,
          child: Container(
            height: 60,
            width: 12,
            color: barcolor,
          ),
          content: Text(
            text,
            style: GoogleFonts.ibmPlexSans(
                color: Colors.black,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
