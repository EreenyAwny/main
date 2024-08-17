import 'package:flutter/material.dart';

class Elpernameg extends StatefulWidget{
 @override
  State<Elpernameg> createState() => _Elpernameg();}

  class _Elpernameg extends State<Elpernameg>{
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Now What? (البرنامج)", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 174, 75)),),backgroundColor: Color.fromARGB(255, 49, 33, 109),),
      body: ListView(
        children: [
          Container2(day1: "اليوم الاول", photo1: "images/Screenshot (172).png", color1: Colors.white),
         Container2(day1: "اليوم الثانى", photo1: "images/Screenshot (177).png", color1: Colors.blue),
         Container2(day1: "اليوم الثالث", photo1: "images/Screenshot (172).png", color1: Colors.white),
         Container2(day1: "اليوم الرابع", photo1: "images/Screenshot (177).png", color1: Colors.blue),
        ],
      ),
    );
  }
  }


  class Container2 extends StatelessWidget{
    String? day;
    String? photo;
   Color? color;
    Container2({required String day1 , required String photo1, required Color color1}){
      day=day1;  photo=photo1;   color=color1;

    }
    @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,width: 400,color:color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Container(padding: EdgeInsets.fromLTRB(15, 5, 15, 0), child: Text(day!,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),),
        Container(height: 455,width: 500,padding: EdgeInsets.all(10),
          child:Image.asset(photo!, fit: BoxFit.cover,) ,)
      ],),
    );
  }
  }