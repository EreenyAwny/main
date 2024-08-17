import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
 LoginCubit():super(loginintial());
  Future<void> userLogin({required String emailAddress, required String passsword })async{
    emit(loginloading());
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password:  passsword
  );
  if(FirebaseAuth.instance.currentUser!.emailVerified){
    emit(loginsuccess());
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    emit(loginfailure(errormessage2:'No user found for that email.'));
  } else if (e.code == 'wrong-password') {
    emit(loginfailure(errormessage2:'Wrong password provided for that user.'));
  }
}catch(ex){
  print("ttttttttttttttttttttttttttt $ex");
}
  }

  Future<void> resetpassword({required String emailAddress})async{
    emit(loginloading());
    print(emailAddress);
     await FirebaseAuth.instance
    .sendPasswordResetEmail(email: emailAddress);
    emit(forgetpass());
  }
  
  }