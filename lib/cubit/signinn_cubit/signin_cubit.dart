import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/signinn_cubit/signin_state.dart';

class SigninCubit extends Cubit<SigninState>{
  SigninCubit():super(signinintial());
  Future<void> signupUser({required String emailAddress , required String password})async{
    emit(signinloading());
    try{
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
  FirebaseAuth.instance.currentUser!.sendEmailVerification();
     emit(signinsuccess());
 } on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
   emit(signinfailure(errormessage1:  'The password provided is too weak.'));
  } else if (e.code == 'email-already-in-use') {
    emit(signinfailure(errormessage1: 'The account already exists for that email.'));
  }
  

} catch (e) {
  emit(signinfailure(errormessage1: "Somthing went wrong"));
  print("eeeeeeeeeeeeeeeeeeeeeeeeee $e");
}}
}