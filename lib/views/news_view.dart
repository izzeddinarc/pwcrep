import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pwc_project/controllers/covid_controller.dart';
import 'package:pwc_project/controllers/news_controller.dart';

class NewsPage extends StatelessWidget {
  NewsController _newsController = Get.find();
  @required
  String countryImg;
  NewsPage({Key key, this.countryImg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Health News',
          style: TextStyle(color: Colors.black),
        ),
         leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 24, color: Colors.white),
            onPressed: () => Get.back()),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      

      body: SafeArea(
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Center(
                   child: SvgPicture.network(
    countryImg,
    semanticsLabel: 'Feed button',
    placeholderBuilder: (context) => Icon(Icons.error),
    height: 100,
    width: 100,
  ),
                 ),
               ),

            ],),
            Expanded(
              child:Obx((){
                  if(_newsController.isLoading.value)
                   return Center(child: CircularProgressIndicator());
                   else
                   return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 5),
                        ),
                        itemCount: _newsController.newsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                
                                elevation: 3,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                       
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(_newsController.newsList[index].title,
                                            
                                            maxLines: 1,
                                            style: TextStyle(fontSize: 18),),
                                          ),
                                        )
                                      ],),
                                      
                                      Row(children: [
                                        
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(_newsController.newsList[index].description!=null?_newsController.newsList[index].description:"No description found",
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(fontSize: 18),
                                            overflow:TextOverflow.ellipsis,),
                                          ),
                                        )
                                      ],),
                                      
                                     
                                    ],
                                  ),
                                )),
                          );
                        },
                      );
                }
              ) )
          ],
        )),


    );
  }
}