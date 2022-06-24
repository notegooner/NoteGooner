// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notegooner/models/job_model.dart';
import 'package:notegooner/states/detail.dart';
import 'package:notegooner/utility/my_calculate.dart';
import 'package:notegooner/utility/my_constant.dart';
import 'package:notegooner/widgets/show_progress.dart';
import 'package:notegooner/widgets/show_text.dart';

class NonFinishJob extends StatefulWidget {
  final List<String> dataUserLogins;
  const NonFinishJob({
    Key? key,
    required this.dataUserLogins,
  }) : super(key: key);

  @override
  State<NonFinishJob> createState() => _NonFinishJobState();
}

class _NonFinishJobState extends State<NonFinishJob> {
  var dataUserLogin = <String>[];
  var jobModels = <JobModel>[];

  @override
  @override
  void initState() {
    super.initState();
    dataUserLogin = widget.dataUserLogins;
    readDataJob();
  }

  Future<void> readDataJob() async {
    if (jobModels.isNotEmpty) {
      jobModels.clear();
    }

    String idOfficer = dataUserLogin[0];
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereIdOfficerNote.php?isAdd=true&idOfficer=$idOfficer';

    await Dio().get(path).then((value) {
      print('value ===>> $value');

      var result = json.decode(value.data);
      for (var element in result) {
        JobModel jobModel = JobModel.fromMap(element);
        print('job ===> ${jobModel.job}');

        if (jobModel.status == 'start') {
          jobModels.add(jobModel);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          showTitle(head: 'ชื่อพนักงาน :', value: dataUserLogin[1]),
          showTitle(head: 'ตำแหน่ง :', value: dataUserLogin[2]),
          jobModels.isEmpty
              ? const ShowProgess()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: jobModels.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Detail(jobModel: jobModels[index]),
                          )).then((value) {
                        readDataJob();
                      });
                    },
                    child: showTitle(
                      head: 'job :',
                      value: jobModels[index].job,
                      detail:
                          MyCalculate().cutWord(word: jobModels[index].detail),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Card showTitle(
      {required String head, required String value, String? detail}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ShowText(
                    text: head,
                    textStyle: MyConstant().h4Style(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ShowText(
                    text: value,
                    textStyle: MyConstant().h4Style(),
                  ),
                ),
              ],
            ),
            detail == null
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ShowText(
                        text: detail,
                        textStyle: MyConstant().h5Style(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
