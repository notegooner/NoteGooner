// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:notegooner/utility/my_constant.dart';
import 'package:notegooner/utility/my_dialog.dart';
import 'package:notegooner/widgets/show_button.dart';
import 'package:notegooner/widgets/show_form.dart';
import 'package:notegooner/widgets/show_image.dart';
import 'package:notegooner/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusScopeNode());
          },
          child: Container(
            decoration: MyConstant().bgBox(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newLogo(boxConstraints),
                  newTitle(boxConstraints),
                  formUser(boxConstraints),
                  formPassword(boxConstraints),
                  buttonLogin(boxConstraints),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Container buttonLogin(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * 0.4,
      child: ShowButtom(
        label: 'Login',
        pressFunc: () {
          print('user= $user, password = $password');

          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            print('Have Space');
            MyDialog(context: context).normalDialog(
                title: "Have Space", subtitle: 'Please Fill Blanck');
          } else {
            print('No Space');
            processChecklogin();
          }
        },
      ),
    );
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        redEyeFunc: () {
          setState(() {
            redEye = !redEye;
          });
        },
        obSecu: redEye,
        hint: 'Password :',
        iconData: Icons.lock_open_outlined,
        changeFung: (String string) {
          password = string.trim();
        },
      ),
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
        changeFung: (String string) {
          user = string.trim();
        },
      ),
    );
  }

  SizedBox newTitle(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          ShowText(
            text: 'Login :',
            textStyle: MyConstant().h1Style(),
          ),
        ],
      ),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          SizedBox(
            width: boxConstraints.maxWidth * 0.25,
            child: ShowImage(),
          ),
        ],
      ),
    );
  }
  
  void processChecklogin() {}
}
