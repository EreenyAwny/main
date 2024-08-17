abstract class EditnoteState{}
class initialState extends EditnoteState{}
class editSuccess extends EditnoteState{}
class editloading extends EditnoteState{}
class editfailure extends EditnoteState{
  String? err;
  addfailure({required String erorr}){
    err=erorr;
  }
}
class editimageSuccess extends EditnoteState{}