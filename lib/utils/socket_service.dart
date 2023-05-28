// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../controllers/auth_controller.dart';
import 'api.endpoints.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();

  late IO.Socket socket;

  factory SocketService() {
    return _instance;
  }

  SocketService._internal() {
    // namespace: https://domain:port/driver
    socket = IO.io("${ApiEndPoints.baseUrl}driver", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.onConnect((_) {
      print('connected to server');

      var userId = AuthController.to.user.id;
      // specify user id
      if (userId == "") {
        // retry after 1 second
        Future.delayed(const Duration(seconds: 1), () {
          print("retry");
          socket.emit('subscribe', userId);
        });
      }
      socket.emit('subscribe', userId);
    });

    // socket.on('location', (data) {
    //   // print(data);
    //   Handshake handshake = Handshake.fromJson(data);

    //   // send back location and data to server
    //   var currentPosition = GeoController.to.currentPosition;
    //   var response = {
    //     "userId": AuthController.to.user.id,
    //     "location": {
    //       "latitude": currentPosition.latitude,
    //       "longitude": currentPosition.longitude,
    //     },
    //     "transactionId": handshake.transactionId,
    //     "address": {
    //       "customerAddress": handshake.customerAddress,
    //       "merchantAddress": handshake.merchantAddress,
    //     }
    //   };

    //   socket.emit('handshake', response);
    // });

    // socket.on('newOrder', (data) {
    //   // parse data
    //   Transaction transaction = Transaction.fromJson(data);
    //   // set new order received to true in order controller
    //   print(transaction);
    //   OrderController.to.receiveOrder(transaction);
    // });

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
