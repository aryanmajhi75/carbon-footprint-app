import 'dart:ffi';

class UserGeneralData {
  String id;
  String name;
  int age;
  int numberOfMembers;

  UserGeneralData({
    required this.id,
    required this.name,
    required this.age,
    required this.numberOfMembers,
  });

  factory UserGeneralData.fromJson(Map<String, dynamic> json) {
    return UserGeneralData(
      id: json['id'],
      name: json['user_name'],
      age: json['user_age'],
      numberOfMembers: json['number_of_members'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': name,
      'user_age': age,
      'number_of_members': numberOfMembers,
    };
  }
  // addDetails(
  //     String userId, String inputName, int inputAge, int inputNumberOfMembers) {
  //   id = userId;
  //   age = inputAge;
  //   name = inputName;
  //   numberOfMembers = inputNumberOfMembers;
  // }
}

class UserElectricityData {
  String id;
  String month;
  Float bill;

  UserElectricityData({
    required this.id,
    required this.month,
    required this.bill,
  });

  // addElectricityBill(String inputId, String inputMonth, Float inputBill) {
  //   id = inputId;
  //   month = inputMonth;
  //   bill = inputBill;
  // }
}

class UserDevicesData {
  String id;
  String name;
  String mac;

  UserDevicesData({
    required this.id,
    required this.name,
    required this.mac,
  });

  //majhiaryan13@gmail.com
  // ->redmi note 8 pro
  // ->20.ee.2..

  // addDevice(String inputId, String inputName, String inputMac) {
  //   id = inputId;
  //   name = inputName;
  //   mac = inputMac;
  // }
}

class UserBodySensorData {
  String id;
  Float walking;
  Float running;
  Float vehicle;
  int hour;

  UserBodySensorData({
    required this.id,
    required this.walking,
    required this.running,
    required this.vehicle,
    required this.hour,
  });

  addBodySensor(String inputId, Float inputWalking, Float inputRunning,
      Float inputVehicle, int hour) {
    id = inputId;
    walking = inputWalking;
    running = inputRunning;
    vehicle = inputVehicle;
  }
}

class UserLocationData {
  String id;
  String location;
  Float aqi;

  UserLocationData({
    required this.id,
    required this.location,
    required this.aqi,
  });

  addlocation(String inputId, String inputLocation, Float inputAqi) {
    id = inputId;
    location = inputLocation;
    aqi = inputAqi;
  }
}

class UserVehicleData {
  String id;
  String name;
  String model;
  String chassisNum;
  int yearsOld;

  UserVehicleData({
    required this.id,
    required this.name,
    required this.model,
    required this.chassisNum,
    required this.yearsOld,
  });

  factory UserVehicleData.fromJson(Map<String, dynamic> json) {
    return UserVehicleData(
      id: json['id'],
      name: json['vehicle_name'],
      model: json['model_name'],
      chassisNum: json['chassis_number'],
      yearsOld: json['years_old'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle_name': name,
      'model_name': model,
      'chassis_number': chassisNum,
      'years_old': yearsOld,
    };
  }

  // addVehicleData(String inputId, String inputName, String inputModel,
  //     String inputChassisNum, int inputYearsOld) {
  //   id = inputId;
  //   name = inputName;
  //   model = inputModel;
  //   chassisNum = inputChassisNum;
  //   yearsOld = inputYearsOld;
  // }
}
