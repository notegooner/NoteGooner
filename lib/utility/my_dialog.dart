import 'package:flutter/material.dart';
import 'package:notegooner/utility/my_constant.dart';
import 'package:notegooner/widgets/show_image.dart';
import 'package:notegooner/widgets/show_text.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> normalDialog({
    required String title,
    required String subtitle,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: const SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowText(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(text: subtitle),
        ),
      ),
    );
  }
}
