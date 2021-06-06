import 'package:get/get.dart';
import 'package:pwc_project/models/country_model.dart';
import 'package:pwc_project/models/covid_model.dart';
import 'package:pwc_project/services/remote_services.dart';
import 'package:pwc_project/views/news_view.dart';

import 'news_controller.dart';

class CovidController extends GetxController {
  
  var isLoading = true.obs;
  var covidInfo = CovidTrackingModel().obs;
  var countryData=CountryModel().obs;

  @override
  void onInit() {
    fetchCovidData();
    super.onInit();
  }

  void fetchCountryData(String countryName) async {
    try {
      isLoading(true);
      var countryResponse = await RemoteServices().fetchCountry(countryName);
      if (countryResponse != null) {
        countryData.value=countryResponse;
      }
    } finally {
      isLoading(false);
      final _newsController = Get.put(NewsController());
      _newsController.countryCode.value=countryData.value.alpha2Code;
      _newsController.fetchNewsData();

      Get.to(NewsPage(countryImg: countryData.value.flag,));
    }
  }

  void fetchCovidData() async {
    try {
      isLoading(true);
      var covidData = await RemoteServices().fetchCovid();
      if (covidData != null) {
        covidInfo.value=covidData;
      }
    } finally {
      isLoading(false);
    }
  }
}