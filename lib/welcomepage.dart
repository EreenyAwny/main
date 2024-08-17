import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Welcomepage extends StatefulWidget{
  @override
  State<Welcomepage> createState()=>_Welcomepage();
}

class _Welcomepage extends State<Welcomepage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 10,),
     body:Expanded(child:Stack(children: [

      
       Container( child: Image.asset("images/Screenshot (172).png",fit:BoxFit.fill,),height: 750,width: 400,),
     Positioned(child: MaterialButton(onPressed: (){
      if(FirebaseAuth.instance.currentUser!=null && FirebaseAuth.instance.currentUser!.emailVerified ){
        Navigator.of(context).pushReplacementNamed("Homepage");
      }
      else {Navigator.of(context).pushReplacementNamed("Loginpage");}
      
     },child: Icon(Icons.arrow_forward),color: Colors.white,),bottom: 20,left: 260,)
          
       
      ]
     ))
    );
  }
  
}