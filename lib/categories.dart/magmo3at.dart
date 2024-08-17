import 'package:flutter/material.dart';
import 'package:mutamaruna/categories.dart/elpernameg.dart';

class Magmo3at extends StatefulWidget{
  @override
  State<Magmo3at> createState()=> _Magmo3at();
}

class _Magmo3at extends State<Magmo3at>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("المجموعات",style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),),backgroundColor: Color.fromARGB(255, 49, 33, 109),),
      body:Stack(children: [
       Container(
        color: Color.fromARGB(255, 27, 90, 142),),
       Center(child:Container(width: 330,
          child: ListView(
        children: [
           Container(height: 100,padding: EdgeInsets.fromLTRB(0, 10, 0,10),
            child:Column(children: [Text("...اتعلم تشتغل مع عيلتك كفريق",style: TextStyle(fontSize: 22),),
          Text("😏😏حبوا بعض, مش عايزين مشاكل هنا",style: TextStyle(fontSize: 20),)
          ],)),
          
          Container2(day1: "اليوم الاول", photo1: "images/Screenshot (172).png", color1: Colors.white),
         Container2(day1: "اليوم الثانى", photo1: "images/Screenshot (177).png", color1: Colors.blue),
         Container2(day1: "اليوم الثالث", photo1: "images/Screenshot (172).png", color1: Colors.white),
         Container2(day1: "اليوم الرابع", photo1: "images/Screenshot (177).png", color1: Colors.blue),
        ],
      )))],)
      
      
    );
  }
}