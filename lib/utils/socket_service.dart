// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:veggytably_customer/controllers/transaction_controller.dart';
import 'package:veggytably_customer/models/driver_model.dart';

import 'api.endpoints.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();

  late IO.Socket socket;

  factory SocketService() {
    return _instance;
  }

  SocketService._internal() {
    // namespace: https://domain:port/customer
    socket = IO.io("${ApiEndPoints.baseUrl}customer", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.onConnect((_) {
      print('connected to server');

      var transaction = TransactionController.to.transaction;

      if (transaction == null) {
        return;
      }

      var transactionId = transaction.transactionId;
      // specify user id

      socket.emit('subscribe', transactionId);
    });

    socket.on('driver-found', (data) {
      Driver driver = Driver.fromJson(data);
      TransactionController.to.setDriver(driver);

      print(TransactionController.to.transaction!.driver!);
    });

    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  IO.Socket getInstance() {
    return socket;
  }

  // method to connect
  void connect() {
    socket.connect();
  }

  // method to disconnect
  void disconnect() {
    socket.disconnect();
  }
}
