// To parse this JSON data, do
//
//     final covidTrackingModel = covidTrackingModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

CovidTrackingModel covidTrackingModelFromJson(String str) => CovidTrackingModel.fromJson(json.decode(str));



class CovidTrackingModel {
    CovidTrackingModel({
        this.dates,
        this.metadata,
        this.total,
        this.updatedAt,
    });

    Dates dates;
    Metadata metadata;
    Total total;
    String updatedAt;

    factory CovidTrackingModel.fromJson(Map<String, dynamic> json) => CovidTrackingModel(
        dates: Dates.fromJson(json["dates"]),
        metadata: Metadata.fromJson(json["metadata"]),
        total: Total.fromJson(json["total"]),
        updatedAt: json["updated_at"],
    );

   
}

class Dates {
    Dates({
        this.todayDateKey,
    });

    TodayDateKey todayDateKey;
    
    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        todayDateKey: TodayDateKey.fromJson(json[DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()]),
    );

   
}

class TodayDateKey {
    TodayDateKey({
        this.countries,
        this.info,
    });

    List<dynamic> countries;
    Info info;

    factory TodayDateKey.fromJson(Map<String, dynamic> json) => TodayDateKey(
        countries: json['countries'].entries.map( (entry) => Total.fromJson(entry.value)).toList(),
        info: Info.fromJson(json["info"]),
    );

    
}



class Total {
    Total({
        this.date,
        this.id,
        this.links,
        this.name,
        this.nameEs,
        this.nameIt,
        this.regions,
        this.source,
        this.todayConfirmed,
        this.todayDeaths,
        this.todayNewConfirmed,
        this.todayNewDeaths,
        this.todayNewOpenCases,
        this.todayNewRecovered,
        this.todayOpenCases,
        this.todayRecovered,
        this.todayVsYesterdayConfirmed,
        this.todayVsYesterdayDeaths,
        this.todayVsYesterdayOpenCases,
        this.todayVsYesterdayRecovered,
        this.yesterdayConfirmed,
        this.yesterdayDeaths,
        this.yesterdayOpenCases,
        this.yesterdayRecovered,
        this.subRegions,
        this.todayIntensiveCare,
        this.todayNewIntensiveCare,
        this.todayNewTotalHospitalisedPatients,
        this.todayTotalHospitalisedPatients,
        this.todayVsYesterdayIntensiveCare,
        this.todayVsYesterdayTotalHospitalisedPatients,
        this.yesterdayIntensiveCare,
        this.yesterdayTotalHospitalisedPatients,
        this.todayNewTests,
        this.todayTests,
        this.todayVsYesterdayTests,
        this.yesterdayTests,
        this.rid,
    });

    DateTime date;
    String id;
    List<Link> links;
    String name;
    String nameEs;
    String nameIt;
    List<Total> regions;
    String source;
    int todayConfirmed;
    int todayDeaths;
    int todayNewConfirmed;
    int todayNewDeaths;
    int todayNewOpenCases;
    int todayNewRecovered;
    int todayOpenCases;
    int todayRecovered;
    double todayVsYesterdayConfirmed;
    double todayVsYesterdayDeaths;
    double todayVsYesterdayOpenCases;
    double todayVsYesterdayRecovered;
    int yesterdayConfirmed;
    int yesterdayDeaths;
    int yesterdayOpenCases;
    int yesterdayRecovered;
    List<SubRegion> subRegions;
    int todayIntensiveCare;
    int todayNewIntensiveCare;
    int todayNewTotalHospitalisedPatients;
    int todayTotalHospitalisedPatients;
    double todayVsYesterdayIntensiveCare;
    double todayVsYesterdayTotalHospitalisedPatients;
    int yesterdayIntensiveCare;
    int yesterdayTotalHospitalisedPatients;
    int todayNewTests;
    int todayTests;
    dynamic todayVsYesterdayTests;
    int yesterdayTests;
    String rid;

    factory Total.fromJson(Map<String, dynamic> json) => Total(
        date: DateTime.parse(json["date"]),
        id: json["id"] == null ? null : json["id"],
        links: json["links"] == null ? null : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        name: json["name"],
        nameEs: json["name_es"],
        nameIt: json["name_it"],
        regions: json["regions"] == null ? null : List<Total>.from(json["regions"].map((x) => Total.fromJson(x))),
        source: json["source"] == null ? null : json["source"],
        todayConfirmed: json["today_confirmed"] == null ? null : json["today_confirmed"],
        todayDeaths: json["today_deaths"] == null ? null : json["today_deaths"],
        todayNewConfirmed: json["today_new_confirmed"] == null ? null : json["today_new_confirmed"],
        todayNewDeaths: json["today_new_deaths"] == null ? null : json["today_new_deaths"],
        todayNewOpenCases: json["today_new_open_cases"] == null ? null : json["today_new_open_cases"],
        todayNewRecovered: json["today_new_recovered"] == null ? null : json["today_new_recovered"],
        todayOpenCases: json["today_open_cases"] == null ? null : json["today_open_cases"],
        todayRecovered: json["today_recovered"] == null ? null : json["today_recovered"],
        todayVsYesterdayConfirmed: json["today_vs_yesterday_confirmed"] == null ? null : json["today_vs_yesterday_confirmed"].toDouble(),
        todayVsYesterdayDeaths: json["today_vs_yesterday_deaths"] == null ? null : json["today_vs_yesterday_deaths"].toDouble(),
        todayVsYesterdayOpenCases: json["today_vs_yesterday_open_cases"] == null ? null : json["today_vs_yesterday_open_cases"].toDouble(),
        todayVsYesterdayRecovered: json["today_vs_yesterday_recovered"] == null ? null : json["today_vs_yesterday_recovered"].toDouble(),
        yesterdayConfirmed: json["yesterday_confirmed"] == null ? null : json["yesterday_confirmed"],
        yesterdayDeaths: json["yesterday_deaths"] == null ? null : json["yesterday_deaths"],
        yesterdayOpenCases: json["yesterday_open_cases"] == null ? null : json["yesterday_open_cases"],
        yesterdayRecovered: json["yesterday_recovered"] == null ? null : json["yesterday_recovered"],
        subRegions: json["sub_regions"] == null ? null : List<SubRegion>.from(json["sub_regions"].map((x) => SubRegion.fromJson(x))),
        todayIntensiveCare: json["today_intensive_care"] == null ? null : json["today_intensive_care"],
        todayNewIntensiveCare: json["today_new_intensive_care"] == null ? null : json["today_new_intensive_care"],
        todayNewTotalHospitalisedPatients: json["today_new_total_hospitalised_patients"] == null ? null : json["today_new_total_hospitalised_patients"],
        todayTotalHospitalisedPatients: json["today_total_hospitalised_patients"] == null ? null : json["today_total_hospitalised_patients"],
        todayVsYesterdayIntensiveCare: json["today_vs_yesterday_intensive_care"] == null ? null : json["today_vs_yesterday_intensive_care"].toDouble(),
        todayVsYesterdayTotalHospitalisedPatients: json["today_vs_yesterday_total_hospitalised_patients"] == null ? null : json["today_vs_yesterday_total_hospitalised_patients"].toDouble(),
        yesterdayIntensiveCare: json["yesterday_intensive_care"] == null ? null : json["yesterday_intensive_care"],
        yesterdayTotalHospitalisedPatients: json["yesterday_total_hospitalised_patients"] == null ? null : json["yesterday_total_hospitalised_patients"],
        todayNewTests: json["today_new_tests"] == null ? null : json["today_new_tests"],
        todayTests: json["today_tests"] == null ? null : json["today_tests"],
        todayVsYesterdayTests: json["today_vs_yesterday_tests"],
        yesterdayTests: json["yesterday_tests"] == null ? null : json["yesterday_tests"],
        rid: json["rid"] == null ? null : json["rid"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "id": id == null ? null : id,
        "links": links == null ? null : List<dynamic>.from(links.map((x) => x.toJson())),
        "name": name,
        "name_es": nameEs,
        "name_it": nameIt,
        "regions": regions == null ? null : List<dynamic>.from(regions.map((x) => x.toJson())),
        "source": source == null ? null : source,
        "today_confirmed": todayConfirmed == null ? null : todayConfirmed,
        "today_deaths": todayDeaths == null ? null : todayDeaths,
        "today_new_confirmed": todayNewConfirmed == null ? null : todayNewConfirmed,
        "today_new_deaths": todayNewDeaths == null ? null : todayNewDeaths,
        "today_new_open_cases": todayNewOpenCases == null ? null : todayNewOpenCases,
        "today_new_recovered": todayNewRecovered == null ? null : todayNewRecovered,
        "today_open_cases": todayOpenCases == null ? null : todayOpenCases,
        "today_recovered": todayRecovered == null ? null : todayRecovered,
        "today_vs_yesterday_confirmed": todayVsYesterdayConfirmed == null ? null : todayVsYesterdayConfirmed,
        "today_vs_yesterday_deaths": todayVsYesterdayDeaths == null ? null : todayVsYesterdayDeaths,
        "today_vs_yesterday_open_cases": todayVsYesterdayOpenCases == null ? null : todayVsYesterdayOpenCases,
        "today_vs_yesterday_recovered": todayVsYesterdayRecovered == null ? null : todayVsYesterdayRecovered,
        "yesterday_confirmed": yesterdayConfirmed == null ? null : yesterdayConfirmed,
        "yesterday_deaths": yesterdayDeaths == null ? null : yesterdayDeaths,
        "yesterday_open_cases": yesterdayOpenCases == null ? null : yesterdayOpenCases,
        "yesterday_recovered": yesterdayRecovered == null ? null : yesterdayRecovered,
        "sub_regions": subRegions == null ? null : List<dynamic>.from(subRegions.map((x) => x.toJson())),
        "today_intensive_care": todayIntensiveCare == null ? null : todayIntensiveCare,
        "today_new_intensive_care": todayNewIntensiveCare == null ? null : todayNewIntensiveCare,
        "today_new_total_hospitalised_patients": todayNewTotalHospitalisedPatients == null ? null : todayNewTotalHospitalisedPatients,
        "today_total_hospitalised_patients": todayTotalHospitalisedPatients == null ? null : todayTotalHospitalisedPatients,
        "today_vs_yesterday_intensive_care": todayVsYesterdayIntensiveCare == null ? null : todayVsYesterdayIntensiveCare,
        "today_vs_yesterday_total_hospitalised_patients": todayVsYesterdayTotalHospitalisedPatients == null ? null : todayVsYesterdayTotalHospitalisedPatients,
        "yesterday_intensive_care": yesterdayIntensiveCare == null ? null : yesterdayIntensiveCare,
        "yesterday_total_hospitalised_patients": yesterdayTotalHospitalisedPatients == null ? null : yesterdayTotalHospitalisedPatients,
        "today_new_tests": todayNewTests == null ? null : todayNewTests,
        "today_tests": todayTests == null ? null : todayTests,
        "today_vs_yesterday_tests": todayVsYesterdayTests,
        "yesterday_tests": yesterdayTests == null ? null : yesterdayTests,
        "rid": rid == null ? null : rid,
    };
}

class Link {
    Link({
        this.href,
        this.rel,
        this.type,
    });

    String href;
    Rel rel;
    Type type;

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        href: json["href"],
        rel: relValues.map[json["rel"]],
        type: typeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "rel": relValues.reverse[rel],
        "type": typeValues.reverse[type],
    };
}

enum Rel { SELF }

final relValues = EnumValues({
    "self": Rel.SELF
});

enum Type { GET }

final typeValues = EnumValues({
    "GET": Type.GET
});

class SubRegion {
    SubRegion({
        this.date,
        this.id,
        this.name,
        this.nameEs,
        this.nameIt,
        this.source,
        this.todayConfirmed,
        this.todayDeaths,
        this.todayNewConfirmed,
        this.todayNewDeaths,
        this.todayNewRecovered,
        this.todayRecovered,
        this.todayVsYesterdayConfirmed,
        this.todayVsYesterdayDeaths,
        this.todayVsYesterdayRecovered,
        this.yesterdayConfirmed,
        this.yesterdayDeaths,
        this.yesterdayRecovered,
        this.todayIntensiveCare,
        this.todayNewIntensiveCare,
        this.todayNewTotalHospitalisedPatients,
        this.todayTotalHospitalisedPatients,
        this.todayVsYesterdayIntensiveCare,
        this.todayVsYesterdayTotalHospitalisedPatients,
        this.yesterdayIntensiveCare,
        this.yesterdayTotalHospitalisedPatients,
    });

    DateTime date;
    String id;
    String name;
    String nameEs;
    String nameIt;
    String source;
    int todayConfirmed;
    int todayDeaths;
    int todayNewConfirmed;
    int todayNewDeaths;
    int todayNewRecovered;
    int todayRecovered;
    double todayVsYesterdayConfirmed;
    double todayVsYesterdayDeaths;
    double todayVsYesterdayRecovered;
    int yesterdayConfirmed;
    int yesterdayDeaths;
    int yesterdayRecovered;
    int todayIntensiveCare;
    int todayNewIntensiveCare;
    int todayNewTotalHospitalisedPatients;
    int todayTotalHospitalisedPatients;
    double todayVsYesterdayIntensiveCare;
    double todayVsYesterdayTotalHospitalisedPatients;
    int yesterdayIntensiveCare;
    int yesterdayTotalHospitalisedPatients;

    factory SubRegion.fromJson(Map<String, dynamic> json) => SubRegion(
        date: DateTime.parse(json["date"]),
        id: json["id"],
        name: json["name"],
        nameEs: json["name_es"],
        nameIt: json["name_it"],
        source: json["source"],
        todayConfirmed: json["today_confirmed"],
        todayDeaths: json["today_deaths"] == null ? null : json["today_deaths"],
        todayNewConfirmed: json["today_new_confirmed"],
        todayNewDeaths: json["today_new_deaths"] == null ? null : json["today_new_deaths"],
        todayNewRecovered: json["today_new_recovered"] == null ? null : json["today_new_recovered"],
        todayRecovered: json["today_recovered"] == null ? null : json["today_recovered"],
        todayVsYesterdayConfirmed: json["today_vs_yesterday_confirmed"] == null ? null : json["today_vs_yesterday_confirmed"].toDouble(),
        todayVsYesterdayDeaths: json["today_vs_yesterday_deaths"] == null ? null : json["today_vs_yesterday_deaths"].toDouble(),
        todayVsYesterdayRecovered: json["today_vs_yesterday_recovered"] == null ? null : json["today_vs_yesterday_recovered"].toDouble(),
        yesterdayConfirmed: json["yesterday_confirmed"],
        yesterdayDeaths: json["yesterday_deaths"] == null ? null : json["yesterday_deaths"],
        yesterdayRecovered: json["yesterday_recovered"] == null ? null : json["yesterday_recovered"],
        todayIntensiveCare: json["today_intensive_care"] == null ? null : json["today_intensive_care"],
        todayNewIntensiveCare: json["today_new_intensive_care"] == null ? null : json["today_new_intensive_care"],
        todayNewTotalHospitalisedPatients: json["today_new_total_hospitalised_patients"] == null ? null : json["today_new_total_hospitalised_patients"],
        todayTotalHospitalisedPatients: json["today_total_hospitalised_patients"] == null ? null : json["today_total_hospitalised_patients"],
        todayVsYesterdayIntensiveCare: json["today_vs_yesterday_intensive_care"] == null ? null : json["today_vs_yesterday_intensive_care"].toDouble(),
        todayVsYesterdayTotalHospitalisedPatients: json["today_vs_yesterday_total_hospitalised_patients"] == null ? null : json["today_vs_yesterday_total_hospitalised_patients"].toDouble(),
        yesterdayIntensiveCare: json["yesterday_intensive_care"] == null ? null : json["yesterday_intensive_care"],
        yesterdayTotalHospitalisedPatients: json["yesterday_total_hospitalised_patients"] == null ? null : json["yesterday_total_hospitalised_patients"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "id": id,
        "name": name,
        "name_es": nameEs,
        "name_it": nameIt,
        "source": source,
        "today_confirmed": todayConfirmed,
        "today_deaths": todayDeaths == null ? null : todayDeaths,
        "today_new_confirmed": todayNewConfirmed,
        "today_new_deaths": todayNewDeaths == null ? null : todayNewDeaths,
        "today_new_recovered": todayNewRecovered == null ? null : todayNewRecovered,
        "today_recovered": todayRecovered == null ? null : todayRecovered,
        "today_vs_yesterday_confirmed": todayVsYesterdayConfirmed == null ? null : todayVsYesterdayConfirmed,
        "today_vs_yesterday_deaths": todayVsYesterdayDeaths == null ? null : todayVsYesterdayDeaths,
        "today_vs_yesterday_recovered": todayVsYesterdayRecovered == null ? null : todayVsYesterdayRecovered,
        "yesterday_confirmed": yesterdayConfirmed,
        "yesterday_deaths": yesterdayDeaths == null ? null : yesterdayDeaths,
        "yesterday_recovered": yesterdayRecovered == null ? null : yesterdayRecovered,
        "today_intensive_care": todayIntensiveCare == null ? null : todayIntensiveCare,
        "today_new_intensive_care": todayNewIntensiveCare == null ? null : todayNewIntensiveCare,
        "today_new_total_hospitalised_patients": todayNewTotalHospitalisedPatients == null ? null : todayNewTotalHospitalisedPatients,
        "today_total_hospitalised_patients": todayTotalHospitalisedPatients == null ? null : todayTotalHospitalisedPatients,
        "today_vs_yesterday_intensive_care": todayVsYesterdayIntensiveCare == null ? null : todayVsYesterdayIntensiveCare,
        "today_vs_yesterday_total_hospitalised_patients": todayVsYesterdayTotalHospitalisedPatients == null ? null : todayVsYesterdayTotalHospitalisedPatients,
        "yesterday_intensive_care": yesterdayIntensiveCare == null ? null : yesterdayIntensiveCare,
        "yesterday_total_hospitalised_patients": yesterdayTotalHospitalisedPatients == null ? null : yesterdayTotalHospitalisedPatients,
    };
}


enum Source { DIPARTIMENTO_DELLA_PROTEZIONE_CIVILE }

final sourceValues = EnumValues({
    "Dipartimento della Protezione Civile": Source.DIPARTIMENTO_DELLA_PROTEZIONE_CIVILE
});

class Info {
    Info({
        this.date,
        this.dateGeneration,
        this.yesterday,
    });

    String date;
    String dateGeneration;
    String yesterday;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        date: json["date"],
        dateGeneration: json["date_generation"],
        yesterday: json["yesterday"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "date_generation": dateGeneration,
        "yesterday": yesterday,
    };
}

class Metadata {
    Metadata({
        this.by,
        this.url,
    });

    String by;
    List<String> url;

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        by: json["by"],
        url: List<String>.from(json["url"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "by": by,
        "url": List<dynamic>.from(url.map((x) => x)),
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
