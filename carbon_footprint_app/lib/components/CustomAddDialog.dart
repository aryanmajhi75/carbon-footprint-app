import 'package:carbon_footprint_app/constants.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class customAddDialog extends StatefulWidget {
  const customAddDialog({
    super.key,
  });

  @override
  State<customAddDialog> createState() => _customAddDialogState();
}

class _customAddDialogState extends State<customAddDialog> {
  String id = "nULL";
  String name = "nULL";
  String model = "nULL";
  String uniqueNum = "nULL";
  int yearsOld = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SimpleDialog(
      elevation: 10,
      title: const Text("Vehicle Details"),
      titlePadding: const EdgeInsets.all(5),
      titleTextStyle: const TextStyle(
        fontFamily: "Quicksand",
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      backgroundColor: DTprimary().onContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.all(10),
      children: [
        TextField(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: DTprimary().onIconCol,
              ),
            ),
            label: const Text(
              "Vehicle Name",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Quicksand',
              ),
              // style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          onChanged: (value) {
            setState(() {
              name = value;
              // username = value;
            });
          },
          keyboardType: TextInputType.name,
        ),
        Gap(screenHeight * 0.01),
        TextField(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: DTprimary().onIconCol,
              ),
            ),
            label: const Text(
              "Vehicle Model",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Quicksand',
              ),
              // style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          onChanged: (value) {
            setState(() {
              model = value;
              // username = value;
            });
          },
          keyboardType: TextInputType.name,
        ),
        Gap(screenHeight * 0.01),
        TextField(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: DTprimary().onIconCol,
              ),
            ),
            label: const Text(
              "Chassis Number",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Quicksand',
              ),
              // style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          onChanged: (value) {
            setState(() {
              uniqueNum = value;
              // username = value;
            });
          },
          keyboardType: TextInputType.name,
        ),
        Gap(screenHeight * 0.01),
        TextField(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: DTprimary().onIconCol,
              ),
            ),
            label: const Text(
              "How old is the Vehicle?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Quicksand',
              ),
              // style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          onChanged: (value) {
            setState(() {
              yearsOld = int.parse(value);
              // username = value;
            });
          },
          keyboardType: TextInputType.name,
        ),
        Gap(screenHeight * 0.01),
        IconButton(
          onPressed: () {
            id = "majhiaryan13@gmail.com";
            UserVehicleData vehicleData = UserVehicleData(
              id: id,
              name: name,
              model: model,
              chassisNum: uniqueNum,
              yearsOld: yearsOld,
            );
            insertUserVehicleData(vehicleData);
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.check_rounded,
            color: DTprimary().onIconCol,
          ),
        )
      ],
    );
  }
}
