import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState>{
  LogoutCubit() : super(LogoutInitial());
  Future<void> signOut() async {
    emit(LogoutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(LogoutSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LogoutError(e.message ?? "This is error when you logout"));
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}
