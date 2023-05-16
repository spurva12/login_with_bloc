import 'package:demo1/login/domain/Models/login_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{}


 class LoginInitState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoginLoadingState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoginLoadedState extends LoginState {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginErrorSate extends LoginState{
  final String error;
  LoginErrorSate({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}