import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/view/custom_widgets/custom_scaffold.dart';

class HomeScreen extends GetView<HomeScreenController>{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      screenName: "News Home Screen",
      className: runtimeType.toString(),
      body:Container(
        child: _homebody(),
      ),
    );
  }
  Widget _homebody(){
    return SingleChildScrollView(
        child: Column(
        children: <Widget>[
          SizedBox(
            height: 175,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
             shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 10),

                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                       Radius.circular(15),
                      ),

                    ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: const BorderRadius.all( Radius.circular(15),),
                            child: CachedNetworkImage(imageUrl: controller.categories[index].imageUrl, width: 120,height: 160,fit: BoxFit.fill,)),

                        Container(
                        width: 120,height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black12

                          ),
                          alignment: Alignment.center,
                          child: Text(
                          controller.categories[index].categoryName,style: const TextStyle(color:  Color(kWhiteColor),fontSize: 18,fontWeight: FontWeight.bold),

                        ),)
                      ],

                    ),
                  ),

                ),
                onTap: () {
                  controller.CategoryTap(index);
                }
              );

            },),
          ),
          SizedBox(
        height: Get.height,
          child: Obx(()=>
              InkWell(child: listOfNews()),
    )

    ),

        ],

    ),
      );
  }

  Widget listOfNews(){
   return Padding(
     padding: const EdgeInsets.only(top: 15,bottom: 50),
     child: ListView.builder(
          itemCount: controller.news.length,
        itemBuilder: (BuildContext context,int index){
          if (controller.news.isNotEmpty) {
            return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:
                      !controller.showContainer.value?
                      Container(
                        decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 0.,
                                blurRadius: 3,
                                offset: const Offset(1.0, 3.0), // changes position of shadow
                              ),
                            ],
                            color: Colors.white60

                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),

                        ),
                      ):
                  Container(
                    decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            // spreadRadius: 0.,
                            blurRadius: 3,
                            offset: const Offset(1.0, 3.0), // changes position of shadow
                          ),
                        ],
                        color: Colors.white60

                    ),
                    child: Container(
                      alignment: Alignment.center,

                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.news[index].urlToImage!=''?
                          CachedNetworkImage(imageUrl: controller.news[index].urlToImage):
                          const Text('No Image...'),
                          const SizedBox(height: 12,),
                          SizedBox(
                              child:
                              controller.news[index].title!=''?
                              Text(controller.news[index].title, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),):
                              const Text('No Title...')
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                              child:
                              controller.news[index].description!=''?
                              Text(controller.news[index].description, style: const TextStyle(fontSize: 15),):
                              const Text('No Description...')
                          ),
                        ],
                      ),
                    ),
                  ),
                );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
   );
  }

}