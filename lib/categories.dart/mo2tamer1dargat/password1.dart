import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
class Password1 extends StatelessWidget{
  String Passwor="123456789";
  String? pass;
  GlobalKey<FormState> formState=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("Password",style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),),backgroundColor: Color.fromARGB(255, 49, 33, 109),),
    body:Form(key: formState,
    child:Column(children: [
       Container(padding: EdgeInsets.all(20),
        child:  TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),fillColor: Color.fromARGB(255, 231, 226, 226),filled: true,hintText: "Enter your note",hintStyle: TextStyle(fontWeight: FontWeight.w300)),
          validator: (value) {
            pass=value;
          },
          
          ),),
          Container(padding: EdgeInsets.all(10),
         child:  MaterialButton(
          child: Text("save"),
          onPressed: (){
            if (formState.currentState!.validate()){
               formState.currentState!.save();
               if(pass==Passwor){
               Navigator.of(context).pushReplacementNamed("Editeldaraga1"); }   
               else {
                 
                 Navigator.of(context).pushReplacementNamed("Daragatmo2tamer1");
                  alert(context, title:  Text("you entered wrong password"), );
               }
                          }
          }, color: Colors.blue,))
    ],) ,
    ) ,
    );
  }
  
}