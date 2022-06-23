import 'package:flutter/material.dart';
import 'package:notegooner/utility/my_constant.dart';
import 'package:notegooner/widgets/show_image.dart';
import 'package:notegooner/widgets/show_text.dart';
import 'package:notegooner/widgets/show_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> normalDialog({
    required String title,
    required String subtitle,
    String? label,
    Function()? pressFunc,
    String? label2,
    Function()? pressFunc2,
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
        actions: [
          pressFunc == null
              ? ShowTextButton(
                  label: 'OK',
                  pressFunc: () {
                    Navigator.pop(context);
                  })
              : ShowTextButton(label: label!, pressFunc: pressFunc),
          pressFunc2 == null
              ? const SizedBox()
              : ShowTextButton(label: label2!, pressFunc: pressFunc2),
        ],
      ),
    );
  }
}
