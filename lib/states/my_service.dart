import 'package:flutter/material.dart';
import 'package:notegooner/utility/my_constant.dart';
import 'package:notegooner/utility/my_dialog.dart';
import 'package:notegooner/widgets/show_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends StatelessWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: MyConstant.dark,
        backgroundColor: Colors.white,
        actions: [
          ShowIconButton(
            iconData: Icons.logout_outlined,
            pressFunc: () {
              MyDialog(context: context).normalDialog(
                  pressFunc: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.clear().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/authen', (route) => false);
                    });
                  },
                  label: 'SignOut',
                  title: 'Sign Out ?',
                  subtitle: 'Please Confirm Signout');
            },
          )
        ],
      ),
    );
  }
}
