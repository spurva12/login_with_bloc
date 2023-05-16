import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable{}

class LoginMobileEvent extends LoginEvent{
  final String mobile;
  LoginMobileEvent({required this.mobile});

  @override
  // TODO: implement props
  List<Object?> get props => [mobile];
}

class LoginPasswordEvent extends LoginEvent{
  final String password;
  LoginPasswordEvent({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class LoginSubmitEvent extends LoginEvent{
  final BuildContext context;
  LoginSubmitEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];

}