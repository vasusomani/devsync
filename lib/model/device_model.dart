class DeviceModel {
  String? deviceType;
  String? deviceName;
  String? deviceAddress;
  String? deviceStatus;
  String? deviceTimer;
  String? deviceTerminals;

  DeviceModel({
    this.deviceType,
    this.deviceName,
    this.deviceAddress,
    this.deviceStatus,
    this.deviceTimer,
    this.deviceTerminals,
  });

  DeviceModel.fromJson(Map<String, dynamic> json) {
    deviceType = json['deviceType'];
    deviceName = json['deviceName'];
    deviceAddress = json['deviceAddress'];
    deviceStatus = json['deviceStatus'];
    deviceTimer = json['deviceTimer'];
    deviceTerminals = json['deviceTerminals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceType'] = deviceType;
    data['deviceName'] = deviceName;
    data['deviceAddress'] = deviceAddress;
    data['deviceStatus'] = deviceStatus;
    data['deviceTimer'] = deviceTimer;
    data['deviceTerminals'] = deviceTerminals;
    return data;
  }
}
