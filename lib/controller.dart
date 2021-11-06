import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testdeep/init.dart';

import 'attendence.dart';
import 'base.dart';
import 'package:get/get.dart';

import 'endpoints.dart';

class Controller extends GetxController with BaseController {
  final InitCon con = Get.find();
  var showpass = true.obs;
  void login(usernmae, password) async {
    showLoading();

    var body = {
      'username': usernmae,
      'password': password,
    };
    var response = await BaseClient()
        .post(MAPI().baseurl, MAPI().login, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print(data.toString());

    if (data[0]['status'] == true) {
      hideLoading();
      print(data[0]['res'][0]['login_id'].toString());
      con.setid(data[0]['res'][0]['login_id']);
      Fluttertoast.showToast(
        msg: data[0]['msg'],
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Get.offAll(() => AttendenceView());
    } else {
      hideLoading();
      Fluttertoast.showToast(
        msg: data[0]['msg'],
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void checkin() async {
    showLoading();

    var body = {
      'login_id': con.id.toString(),
      'intime': DateTime.now()
          .toString()
          .split(' ')[1]
          .toString()
          .split('.')[0]
          .toString(),
      'type': 'intime',
    };
    var response = await BaseClient()
        .post(MAPI().baseurl, MAPI().attendance, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print(data.toString());

    if (data[0]['status'] == true) {
      hideLoading();

      Fluttertoast.showToast(
        msg: data[0]['msg'],
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      // Get.offAll(() => AttendenceView());
    } else {
      hideLoading();
      Fluttertoast.showToast(
        msg: data[0]['msg'],
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void checkout() async {
    showLoading();

    var body = {
      'login_id': con.id.toString(),
      'outtime': DateTime.now()
          .toString()
          .split(' ')[1]
          .toString()
          .split('.')[0]
          .toString(),
      'type': 'outtime',
    };
    var response = await BaseClient()
        .post(MAPI().baseurl, MAPI().attendance, body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    print(data.toString());

    if (data[0]['status'] == true) {
      hideLoading();

      Fluttertoast.showToast(
        msg: data[0]['msg'],
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      // Get.offAll(() => AttendenceView());
    } else {
      hideLoading();
      Fluttertoast.showToast(
        msg: data[0]['msg'],
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
