import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pwc_project/models/country_model.dart';
import 'package:pwc_project/models/news_model.dart';
import 'package:pwc_project/services/remote_services.dart';

class CountryController extends GetxController {
  
  var isLoading = true.obs;
  var countryData = CountryModel().obs;

  @required
  String countryName;
  
  @override
  CountryController({this.countryName});

  @override
  void onInit() {
    fetchCountryData();
    super.onInit();
  }

  void fetchCountryData() async {
    try {
      isLoading(true);
      var countryResponse = await RemoteServices().fetchCountry(countryName);
      if (countryResponse != null) {
        countryData.value=countryResponse;
      }
    } finally {
      isLoading(false);
    }
  }
}