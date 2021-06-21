import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:technical_indicatos/Models/Cell3.dart';
import 'package:technical_indicatos/Models/MyCell1.dart';
import 'package:technical_indicatos/Models/MyCell2.dart';

class TechnicalIndicatos extends StatelessWidget {
  TechnicalIndicatos({Key key}) : super(key: key);
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
  final firsttablecellslist = [
    MyCell1("MA10", 465.28, "SELL"),
    MyCell1("MA20", 465.28, "SELL"),
    MyCell1("MA30", 465.28, "BUY"),
    MyCell1("MA50", 465.28, "BUY"),
    MyCell1("MA100", 465.28, "SELL"),
    MyCell1("MA200", 465.28, "BUY"),
  ];
  final secondtablecellslist = [
    MyCell2("RSI(14)", -53.6549, "NEUTRAL"),
    MyCell2("CCI(20)", -53.6549, "SELL"),
    MyCell2("ADI(14)", -53.6549, "BUY"),
    MyCell2("Awesome Oscillator", -53.6549, "SELL"),
    MyCell2("Momentum (10)", -53.6549, "SELL"),
    MyCell2("Stochastic RSI Fast (3, 3, 14, 14)", -53.6549, "SELL"),
    MyCell2("Williams %R(14)", -53.6549, "SELL"),
    MyCell2("Bull Bear Power", -53.6549, "SELL"),
    MyCell2("Ultimate Oscillator (7, 14, 28)", -53.6549, "LESS VOLATAILE"),
  ];
  final thirdtablecellslist = [
    MyCell3("S3", 456.87),
    MyCell3("S2", 456.87),
    MyCell3("S1", 456.87),
    MyCell3("Pivot Points", 456.87),
    MyCell3("R1", 456.87),
    MyCell3("R2", 456.87),
    MyCell3("R3", 456.87),
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
            buildCountBuy(["7", "-", "5"]),
            //Buy,Neutral ,Sell
            buildBuyNeutralSell(),
            //Exponential button
            buildSecondaryDropDownBtn(context, "Exponential"),
            //First Data Table
            buildFirstDataTable(context),
            //Oscillators text
            buildHeadingText("Oscillators"),
            //STrong CEll BTN
            buildStrongCellBtn(),
            //1,1,9
            buildCountBuy(["1", "1", "9"]),
            //Buy,Neutral ,Sell
            buildBuyNeutralSell(),
            buildSecondDataTable(context),
            buildHeadingText('Pivot Points'),
            buildSecondaryDropDownBtn(context, "Classic"),
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
        child: DataTable(
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
            rows: thirdtablecellslist
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
                    ]))
                .toList()),
      ),
    );
  }

  Theme buildSecondDataTable(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: DataTable(
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
            rows: secondtablecellslist
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
                .toList()),
      ),
    );
  }

  Theme buildFirstDataTable(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: DataTable(
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
                  'Period',
                  style: GoogleFonts.ibmPlexSans(color: Colors.white54),
                ),
              ),
              DataColumn(
                //numeric: true,
                label: Text(
                  'Value',
                  style: GoogleFonts.ibmPlexSans(color: Colors.white54),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Type',
                  style: GoogleFonts.ibmPlexSans(color: Colors.white54),
                ),
              ),
            ],
            rows: firsttablecellslist
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
                .toList()),
      ),
    );
  }

  Padding buildSecondaryDropDownBtn(BuildContext context, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 40,
            child: Container(
              color: Color(0xFF121212),
              padding: EdgeInsets.only(right: 10),
              child: DropdownButton(
                items: [
                  DropdownMenuItem(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "$value",
                      style: GoogleFonts.ibmPlexSans(color: Colors.white),
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
          ),
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
              child: Text(
                "STRONG CELL",
                style: GoogleFonts.ibmPlexSans(fontSize: 14),
              ))
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
              child: Text(
                "BUY",
                style: GoogleFonts.ibmPlexSans(fontSize: 16),
              ))
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
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(timelist.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: (index == 0)
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
          );
        }),
      ),
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
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 8,
            decoration: BoxDecoration(
                color: Color(0xff007AFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                )),
          ),
          Container(
            height: 60,
            width: 8,
            decoration: BoxDecoration(
              color: Color(0xff007AFF).withOpacity(0.5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 1),
            child: SimpleTooltip(
              minimumOutSidePadding: 5,
              tooltipTap: () {
                //print("Tooltip tap");
              },
              backgroundColor: Colors.yellow,
              borderColor: Colors.yellow,
              maxHeight: 40,
         
              minWidth: 90,
              borderRadius: 4,
              ballonPadding: EdgeInsets.all(0),
              animationDuration: Duration(seconds: 0),
              show: true,
              tooltipDirection: TooltipDirection.right,
              arrowLength: 14,
              child: Container(
                height: 60,
                width: 12,
                decoration: BoxDecoration(
                  color: Color(0xFFFFB946),
                ),
              ),
              content: Text(
                "NEUTRAL",
                style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            width: 8,
            decoration: BoxDecoration(
              color: Color(0xFFFF2E50).withOpacity(0.5),
            ),
          ),
          Container(
            height: 60,
            width: 8,
            decoration: BoxDecoration(
                color: Color(0xFFFF2E50),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                )),
          ),
        ],
      ),
    );
  }
}
