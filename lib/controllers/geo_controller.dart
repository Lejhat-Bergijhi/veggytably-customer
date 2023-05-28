import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../utils/geolocator_service.dart';

class GeoController extends GetxController {
  static GeoController to = Get.find();
  // store the current position
  final Rx<LatLng> _currentPosition = Rx<LatLng>(LatLng(0, 0));

  // getter for current position
  LatLng get currentPosition => _currentPosition.value;

  // setter for current position
  set currentPosition(LatLng value) => _currentPosition.value = value;

  @override
  void onInit() {
    super.onInit();

    // get the current position
    getCurrentPosition();
  }

  void getCurrentPosition() async {
    var position = await GeolocatorService.determinePosition();
    print(position);

    currentPosition = LatLng(position.latitude, position.longitude);
  }
}
