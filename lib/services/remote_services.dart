import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:pwc_project/models/country_model.dart';

import 'dart:convert';

import 'package:pwc_project/models/covid_model.dart';
import 'package:pwc_project/models/news_model.dart';


class RemoteServices {
  static var client = http.Client();
  String covidUrl='https://api.covid19tracking.narrativa.com/api?';


   Future<CovidTrackingModel> fetchCovid() async {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String request =
        '$covidUrl/date_from=$today&date_to=$today';
    

    final response = await http.get(
      Uri.parse(request),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        
      },
    );
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return CovidTrackingModel.fromJson(responseJson);
    } else {
      //show error message
      return null;
    }
  }

  Future<List<Article>> fetchNews(String countryCode) async {
    String request =
        'https://newsapi.org/v2/top-headlines?country=$countryCode&category=health&apiKey=3be24e336c724984bcd66f76b36e0ae4';
    

    final response = await http.get(
      Uri.parse(request),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        
      },
    );
    if (response.statusCode == 200) {
      List responseJson = jsonDecode(response.body)['articles'];
      return responseJson.map((m) => new Article.fromJson(m)).toList();
    } else {
      //show error message
      return null;
    }
  }

  Future<CountryModel> fetchCountry(String countryName) async {
    String request =
        'https://restcountries.eu/rest/v2/name/$countryName?fullText=true';
    

    final response = await http.get(
      Uri.parse(request),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        
      },
    );
    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body)[0];
      return CountryModel.fromJson(responseJson);
    } else {
      //show error message
      return null;
    }
  }

  

 
  
}