import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_customer/controllers/auth_controller.dart';

class DummyHomePage extends StatelessWidget {
  const DummyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome ${AuthController.to.user.username}"),
                    Text("Phone: ${AuthController.to.user.phone}"),
                    Text("Email: ${AuthController.to.user.email}"),
                    Text("Id: ${AuthController.to.user.id}"),
                  ]);
            }),
            ElevatedButton(
                child: Text("Logout"),
                // disable button if loading
                onPressed: () {
                  AuthController.to.isLoading.value
                      ? null
                      : AuthController.to.logout();
                }),
          ],
        ),
      ),
    );
  }
}
