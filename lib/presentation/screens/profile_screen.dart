import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2.0),
                  blurRadius: 4.0,
                )
              ]),
              child: AppBar(
                leading: Icon(Icons.close),
                title: Center(
                  child: Text(
                    'Profile Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.camera_alt_outlined,),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/image/my_image3.png',),
                  ),
                ],
              ),
            ),
            Text('Edite'),
            SizedBox(
              height: 20,
            ),
            CustomTextField(hintText: 'Name', labelText: 'Name'),
            CustomTextField(
              hintText: 'Gender',
              labelText: 'Gender',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
            ),
            CustomTextField(hintText: 'Gender', labelText: 'Gender'),
            CustomTextField(hintText: 'Email', labelText: 'Email'),
            CustomTextField(hintText: 'Password', labelText: 'Password'),
            CustomTextField(
                hintText: 'Phone Number', labelText: 'Phone Number'),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChange,
    this.controller,
    this.borderColor = Colors.grey,
    required this.labelText,
    this.prefixIcon,
    this.prefixIconColor,
    this.validator,
    this.isPassword = false,
    this.suffixIcon,
  }); // Added borderColor parameter
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final Color borderColor; // Added borderColor property
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final defaultPadding = const EdgeInsets.symmetric(horizontal: 0);
    return Padding(
      padding: defaultPadding,
      child: TextFormField(
        obscureText: widget.isPassword ? _obscureText : false,
        controller: widget.controller,
        onChanged: widget.onChange,
        onSaved: widget.onSaved,
        validator: widget.validator,
        cursorColor: Colors.black,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          filled: true,
          fillColor: Colors.white,
          labelText: widget.labelText, // Hint integrated into the border
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black),
          border: buildBorder(widget.borderColor),
          enabledBorder: buildBorder(widget.borderColor),
          focusedBorder: buildBorder(const Color(0xFF478ecc)),
          prefixIcon: widget.prefixIcon,
          prefixIconColor: widget.prefixIconColor,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color), // Use color parameter
    );
  }
}
