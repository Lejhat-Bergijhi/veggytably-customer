/**
 * {driverId: 64061ba332e1cce2ab6f726a, driverName: driver, driverPlateNumber: driver}
 */

class Driver {
  late String driverId;
  late String driverName;
  late String driverPlateNumber;

  Driver({
    required this.driverId,
    required this.driverName,
    required this.driverPlateNumber,
  });

  Driver.fromJson(Map<String, dynamic> json) {
    driverId = json['driverId'];
    driverName = json['driverName'];
    driverPlateNumber = json['driverPlateNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['driverId'] = driverId;
    data['driverName'] = driverName;
    data['driverPlateNumber'] = driverPlateNumber;
    return data;
  }

  @override
  String toString() {
    return 'Driver{driverId: $driverId, driverName: $driverName, driverPlateNumber: $driverPlateNumber}';
  }
}
