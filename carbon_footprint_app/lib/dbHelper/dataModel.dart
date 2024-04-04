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
}

class UserElectricityData {
  String id;
  List<String> month;
  List<Float> bill;

  UserElectricityData({
    required this.id,
    required this.month,
    required this.bill,
  });

  factory UserElectricityData.fromJson(Map<String, dynamic> json) {
    var monthList = json['month'].cast<String>();
    var billList = json['bill'].cast<double>();

    return UserElectricityData(
      id: json['id'],
      month: monthList,
      bill: billList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'month': month,
      'bill': bill,
    };
  }
}

class UserDevicesData {
  String id;
  List<String> name;
  List<String> mac;

  UserDevicesData({
    required this.id,
    required this.name,
    required this.mac,
  });

  //majhiaryan13@gmail.com
  //["redmi note 8 pro","saruo"]
  //["20.2e.2a.1b","99.2a.65.4c"]

  factory UserDevicesData.fromJson(Map<String, dynamic> json) {
    var deviceList = json['device_name'].cast<String>();
    var macList = json['mac_id'].cast<double>();

    return UserDevicesData(
      id: json['id'],
      name: deviceList,
      mac: macList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'device_name': name,
      'mac_id': mac,
    };
  }
}

class UserBodySensorData {
  String id;
  List<Float> walking;
  List<Float> running;
  List<Float> vehicle;

  UserBodySensorData({
    required this.id,
    required this.walking,
    required this.running,
    required this.vehicle,
  });

  factory UserBodySensorData.fromJson(Map<String, dynamic> json) {
    var walkingList = json['walking'].cast<Float>();
    var runningList = json['running'].cast<Float>();
    var vehicleList = json['vehicle'].cast<Float>();

    return UserBodySensorData(
      id: json['id'],
      walking: walkingList,
      running: runningList,
      vehicle: vehicleList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'walking': walking,
      'running': running,
      'vehicle': vehicle,
    };
  }
}

class UserLocationData {
  String id;
  List<String> location;
  List<Float> aqi;

  UserLocationData({
    required this.id,
    required this.location,
    required this.aqi,
  });

  factory UserLocationData.fromJson(Map<String, dynamic> json) {
    var locationList = json['location'].cast<String>();
    var aqiList = json['aqi'].cast<Float>();

    return UserLocationData(
      id: json['id'],
      location: locationList,
      aqi: aqiList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'location': location,
      'aqi': aqi,
    };
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
}
