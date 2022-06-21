import 'package:flutter/material.dart';

class ShowForm extends StatelessWidget {
  const ShowForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 16,),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
        ),
    );
  }
}
