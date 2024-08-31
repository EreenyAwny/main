import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mutamaruna/features/auth_view/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:mutamaruna/features/auth_view/presentation/views/widgets/auth_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: AuthBody(controller: controller),
          ),
        ),
      ),
    );
  }
}
