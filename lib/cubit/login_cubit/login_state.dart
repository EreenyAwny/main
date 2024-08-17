abstract class LoginState{}

class loginintial extends LoginState{}
class loginloading extends LoginState{}
class loginsuccess extends LoginState{}
class loginfailure extends LoginState{
  String errormessage="";
  loginfailure({required String errormessage2 }){
    errormessage=errormessage2;
  }
}
class forgetpass extends LoginState{}
