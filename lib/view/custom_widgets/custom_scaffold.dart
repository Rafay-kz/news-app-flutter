import 'package:flutter/material.dart';
import 'package:news_app/view/custom_widgets/custom_appbar.dart';

class CustomScaffold extends StatefulWidget {

  final Widget body;
  final String className,screenName;
  final Function? onWillPop,
      gestureDetectorOnTap,
      onBackButtonPressed,
      gestureDetectorOnPanDown,
      onNotificationListener;
  final GlobalKey<ScaffoldState> scaffoldKey;


  CustomScaffold({
    required this.className,
    required this.screenName,
    this.onWillPop,
    this.onBackButtonPressed,
    this.gestureDetectorOnPanDown,
    this.gestureDetectorOnTap,
    this.onNotificationListener,
    required this.scaffoldKey,
    required this.body,
  });


  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (){
          if(widget.onWillPop!=null) {
            return widget.onWillPop!();
          } else {
            return Future.value(true);
          }
        },
        child: GestureDetector(
          onTap: (){
            if(widget.gestureDetectorOnTap != null){
              widget.gestureDetectorOnTap!();
            }
          },
          onPanDown: (panDetails){
            if(widget.gestureDetectorOnPanDown!= null){
              widget.gestureDetectorOnPanDown!(panDetails);
            }
          },
          child: NotificationListener(
            onNotification: (notificationInfo){
              if(widget.onNotificationListener!=null) {
                return widget.onNotificationListener!(notificationInfo);
              } else {
                return false;
              }
            } ,
            child: Scaffold(
              backgroundColor: const Color(0xFFD7CCC8),
              key: widget.scaffoldKey,
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(120),
                  child: CustomAppbar(categoryName: widget.screenName,)
              ),

              body:widget.body,
            ) ,
          ),
        ));
  }

}