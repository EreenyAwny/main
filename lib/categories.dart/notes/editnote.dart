import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/editnote/editnote_cubit.dart';
import 'package:mutamaruna/cubit/editnote/editnote_state.dart';
class Editnote extends StatelessWidget{
   GlobalKey<FormState> formState =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditnoteCubit, EditnoteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Edit note",style: TextStyle(color: Color.fromARGB(255, 255, 174, 75)),),backgroundColor: Color.fromARGB(255, 49, 33, 109),),
     body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Form(key: formState,
          child: Container(width: 350,padding: EdgeInsets.fromLTRB(30, 10,10, 10),
          child: TextFormField(
         // initialValue: oldnote,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),fillColor: Color.fromARGB(255, 231, 226, 226),filled: true,hintText: "Enter note",hintStyle: TextStyle(fontWeight: FontWeight.w300)),
          validator: (value) {
           // newnamee=value;
          },
          
          ),)),

          MaterialButton(onPressed: ()async{
          
            },
             child: Text("new photo"),color: Colors.red,
             ),
          MaterialButton(onPressed: (){
           
               if (formState.currentState!.validate()){
               formState.currentState!.save();}
            //editnote();
            
             // print(oldnote);
             // print("newwwwwwww    $newnamee");
              
              Navigator.of(context).pushNamedAndRemoveUntil("Notes",(route)=>false);
           
           
          },color: Colors.blue,shape:Border.all() ,child: const Text("Save"),)
      ],),
        );
      },
    );
  }
}