import 'package:flutter/material.dart';
import 'package:mutamaruna/wedget/User.dart';
class Editeldaraga2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState =GlobalKey();
    return Scaffold(
       appBar: AppBar(title: const Text("mutamarunaaaaaaaaaaa",style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),),backgroundColor: Color.fromARGB(255, 49, 33, 109),),
    body: Form(key: formState,
      child: ListView(
      children: [
        Container(child: Text("مجموعه البابا كيرلس",style: TextStyle(fontSize: 20),),padding: EdgeInsets.all(10),alignment: Alignment.topRight, ),
     
      Container(child:TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),fillColor: Color.fromARGB(255, 231, 226, 226),filled: true,hintText: "Enter your note",hintStyle: TextStyle(fontWeight: FontWeight.w300)),
          validator: (value) {
            degree1+=int.parse(value!);
          },
          
          ),),

          Container(child: Text("مجموعه الملاك ميخائيل", style: TextStyle(fontSize: 20),),padding: EdgeInsets.all(10),alignment: Alignment.topRight,),
      Container(child:  TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),fillColor: Color.fromARGB(255, 231, 226, 226),filled: true,hintText: "Enter your note",hintStyle: TextStyle(fontWeight: FontWeight.w300)),
          validator: (value) {
            
            degree2+=int.parse(value!);
          },
          
          ),),
          Container(padding: EdgeInsets.all(10),
         child:  MaterialButton(
          child: Text("save"),
          onPressed: (){
            if (formState.currentState!.validate()){
               formState.currentState!.save();
               Navigator.of(context).pushReplacementNamed("Daragat");               }
          }, color: Colors.blue,))

    ],),
    ));
  }
  
}