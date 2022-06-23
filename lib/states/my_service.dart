import 'package:flutter/material.dart';
import 'package:notegooner/bodys/finish_job.dart';
import 'package:notegooner/bodys/non_finish_job.dart';
import 'package:notegooner/utility/my_constant.dart';
import 'package:notegooner/utility/my_dialog.dart';
import 'package:notegooner/widgets/show_icon_button.dart';
import 'package:notegooner/widgets/show_progress.dart';
import 'package:notegooner/widgets/show_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  var titles = <String>[
    'Non Finish',
    'Finish',
  ];
  var iconDatas = <IconData>[
    Icons.lens_outlined,
    Icons.task_alt,
  ];
  var widgets = <Widget>[];
  var bottonNavigators = <BottomNavigationBarItem>[];
  int indexbodys = 0;

  @override
  void initState() {
    super.initState();
    createNavBar();
    processFindUserLogin();
  }

  Future<void> processFindUserLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var dataLogins = preferences.getStringList('data');
    print('dataLogins ==> $dataLogins');
    widgets.add(NonFinishJob(dataUserLogins: dataLogins!));
    widgets.add(FinishJob());
    setState(() {});
  }

  void createNavBar() {
    for (var i = 0; i < titles.length; i++) {
      bottonNavigators.add(
        BottomNavigationBarItem(
          label: titles[i],
          icon: Icon(
            iconDatas[i],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppBar(context),
      body: widgets.isEmpty ? const ShowProgess() : widgets[indexbodys],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexbodys,
        items: bottonNavigators,
        onTap: (value) {
          setState(() {
            indexbodys = value;
          });
        },
      ),
    );
  }

  AppBar newAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: ShowText(
        text: titles[indexbodys],
        textStyle: MyConstant().h4Style(),
      ),
      elevation: 0,
      foregroundColor: MyConstant.grey,
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
    );
  }
}
