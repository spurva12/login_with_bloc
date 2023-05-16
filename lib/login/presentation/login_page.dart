import 'package:demo1/login/domain/bloc/login_event.dart';
import 'package:demo1/login/domain/bloc/login_state.dart';
import 'package:demo1/login/helper/server.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = context.read<LoginBloc>();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginErrorSate) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              shrinkWrap: false,
              children: [
                const SizedBox(height: 20,),
                TextField(
                  keyboardType:TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter Mobile No."),
                    hintText: "Enter Mobile No.",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.green),
                    ),
                  ),
                  onChanged: (value) =>
                      loginBloc.add(LoginMobileEvent(mobile: value)),
                ),
                const SizedBox(height: 20,),
                TextField(
                  keyboardType:TextInputType.visiblePassword,
                  decoration: const InputDecoration(

                    label: Text("Enter Password."),
                    hintText: "Enter Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.green),
                    ),
                  ),
                  onChanged: (value) =>
                      loginBloc.add(LoginPasswordEvent(password: value)),
                ),
                const SizedBox(height: 20,),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return TextButton(onPressed: () {
                      loginBloc.add(LoginSubmitEvent(context: context));
                    }, child: const Text("Login"));
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}
