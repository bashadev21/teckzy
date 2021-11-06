import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:testdeep/controller.dart';

class Login extends StatelessWidget {
  final Controller auth = Get.find();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController customerid = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Get.theme.accentColor,
          Get.theme.primaryColor,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            // Row(
            //   children: [
            //     IconButton(
            //         onPressed: () {
            //           Get.back();
            //         },
            //         icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
            //     Text(
            //       'back'.tr,
            //       style: TextStyle(color: Colors.white, fontSize: 18),
            //     )
            //   ],
            // ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Login".tr,
                      style: Get.textTheme.headline2!
                          .copyWith(color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome back".tr,
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.sp,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.sp),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Get.theme.accentColor.withOpacity(0.18),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]!))),
                                child: TextField(
                                  controller: customerid,
                                  decoration: InputDecoration(
                                      counterText: '',
                                      hintText: "Username".tr,
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.sp),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]!))),
                                  child: Obx(
                                    () => TextField(
                                      obscureText: auth.showpass.value,
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          counterText: '',
                                          hintText: "Password".tr,
                                          suffixIcon: IconButton(
                                            icon: auth.showpass.value
                                                ? Icon(
                                                    Icons.visibility,
                                                    color: Colors.grey[400],
                                                  )
                                                : Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.grey[400],
                                                  ),
                                            onPressed: () {
                                              auth.showpass.toggle();
                                            },
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.sp),
                                          border: InputBorder.none),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.sp,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: CupertinoButton(
                                  color: Get.theme.primaryColor,
                                  onPressed: () {
                                    if (customerid.text.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: 'Enter user ID',
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                      );
                                    } else if (passwordController
                                        .text.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: 'Enter Password',
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                      );
                                      // auth.customerlogin(customerid.text);
                                    } else {
                                      auth.login(
                                          customerid.text.trim().toString(),
                                          passwordController.text
                                              .trim()
                                              .toString());
                                    }
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
