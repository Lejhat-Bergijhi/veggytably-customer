import 'package:get/get.dart';

/**
 * [
                  'Lacto-vegetarian',
                  'Ovo-vegetarian',
                  'Pollo-vegetarian',
                  'Lacto-ovo vegetarian',
                  'Pesco-vegetarian'
                ]
 */

class RestrictionController extends GetxController {
  List<String> options = [
    'Lacto-vegetarian',
    'Ovo-vegetarian',
    'Pollo-vegetarian',
    'Lacto-ovo vegetarian',
    'Pesco-vegetarian',
  ];

  final _selectedOption = "Lacto-vegetarian".obs;
  String get selectedOption => _selectedOption.value;

  set selectedOption(String value) => _selectedOption.value = value;
}
