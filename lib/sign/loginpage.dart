import 'package:alert_dialog/alert_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/login_cubit/login_cubit.dart';
import 'package:mutamaruna/cubit/login_cubit/login_state.dart';

class Loginpage extends StatelessWidget{
  bool isloading=false;
  String? emailAddress;
  String? passsword;
  bool hide=true;
  GlobalKey<FormState> formState =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state) {
        if(state is loginloading){
          isloading= true;
        }
        else if(state is loginsuccess){
          isloading=false;
          Navigator.of(context).pushReplacementNamed("Homepage");
        }
        else if (state is loginfailure) {
          isloading=false;
          alert(context, title:  Text(state.errormessage),);
        }
        else if (state is forgetpass){
           isloading=false;
            alert(context, title:  Text("go to Gmail to reset password"),);
        }
      },
     builder: (context, state) =>Scaffold(
     appBar: AppBar(title: Text(""),backgroundColor: Colors.white,toolbarHeight:30,),
  
      body:isloading==true?Center(child: CircularProgressIndicator(),) : Container(padding:EdgeInsets.fromLTRB(8, 0, 0, 8),
      height: 800,width: 400,
     child:  ListView(
      children: [
        Center(child:Container(
              padding: EdgeInsets.all(10),
              width: 100, height: 100,
              child: ClipRRect(borderRadius:BorderRadius.circular(70) ,child: Image.asset("images/Screenshot (172).png" , fit: BoxFit.cover,),
            )),),
       Container(height: 60,width: 300,padding:const EdgeInsets.fromLTRB(15, 12, 1, 10),child:  const Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
       Container(height: 40,width: 300,padding:const EdgeInsets.fromLTRB(15, 0, 1, 5),child:  const Text("Login to continue using the app",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 15),),),

Container(height: 200,width: 400,child:Form(
          key: formState,
        child: Column(
          children: [

        Container(height: 30,width: 300,padding:EdgeInsets.fromLTRB(15, 1, 1, 1),child:  const Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),),


        Container(height:50,width: 300,child: TextFormField(
          decoration: InputDecoration(hintText: "Enter your email",
          filled: true,
          fillColor:Color.fromARGB(255, 210, 199, 199) ,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
         ),
         validator: (value1) {
           emailAddress=value1;
         },
          ),),


        Container(height: 55,width: 300,padding:EdgeInsets.fromLTRB(15, 20, 1, 10),child:  Text("Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),),


        Container(height:50,width: 300,child: TextFormField(decoration: InputDecoration(hintText: "Enter Password",
        filled: true,
        fillColor:Color.fromARGB(255, 210, 199, 199) ,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
        obscureText: hide,
        validator: (value2) {
          passsword=value2;
        },
         ),)]))),

        Container(alignment: Alignment.bottomRight,child: MaterialButton(onPressed: ()async{
              if (formState.currentState!.validate()){
               formState.currentState!.save();
               AwesomeDialog(
            context: context,
            animType: AnimType.rightSlide,
            desc: "Are you sure you want to reset password ?",
            btnOkText: "Yes",
            btnCancelText: "Cancel",
            btnCancelOnPress: (){},
            btnOkOnPress: () {
                 
  if(emailAddress==""){ alert(context, title:  Text("please enter your email"),);}

else{ BlocProvider.of<LoginCubit>(context).resetpassword(emailAddress: emailAddress!);
    }
            },
            ).show();
   } },child:Text("Forgot Password?") ,),),


        Container(decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(30)),child: MaterialButton(onPressed: ()async{
              if (formState.currentState!.validate()){
               formState.currentState!.save();
if(emailAddress==""){alert(context, title:  Text("please enter your email"));}

else if (passsword==""){alert(context, title:  Text("please enter your password"));}

else{ BlocProvider.of<LoginCubit>(context).userLogin(emailAddress: emailAddress!, passsword: passsword!);}
               }
           },child: Text("Login"),),),

        Container(height: 20,width: 500,),
       

  Container(height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Don't have an account?"),
   MaterialButton(onPressed: (){ 
    Navigator.of(context).pushReplacementNamed("Signuppage");
   },
   
    child: Text("Register",style: TextStyle(color: Colors.blue),),)],),)

      ],))
    ));
  }
}


