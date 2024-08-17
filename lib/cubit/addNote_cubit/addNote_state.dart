abstract class AddnotesState{}
class initialState extends AddnotesState{}
class addSuccess extends AddnotesState{}
class addloading extends AddnotesState{}
class addfailure extends AddnotesState{
  String? err;
  addfailure({required String erorr}){
    err=erorr;
  }
}
class addimageSuccess extends AddnotesState{}