import 'package:flutter/material.dart';
import 'package:notegooner/utility/my_constant.dart';
import 'package:notegooner/widgets/show_form.dart';
import 'package:notegooner/widgets/show_image.dart';
import 'package:notegooner/widgets/show_text.dart';

class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newLogo(boxConstraints),
              newTitle(),
              formUser(boxConstraints),
              Container(
                margin: const EdgeInsets.only(top: 16),
                height: 40,
                width: boxConstraints.maxWidth*0.6,
                child: ShowForm(
                  hint: 'Password',
                  iconData: Icons.lock_open_outlined,
                  changeFung: (String string) {},
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        hint: 'User :',
        iconData: Icons.account_circle_outlined,
        changeFung: (String string) {},
      ),
    );
  }

  ShowText newTitle() {
    return ShowText(
      text: 'Login :',
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.25,
      child: ShowImage(),
    );
  }
}
