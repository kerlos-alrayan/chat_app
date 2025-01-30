import 'package:chat_app/presentation/screens/home_screen.dart';
import 'package:chat_app/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.data != null){
            print('You Already Login');
            return HomeScreen();
          }else{
            print('You Don\'t Login');
            return LoginScreen();
          }
        }
    );
  }
}
