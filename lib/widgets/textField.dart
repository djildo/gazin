import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFromField extends StatelessWidget {
  final bool password;
  final String email;
  final IconData icon;
  final TextInputType inputType;
  final bool telefone;
  final TextEditingController controller;

  TextFromField({
    required this.email,
    required this.icon,
    required this.inputType,
    required this.password,
    required this.telefone,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
      child: Theme(
        data: ThemeData(
          hintColor: Colors.transparent,
        ),
        child: TextFormField(
          controller: controller,
          obscureText: password,
          inputFormatters: [
            if (telefone) FilteringTextInputFormatter.digitsOnly,
            if (telefone) DataInputFormatter(),
          ],
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: email,
            icon: Icon(
              icon,
              color: Colors.black38,
            ),
            labelStyle: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Sans',
              letterSpacing: 0.3,
              color: Colors.black38,
              fontWeight: FontWeight.w600,
            ),
          ),
          keyboardType: inputType,
        ),
      ),
    );
  }
}
