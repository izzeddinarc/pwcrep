import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pwc_project/models/country_model.dart';
import 'package:pwc_project/models/news_model.dart';
import 'package:pwc_project/services/remote_services.dart';

class NewsController extends GetxController {
  
  var isLoading = true.obs;
  var newsList = List<Article>().obs;
  

  
  var countryCode="".obs;
  
  

  @override
  void onInit() {
    //fetchNewsData();
    super.onInit();
  }

  

  

  void fetchNewsData() async {
    try {
      isLoading(true);
      var newsData = await RemoteServices().fetchNews(countryCode.value);
      if (newsData != null) {
        newsList.assignAll(newsData);
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}