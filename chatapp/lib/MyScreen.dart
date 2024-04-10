import 'package:flutter/material.dart';
import 'package:online_chatting_app/chatScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {

    controller=AnimationController(
      duration:  Duration(seconds: 2),
        vsync: this);

    animation=CurvedAnimation(
        parent: controller!,
        curve: Curves.easeInOut);
     controller!.forward();
     controller!.addListener(() {
       if(controller!.value==1.0){
         Navigator.push(context,
             MaterialPageRoute(builder: (context)=> ChatScreen()));
       }
       setState(() {

       });
     });


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Image.asset("assets/images/chaticon.png",width: animation!.value*100,)
      ),
    );
  }
}
