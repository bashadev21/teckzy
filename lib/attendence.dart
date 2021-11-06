import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testdeep/controller.dart';
import 'package:get/get.dart';
import 'package:testdeep/init.dart';
import 'package:testdeep/login.dart';

class AttendenceView extends StatelessWidget {
  AttendenceView({Key? key}) : super(key: key);
  final Controller con = Get.find();
  final InitCon icon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Attendence',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                GetStorage().write('id', null);
                Get.offAll(() => Login());
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Time:' +
                  DateTime.now()
                      .toString()
                      .split(' ')[1]
                      .toString()
                      .split('.')[0]
                      .toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  con.checkin();
                },
                child: const Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Check In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  con.checkout();
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Check Out',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
