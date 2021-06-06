import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pwc_project/controllers/country_controller.dart';
import 'package:pwc_project/controllers/covid_controller.dart';
import 'package:pwc_project/controllers/news_controller.dart';

class HomePage extends StatelessWidget {
  CovidController _covidController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Covid-19 tracking',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),

      body: SafeArea(
        child:Column(
          children: [
            Expanded(
              child:Obx((){
                  if(_covidController.isLoading.value)
                   return Center(child: CircularProgressIndicator());
                   else
                   return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 4),
                        ),
                        itemCount: _covidController.covidInfo.value.dates.todayDateKey.countries.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 3,
                                child: InkWell(
                                  onTap: (){
                                    _covidController.fetchCountryData(_covidController.covidInfo.value.dates.todayDateKey.countries[index].id);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(_covidController.covidInfo.value.dates.todayDateKey.countries[index].name,
                                          style: TextStyle(fontSize: 18))
                                        ],),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                          
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Confirmed cases",
                                                style: TextStyle(fontSize: 22, color: Colors.red),),
                                                SizedBox(height:8),
                                                Text(_covidController.covidInfo.value.dates.todayDateKey.countries[index].todayConfirmed.toString(),
                                                style: TextStyle(fontSize: 18,color: Colors.red),),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text("Confirmed Deaths",
                                              style: TextStyle(fontSize: 22, color: Colors.red),),
                                              SizedBox(height:8),
                                              Text(_covidController.covidInfo.value.dates.todayDateKey.countries[index].todayDeaths.toString(),
                                              style: TextStyle(fontSize: 18,color: Colors.red),),
                                            ],
                                          )
                                        ],),
                                        
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                          
                                          Column(
                                            children: [
                                              Text("Recovered",
                                              style: TextStyle(fontSize: 22, color: Colors.green),),
                                              SizedBox(height:8),
                                              Text(_covidController.covidInfo.value.dates.todayDateKey.countries[index].todayRecovered.toString(),
                                              style: TextStyle(fontSize: 18,color: Colors.green),),
                                            ],
                                          )
                                        ],),
                                        
                                
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        },
                      );
                }
              ) ),

              
          ],
        )),


    );
  }
}