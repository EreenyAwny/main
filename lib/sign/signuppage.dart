import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/signinn_cubit/signin_cubit.dart';
import 'package:mutamaruna/cubit/signinn_cubit/signin_state.dart';


class Signuppage extends  StatelessWidget{
  GlobalKey<FormState> formState =GlobalKey();
String? usernamee;
String? password1;
String? password; 
String? emailAddress;
bool correct=false;
bool isloading=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit,SigninState>(
      listener: (context, state) {
        if(state is signinloading){
          isloading= true;
        }
        else if(state is signinsuccess){
          isloading=false;
          Navigator.of(context).pushReplacementNamed("Loginpage");
          alert(context, title:  Text("go to Gmail to verify your email"));}
          
        else if (state is signinfailure) {
          isloading=false;
          alert(context, title:  Text(state.errormessage)); }
      },
     builder: (context, state) =>Scaffold(
      appBar: AppBar(title: Text(""),backgroundColor: Colors.white,toolbarHeight:50,),
  
      body:isloading==true?Center(child:  CircularProgressIndicator()):
      Container(padding:EdgeInsets.fromLTRB(8, 0, 0, 8),
      height: 800,width: 400,
     child:  ListView(padding: EdgeInsets.fromLTRB(1, 10, 1, 10),
      children: [
       Positioned(child: Image.asset("images/Screenshot (172).png", height: 80,width: 80,)),
       Container(height: 60,width: 300,padding:EdgeInsets.fromLTRB(15, 12, 1, 10),child:  Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
       Container(height: 40,width: 300,padding:EdgeInsets.fromLTRB(15, 0, 1, 5),child:  Text("Enter your personal information",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 15),),),

Container(height: 30,width: 300,padding:EdgeInsets.fromLTRB(15, 1, 1, 1),child:  Text("Username",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),),


Container(height: 500,width: 400,child:Form(
          key: formState,
        child: Column(
          children: [
        Container(height:50,width: 320,decoration: BoxDecoration(color: Color.fromARGB(255, 241, 230, 230),borderRadius: BorderRadius.circular(30)),child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ),
          validator: (value1) {
            usernamee=value1;
          },
        ),),

        Container(height: 40,width: 300,padding:EdgeInsets.fromLTRB(0, 10, 1, 1),child:  Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),),
        Container(height:50,width: 320,decoration: BoxDecoration(color: Color.fromARGB(255, 241, 230, 230),borderRadius: BorderRadius.circular(30)),child: TextFormField(
         decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
         ),
         validator: (value2) {
           emailAddress=value2;
         },
        ),),
        Container(height: 55,width: 300,padding:EdgeInsets.fromLTRB(0, 20, 1, 10),child:  Text("Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),),
        Container(height:50,width: 320,decoration: BoxDecoration(color: Color.fromARGB(255, 241, 230, 230),borderRadius: BorderRadius.circular(30)),child: TextFormField(
         decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
         ),
         validator: (value3) {
           password1=value3;
         },
        ),),


Container(height: 40,width: 300,padding:EdgeInsets.fromLTRB(0, 10, 1, 1),child:  Text("Conferm password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),),
        Container(height:60,width: 320,decoration: BoxDecoration(color: Color.fromARGB(255, 241, 230, 230),borderRadius: BorderRadius.circular(30)),child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
            ),
            
         validator: (valu4){
              if(valu4==password1){
              password=valu4;
            }
            else {
            return "check your entered password";}
          },
        
        ),),
Container(height: 20,),
        Container(height: 50,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(30)),child: MaterialButton(onPressed:(){
              if (formState.currentState!.validate()){
               formState.currentState!.save();
               BlocProvider.of<SigninCubit>(context).signupUser(emailAddress: emailAddress!, password: password!);
               
               
               };},
child: Text("Login"),),),])))
        
      ]))
    ));
  }
  
}