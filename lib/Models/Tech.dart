// To parse this JSON data, do
//
//     final tech = techFromJson(jsonString);

import 'dart:convert';

Tech techFromJson(String str) => Tech.fromJson(json.decode(str));

String techToJson(Tech data) => json.encode(data.toJson());

class Tech {
    Tech({
        this.historicalData,
        this.overview,
        this.technicalIndicator,
    });

    final HistoricalData historicalData;
    final Overview overview;
    final Map<String, TechnicalIndicatorValue> technicalIndicator;

    factory Tech.fromJson(Map<String, dynamic> json) => Tech(
        historicalData: HistoricalData.fromJson(json["historical_data"]),
        overview: Overview.fromJson(json["overview"]),
        technicalIndicator: Map.from(json["technical_indicator"]).map((k, v) => MapEntry<String, TechnicalIndicatorValue>(k, TechnicalIndicatorValue.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "historical_data": historicalData.toJson(),
        "overview": overview.toJson(),
        "technical_indicator": Map.from(technicalIndicator).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class HistoricalData {
    HistoricalData({
        this.daily,
        this.monthly,
        this.weekly,
    });

    final List<Daily> daily;
    final List<Daily> monthly;
    final List<Daily> weekly;

    factory HistoricalData.fromJson(Map<String, dynamic> json) => HistoricalData(
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
        monthly: List<Daily>.from(json["monthly"].map((x) => Daily.fromJson(x))),
        weekly: List<Daily>.from(json["weekly"].map((x) => Daily.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
        "monthly": List<dynamic>.from(monthly.map((x) => x.toJson())),
        "weekly": List<dynamic>.from(weekly.map((x) => x.toJson())),
    };
}

class Daily {
    Daily({
        this.chgPercent,
        this.date,
        this.high,
        this.low,
        this.open,
        this.price,
        this.volume,
    });

    final String chgPercent;
    final String date;
    final String high;
    final String low;
    final String open;
    final String price;
    final String volume;

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        chgPercent: json["chg_percent"],
        date: json["date"],
        high: json["high"],
        low: json["low"],
        open: json["open"],
        price: json["price"],
        volume: json["volume"],
    );

    Map<String, dynamic> toJson() => {
        "chg_percent": chgPercent,
        "date": date,
        "high": high,
        "low": low,
        "open": open,
        "price": price,
        "volume": volume,
    };
}

class Overview {
    Overview({
        this.the52WeekRange,
        this.ask,
        this.bid,
        this.change,
        this.changePercent,
        this.daysRange,
        this.name,
        this.open,
        this.previousClose,
        this.price,
    });

    final String the52WeekRange;
    final String ask;
    final String bid;
    final String change;
    final String changePercent;
    final String daysRange;
    final String name;
    final String open;
    final String previousClose;
    final String price;

    factory Overview.fromJson(Map<String, dynamic> json) => Overview(
        the52WeekRange: json["52_week_range"],
        ask: json["ask"],
        bid: json["bid"],
        change: json["change"],
        changePercent: json["change_percent"],
        daysRange: json["days_range"],
        name: json["name"],
        open: json["open"],
        previousClose: json["previous_close"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "52_week_range": the52WeekRange,
        "ask": ask,
        "bid": bid,
        "change": change,
        "change_percent": changePercent,
        "days_range": daysRange,
        "name": name,
        "open": open,
        "previous_close": previousClose,
        "price": price,
    };
}

class TechnicalIndicatorValue {
    TechnicalIndicatorValue({
        this.movingAverages,
        this.pivotPoints,
        this.summary,
        this.technicalIndicator,
    });

    final MovingAverages movingAverages;
    final PivotPoints pivotPoints;
    final Summary summary;
    final TechnicalIndicatorTechnicalIndicator technicalIndicator;

    factory TechnicalIndicatorValue.fromJson(Map<String, dynamic> json) => TechnicalIndicatorValue(
        movingAverages: MovingAverages.fromJson(json["moving_averages"]),
        pivotPoints: PivotPoints.fromJson(json["pivot_points"]),
        summary: Summary.fromJson(json["summary"]),
        technicalIndicator: TechnicalIndicatorTechnicalIndicator.fromJson(json["technical_indicator"]),
    );

    Map<String, dynamic> toJson() => {
        "moving_averages": movingAverages.toJson(),
        "pivot_points": pivotPoints.toJson(),
        "summary": summary.toJson(),
        "technical_indicator": technicalIndicator.toJson(),
    };
}

class MovingAverages {
    MovingAverages({
        this.buy,
        this.sell,
        this.tableData,
        this.text,
    });

    final String buy;
    final String sell;
    final TableData tableData;
    final String text;

    factory MovingAverages.fromJson(Map<String, dynamic> json) => MovingAverages(
        buy: json["buy"],
        sell: json["sell"],
        tableData: TableData.fromJson(json["table_data"]),
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "buy": buy,
        "sell": sell,
        "table_data": tableData.toJson(),
        "text": text,
    };
}

class TableData {
    TableData({
        this.exponential,
        this.simple,
    });

    final List<Exponential> exponential;
    final List<Exponential> simple;

    factory TableData.fromJson(Map<String, dynamic> json) => TableData(
        exponential: List<Exponential>.from(json["exponential"].map((x) => Exponential.fromJson(x))),
        simple: List<Exponential>.from(json["simple"].map((x) => Exponential.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "exponential": List<dynamic>.from(exponential.map((x) => x.toJson())),
        "simple": List<dynamic>.from(simple.map((x) => x.toJson())),
    };
}

class Exponential {
    Exponential({
        this.title,
        this.type,
        this.value,
    });

    final Title title;
    final Action type;
    final String value;

    factory Exponential.fromJson(Map<String, dynamic> json) => Exponential(
        title: titleValues.map[json["title"]],
        type: actionValues.map[json["type"]],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "type": actionValues.reverse[type],
        "value": value,
    };
}

enum Title { MA5, MA10, MA20, MA50, MA100, MA200 }

final titleValues = EnumValues({
    "MA10": Title.MA10,
    "MA100": Title.MA100,
    "MA20": Title.MA20,
    "MA200": Title.MA200,
    "MA5": Title.MA5,
    "MA50": Title.MA50
});

enum Action { SELL, BUY, NEUTRAL, HIGH_VOLATILITY, OVERSOLD, LESS_VOLATILITY, OVERBOUGHT }

final actionValues = EnumValues({
    "Buy": Action.BUY,
    "High Volatility": Action.HIGH_VOLATILITY,
    "Less Volatility": Action.LESS_VOLATILITY,
    "Neutral": Action.NEUTRAL,
    "Overbought": Action.OVERBOUGHT,
    "Oversold": Action.OVERSOLD,
    "Sell": Action.SELL
});

class PivotPoints {
    PivotPoints({
        this.camarilla,
        this.classic,
        this.demark,
        this.fibonacci,
        this.woodie,
    });

    final Camarilla camarilla;
    final Camarilla classic;
    final Camarilla demark;
    final Camarilla fibonacci;
    final Camarilla woodie;

    factory PivotPoints.fromJson(Map<String, dynamic> json) => PivotPoints(
        camarilla: Camarilla.fromJson(json["camarilla"]),
        classic: Camarilla.fromJson(json["classic"]),
        demark: Camarilla.fromJson(json["demark"]),
        fibonacci: Camarilla.fromJson(json["fibonacci"]),
        woodie: Camarilla.fromJson(json["woodie"]),
    );

    Map<String, dynamic> toJson() => {
        "camarilla": camarilla.toJson(),
        "classic": classic.toJson(),
        "demark": demark.toJson(),
        "fibonacci": fibonacci.toJson(),
        "woodie": woodie.toJson(),
    };
}

class Camarilla {
    Camarilla({
        this.pivotPoints,
        this.r1,
        this.r2,
        this.r3,
        this.s1,
        this.s2,
        this.s3,
    });

    final String pivotPoints;
    final String r1;
    final String r2;
    final String r3;
    final String s1;
    final String s2;
    final String s3;

    factory Camarilla.fromJson(Map<String, dynamic> json) => Camarilla(
        pivotPoints: json["pivot_points"],
        r1: json["r1"],
        r2: json["r2"],
        r3: json["r3"],
        s1: json["s1"],
        s2: json["s2"],
        s3: json["s3"],
    );

    Map<String, dynamic> toJson() => {
        "pivot_points": pivotPoints,
        "r1": r1,
        "r2": r2,
        "r3": r3,
        "s1": s1,
        "s2": s2,
        "s3": s3,
    };
}

class Summary {
    Summary({
        this.summaryText,
    });

    final String summaryText;

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        summaryText: json["summary_text"],
    );

    Map<String, dynamic> toJson() => {
        "summary_text": summaryText,
    };
}

class TechnicalIndicatorTechnicalIndicator {
    TechnicalIndicatorTechnicalIndicator({
        this.buy,
        this.neutral,
        this.sell,
        this.tableData,
        this.text,
    });

    final String buy;
    final String neutral;
    final String sell;
    final List<TableDatum> tableData;
    final String text;

    factory TechnicalIndicatorTechnicalIndicator.fromJson(Map<String, dynamic> json) => TechnicalIndicatorTechnicalIndicator(
        buy: json["buy"],
        neutral: json["neutral"],
        sell: json["sell"],
        tableData: List<TableDatum>.from(json["table_data"].map((x) => TableDatum.fromJson(x))),
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "buy": buy,
        "neutral": neutral,
        "sell": sell,
        "table_data": List<dynamic>.from(tableData.map((x) => x.toJson())),
        "text": text,
    };
}

class TableDatum {
    TableDatum({
        this.action,
        this.name,
        this.value,
    });

    final Action action;
    final String name;
    final String value;

    factory TableDatum.fromJson(Map<String, dynamic> json) => TableDatum(
        action: actionValues.map[json["action"]],
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "action": actionValues.reverse[action],
        "name": name,
        "value": value,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
