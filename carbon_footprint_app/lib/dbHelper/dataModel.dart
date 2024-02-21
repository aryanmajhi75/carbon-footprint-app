import 'dart:ffi';

class UserGeneralData {
  String name;
  int age;
  int numberOfMembers;

  UserGeneralData({
    required this.name,
    required this.age,
    required this.numberOfMembers,
  });

  addDetails(inputName, inputAge, inputNumberOfMembers) {
    age = inputAge;
    name = inputName;
    numberOfMembers = inputNumberOfMembers;
  }
}

class UserElectricityData {
  String month;
  Float bill;

  UserElectricityData({
    required this.month,
    required this.bill,
  });

  addElectricityBill(inputMonth, inputBill) {
    month = inputMonth;
    bill = inputBill;
  }
}

class UserDevicesData {
  String name;
  String mac;

  UserDevicesData({
    required this.name,
    required this.mac,
  });
  addDevice(inputName, inputMac) {
    name = inputName;
    mac = inputMac;
  }
}

class UserBodySensorData {
  Float walking;
  Float running;
  Float vehicle;
  int hour;

  UserBodySensorData({
    required this.walking,
    required this.running,
    required this.vehicle,
    required this.hour,
  });

  addBodySensor(inputWalking, inputRunning, inputVehicle, int hour) {
    walking = inputWalking;
    running = inputRunning;
    vehicle = inputVehicle;
  }
}

class UserLocationData {
  String location;
  Float aqi;

  UserLocationData({required this.location, required this.aqi});

  addlocation(inputLocation) {
    location = inputLocation;
  }
}

class UserVehicleData {
  String name;
  String model;
  String chassisNum;
  int yearsOld;

  UserVehicleData({
    required this.name,
    required this.model,
    required this.chassisNum,
    required this.yearsOld,
  });

  addVehicleData(String inputName, String inputModel, String inputChassisNum,
      int inputYearsOld) {
    name = inputName;
    model = inputModel;
    chassisNum = inputChassisNum;
    yearsOld = inputYearsOld;
  }
}
