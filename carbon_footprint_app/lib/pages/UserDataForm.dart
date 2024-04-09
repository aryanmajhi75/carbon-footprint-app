import 'dart:developer';

import 'package:carbon_footprint_app/components/CustomSnackbar.dart';
import 'package:carbon_footprint_app/components/CustomTextfield.dart';
import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';
import 'package:carbon_footprint_app/dbHelper/insertData/generalUserData.dart';
import 'package:carbon_footprint_app/dbHelper/search/findUser.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserDataForm extends StatefulWidget {
  const UserDataForm({super.key});

  @override
  State<UserDataForm> createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  late TextEditingController idController = TextEditingController(text: "");
  late TextEditingController unameController = TextEditingController(text: "");
  late TextEditingController numMController = TextEditingController(text: "");
  late TextEditingController ageController = TextEditingController(text: "");

  double calculateEmission() {
    return double.parse(numMController.text) *
        105; //changes as per the record of Indian carbon emission standards
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ComponentData().defPad,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "New person?",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: DTprimary().white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Let us know u!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: DTprimary().white,
                      ),
                    ),
                  ),
                  const Divider(),
                  const Gap(5),
                  Card(
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: DTprimary().white,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    color: DTsecondary().onNavbar,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "* Allowed characters for username are a-z, A-Z, 0-9, dot(.), underscore(_) \n\n* Allow (_) and (.) in the middle of character only Numbers must not be the first character The dot (.) or underscore (_) must not be the first or last character.\n\n* The dot (.) or underscore (_) must not appear consecutively",
                        style: TextStyle(
                          color: DTprimary().onIconCol,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Gap(5),
                  const Divider(),
                  const Gap(5),
                  CustomTextfield(
                    type: "username",
                    label: "User Name",
                    icon: const Icon(Icons.person_2_rounded),
                    textController: unameController,
                  ),
                  const Gap(15),
                  CustomTextfield(
                    type: "email",
                    label: "Email",
                    icon: const Icon(Icons.email_rounded),
                    textController: idController,
                  ),
                  const Gap(15),
                  CustomTextfield(
                    type: "age",
                    label: "Age",
                    icon: const Icon(Icons.numbers_rounded),
                    textController: ageController,
                  ),
                  const Gap(15),
                  CustomTextfield(
                    type: "numMembers",
                    label: "Number of Members",
                    icon: const Icon(Icons.numbers_rounded),
                    textController: numMController,
                  ),
                  const Gap(25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          fixedSize: MaterialStatePropertyAll(
                            Size(
                              deviceWidth * 0.4,
                              deviceHeight * 0.1,
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                          elevation: const MaterialStatePropertyAll(10),
                          animationDuration: const Duration(seconds: 2),
                          backgroundColor: MaterialStatePropertyAll(
                            DTprimary().onIconCol,
                          ),
                        ),
                        onPressed: () async {
                          var present =
                              await findUserGeneralData(unameController.text);
                          if (present) {
                            var box = Hive.box('authData');
                            box.put('id', idController.text);
                            CustomSnackbar.show(
                              context,
                              "user logged in : ${unameController.text}",
                              DTprimary().onIconCol,
                              "assets/icons/success.png",
                              deviceWidth,
                            );
                            setState(() {
                              idPresent = true;
                            });
                            Navigator.pop(context);
                          } else {
                            UserGeneralData data = UserGeneralData(
                              id: idController.text,
                              age: int.parse(ageController.text),
                              name: unameController.text,
                              numberOfMembers: int.parse(numMController.text),
                              emission: calculateEmission(),
                            );
                            insertUserData(data);
                            log("email          : ${idController.text}");
                            log("age            : ${ageController.text}");
                            log("num of members : ${numMController.text}");
                            log("username       : ${unameController.text}");
                            var box = Hive.box('authData');
                            box.put('id', idController.text);
                            log(box.get("id"));
                            setState(() {
                              idPresent = true;
                            });
                            CustomSnackbar.show(
                              context,
                              "user registered: ${idController.text}",
                              DTprimary().onIconCol,
                              "assets/icons/success.png",
                              deviceWidth,
                            );
                          }
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: DTprimary().onBody,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var present =
                              await findUserGeneralData(idController.text);
                          if (present) {
                            var box = Hive.box('authData');
                            box.put('id', idController.text);
                            CustomSnackbar.show(
                              context,
                              "welcome user : ${idController.text}",
                              DTprimary().onIconCol,
                              "assets/icons/success.png",
                              deviceWidth,
                            );
                            setState(() {
                              idPresent = true;
                            });
                            Navigator.pop(context);
                          } else {
                            CustomSnackbar.show(
                              context,
                              "user not found!",
                              DTprimary().error,
                              "assets/icons/warning.png",
                              deviceWidth,
                            );
                          }
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                color: DTprimary().onIconCol,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          fixedSize: MaterialStatePropertyAll(
                            Size(
                              deviceWidth * 0.4,
                              deviceHeight * 0.1,
                            ),
                          ),
                          alignment: Alignment.center,
                          elevation: const MaterialStatePropertyAll(10),
                          animationDuration: const Duration(seconds: 2),
                          backgroundColor: MaterialStatePropertyAll(
                            DTprimary().onBody,
                          ),
                        ),
                        child: Text(
                          "member?\nLogin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: DTprimary().white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
