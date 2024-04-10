import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List names=[
    {
      'name':'Amma',
      'contact':'9787396651',
      'image':'assets/images/amma.png',
      'time':'5:15pm'
    },
    {
      'name':'Appa',
      'contact':'7868047565',
     'image':'assets/images/appa.png',
      'time':'2:18 PM'
    },
    {
      'name':'Appu',
      'contact':'9843092710',
      'image':'assets/images/appu.png',
      'time':'11:30 AM'
    },
    {
      'name':'Sur',
      'contact':'7806825737',
      'image':'assets/images/boyprince.png',
      'time':'8:15 AM'
    },
    {
      'name':'Divya',
      'contact':'8608253335',
      'image':'assets/images/divya.png',
      'time':'yesterday'
    },
    {
      'name':'Momo',
      'contact':'9787396651',
      'image':'assets/images/amma.png',
      'time':'5:15pm'
    },
    {
      'name':'Subi',
      'contact':'7868047565',
      'image':'assets/images/divya.png',
      'time':'2:18 PM'
    },
    {
      'name':'Kumaran',
      'contact':'9843092710',
      'image':'assets/images/appu.png',
      'time':'11:30 AM'
    },
    {
      'name':'Prince',
      'contact':'7806825737',
      'image':'assets/images/boyprince.png',
      'time':'8:15 AM'
    },
    {
      'name':'Moni',
      'contact':'8608253335',
      'image':'assets/images/divya.png',
      'time':'yesterday'
    },
    {
      'name':'Imanuel',
      'contact':'7806825737',
      'image':'assets/images/boyprince.png',
      'time':'8:15 AM'
    },
    {
      'name':'veronic',
      'contact':'8608253335',
      'image':'assets/images/divya.png',
      'time':'yesterday'
    },

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color(0xff00b3b3),
        title: Text("Chat App"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.camera_alt_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: PageView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: names.length,
                itemBuilder: (context,index){
                  return ListTile(
                    onTap: ()async{
                      /*Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> ChatBox()));*/
                      final Uri url=Uri (
                        scheme: 'sms',
                        path: '7868047565',
                      );
                      if(await canLaunchUrl(url)){
                      await launchUrl(url);
                      }else{
                      print('Show dialog: cannot launch this url');
                      }
                    },
                    title:Text(names[index]['name']) ,
                    subtitle: Text(names[index]['contact']),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xff075E54),
                      child: Image.asset(names[index]['image'])
                    ),
                    trailing: Text(names[index]['time']),
                  );
                }
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title:Text(names[index]['name']) ,
                    subtitle: Text(names[index]['contact']),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffcfc5c4),
                      child: Image.asset(names[index]['image'])
                    ),
                    trailing: IconButton(
                        onPressed: (){

                          setState(() {
                            FlutterPhoneDirectCaller.callNumber('9843092710');
                            FlutterPhoneDirectCaller.callNumber('9787396651');
                            FlutterPhoneDirectCaller.callNumber('7868047565');
                          });
                        },
                        icon: Icon(Icons.call)),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}


