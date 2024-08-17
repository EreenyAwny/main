abstract class AddnotesState {}

class InitialState extends AddnotesState {}

class AddSuccess extends AddnotesState {}

class Addloading extends AddnotesState {}

class Addfailure extends AddnotesState {
  final String erorr;
  Addfailure({required this.erorr});
}

class AddimageSuccess extends AddnotesState {}

class Loadingstate extends AddnotesState {}
