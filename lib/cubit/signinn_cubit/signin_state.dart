abstract class SigninState{}

class signinintial extends SigninState{}
class signinloading extends SigninState{}
class signinsuccess extends SigninState{}
class signinfailure extends SigninState{
  String errormessage="";
  signinfailure({required String errormessage1 }){
    errormessage=errormessage1;
  }
}
