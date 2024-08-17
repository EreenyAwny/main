import 'package:flutter/material.dart';
class Derasetketab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("🧐فتشوا الكتب", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 174, 75)),),backgroundColor: Color.fromARGB(255, 49, 33, 109),),
    body: Stack(children: [
      Container(child: Image.asset("images/Screenshot (177).png",fit: BoxFit.fill,),height: 800,width: 500,),
      Column(children: [
        Container(padding: EdgeInsets.all(10),
          child: Text("فَاذْكُرْ مِنْ أَيْنَ سَقَطْتَ وَتُبْ، وَاعْمَلِ الأَعْمَالَ الأُولَى، وَإِّلاَّ فَإِنِّي آتِيكَ عَنْ قَرِيبٍ وَأُزَحْزِحُ مَنَارَتَكَ مِنْ مَكَانِهَا، إِنْ لَمْ تَتُبْ. (رؤ 2: 5)",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),color: Colors.white,),
           
          InkWell(onTap: (){Navigator.of(context).pushNamed("Derasetketab1");},
            child:Card(
            child: ListTile(title: Text("اليوم الاول : حوش اللى وقع منك روحيا ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            subtitle: Text("بطرس و يوحنا أنا أذهب لأتصيد ( انجيل يوحنا  21 : 1 - 7) ",textAlign: TextAlign.right,),
            ),
          )),

           InkWell(child:Card(
            child: ListTile(
              title: Text("اليوم الثانى : حوش اللى وقع منك اجتماعيا ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            subtitle:Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: [ Text("١ - راحيل و ليئه ( تكوين 30 : 1 - 24 )",textAlign: TextAlign.right,),
            Text("٢ ـ راعوث و نعمه (راعوث 1 : 1- 18)",textAlign: TextAlign.right,),
            ],),), )),

            InkWell(child:Card(
            child: ListTile(
              title: Text("اليوم الثالث حوش اللى وقع منك اخلاقيا ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            subtitle:Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: [ Text("١ - خطيئة داود مع بثشبع و قتل اوريا الحثى (2صم  11 : 1 - 18 )",textAlign: TextAlign.right,),
            Text("٢ ـ  سليمان ( انحرافه نحو الوثنيَّة) ( 1مل 11 : 1 - 12 )",textAlign: TextAlign.right,),
            ],),), )),

            InkWell(child:Card(
            child: ListTile(
              title: Text("اليوم الرابع حوش اللى وقع منك ذاتيا ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            subtitle:Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: [ Text("١ - يوسف يصبح الرجل الثانى فى مصر ( تك 41 : 25 - 46 )",textAlign: TextAlign.right,),
            Text("٢ - يهوديت تخلص شعب اسرائيل (يهو 13 : 1 - 22 )",textAlign: TextAlign.right,),
            ],),), )),
      ],)
    ],),
     
    );
  }
  
}