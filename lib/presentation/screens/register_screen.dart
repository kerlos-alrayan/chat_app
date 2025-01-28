import 'package:chat_app/presentation/screens/home_screen.dart';
import 'package:chat_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/register_cubit/register_cubit.dart';
import '../login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordObscure = true;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Register Success'),
            ),
          );
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route route) => false);
        } else if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Register Error'),
            ),
          );
        }
        ;
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Welcome Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'REGISTER',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              // Sign In Text
                              Text(
                                'Register now to browse out hot offer',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          // Email Box
                          CustomTextField(
                            controller: emailcontroller,
                            hintText: 'Your Email',
                            labelText: 'Your Email',
                            validator: (String? text) {
                              if (text!.isEmpty) {
                                return 'Your Email cannot be empty!';
                              } else if (!text.contains('@gmail.com')) {
                                return 'Your email is incorrect!';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          // Password Box
                          CustomTextField(
                            controller: passwordcontroller,
                            hintText: 'Password',
                            labelText: 'Password',
                            validator: (String? pass) {
                              if (pass!.isEmpty) {
                                return 'Your Password cannot br empty';
                              } else if (pass.length <= 7) {
                                return 'Your Password is Low';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Icon(
                              Icons.lock_outline_sharp,
                              color: Colors.grey,
                            ),
                            isPassword: isPasswordObscure,
                          ),
                          // Register Button
                          state is RegisterLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.all(16),
                                  color: Colors.blue,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                            (route) => false);
                                        context.read<RegisterCubit>().register(
                                            emailcontroller.text,
                                            passwordcontroller.text);
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'REGISTER',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                          // Register Button
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'You have a account? ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Colors.blue),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
