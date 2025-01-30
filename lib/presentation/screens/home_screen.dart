import 'package:chat_app/cubits/logout_cubit/logout_cubit.dart';
import 'package:chat_app/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logout Success'),
                ),
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
              );
            } else if (state is LogoutError) {

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is LogoutLoading) {
              return CircularProgressIndicator();
            }
            return SizedBox(
              width: 120,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.read<LogoutCubit>().signOut();
                },
                child: Text('LOGOUT'),
              ),
            );
          },
        ),
      ),
    );
  }
}
