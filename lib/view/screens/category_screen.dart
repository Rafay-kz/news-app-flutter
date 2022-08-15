import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/category_screen_controller.dart';
import 'package:news_app/view/custom_widgets/custom_scaffold.dart';

class CategoryScreen extends GetView<CategoryScreenController>{
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      screenName: controller.categoryName,
      className: runtimeType.toString(),
      body:Container(
        child: _homebody(),
      ),
    );
  }
  Widget _homebody(){
    return SingleChildScrollView(
        child: SizedBox(
            height: Get.height,
            child: Obx(()=>
                InkWell(child: listOfCategoryNews()),
            )

        ),
      );


  }

  Widget listOfCategoryNews(){
    return Padding(
      padding: const EdgeInsets.only(top: 15,bottom: 50),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.newsCategory.length,
        itemBuilder: (BuildContext context,int index){
          if (controller.newsCategory.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child:

              Stack(
                children: [
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

                   ),
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
                        controller.newsCategory[index].urlToImage!=''?
                        CachedNetworkImage(imageUrl: controller.newsCategory[index].urlToImage):
                        const Text('No Image...'),
                        const SizedBox(height: 12,),
                        SizedBox(
                            child:
                            controller.newsCategory[index].title!=''?
                            Text(controller.newsCategory[index].title, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),):
                            const Text('No Title...')
                        ),
                        const SizedBox(height: 10,),
                        SizedBox(
                            child:
                            controller.newsCategory[index].description!=''?
                            Text(controller.newsCategory[index].description, style: const TextStyle(fontSize: 15),):
                            const Text('No Description...')
                        ),
                      ],
                    ),
                  ),
                ),]
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