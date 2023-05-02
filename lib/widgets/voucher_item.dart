import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/voucher_controller.dart';
import '../models/voucher.dart';

class VoucherItem extends StatelessWidget {
  final VoucherController voucherController = Get.find();
  final Voucher voucher;
  final RxBool checkboxValue;
  final bool disabled;
  final bool disableModal;
  VoucherItem({
    super.key,
    required this.voucher,
    this.disabled = false,
    this.disableModal = false,
  }) : checkboxValue =
            (Get.find<VoucherController>().selectedVoucher.id == voucher.id)
                .obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !disableModal
          ? () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                isScrollControlled: true,
                useRootNavigator: true,
                enableDrag: true,
                isDismissible: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  double boxWidth = MediaQuery.of(context).size.width;
                  return Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: boxWidth * 0.15 + 45),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 15),
                          //swipe up line
                          Center(
                            child: Container(
                              width: 100,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffd1d1d6),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              SizedBox(
                                  width: 40,
                                  height: 70,
                                  child: Image.network(voucher.logo)),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, bottom: 2.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        voucher.title,
                                        style: const TextStyle(
                                          fontFamily: 'Rubik',
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        voucher.description,
                                        style: const TextStyle(
                                          fontFamily: 'Rubik',
                                          fontSize: 12.0,
                                          color: Color(0xFF9F9F9F),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              voucher.details,
                              style: const TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]);
                },
              );
            }
          : null,
      child: Opacity(
        opacity: disabled ? 0.5 : 1,
        child: Container(
          margin: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7FB),
              border: Border.all(color: const Color(0xF6F7FB)),
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                      width: 40,
                      height: 70,
                      child: Image.network(voucher.logo)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            voucher.title,
                            style: const TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            voucher.description,
                            style: const TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 10.0,
                              color: Color(0xFF9F9F9F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Checkbox(
                      onChanged: !disabled
                          ? (value) {
                              // set the selected voucher if true
                              if (!checkboxValue.value) {
                                voucherController.setVoucher(voucher);
                                checkboxValue.value = !checkboxValue.value;
                              } else {
                                if (!disabled) {
                                  voucherController.removeVoucher();
                                }
                              }
                            }
                          : null,
                      value: checkboxValue.value,
                      activeColor: const Color.fromARGB(255, 112, 203, 136),
                    ),
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
