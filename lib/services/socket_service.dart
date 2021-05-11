import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  Online,
  Offline,
  Conecting,
}

// ChangeNotifier ayuda a decir al provedor cuando refrescar
class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Conecting;
  ServerStatus get serverStatus => this._serverStatus;

  IO.Socket _socket;
  IO.Socket get socket => this._socket;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    _socket = IO.io("http://127.0.0.1:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    this._socket.connect();
    this._socket.onConnect((data) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    this._socket.on('nuevo-mensaje', (payload) {
      print('nuevo mensaje: $payload');
    });

    
  }
}





// import 'package:flutter/material.dart';

// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';

// enum ServerStatus { Online, Offline, Connecting }

// class SocketService with ChangeNotifier {
//   ServerStatus _serverStatus = ServerStatus.Connecting;
//   IO.Socket _socket;

//   ServerStatus get serverStatus => this._serverStatus;

//   IO.Socket get socket => this._socket;
//   Function get emit => this._socket.emit;

//   SocketService() {
//     this._initConfig();
//   }

//   void initState() {
//     super.initState();
//     connect();
//     FocusNode.addListener(() {
//       if (focusNode.hasFocus) {
//         show = false;
//       }
//     });
//   }

//   void _initConfig() {
//     // Dart client
//     // this._socket = IO.io('http://192.168.43.229:3000/', {
//     //   'transports': ['websocket'],
//     //   'autoConnect': true
//     // });

//     // // this._socket.on('connect', (_) {
//     // this._socket.onConnect((_) {
//     //   this._serverStatus = ServerStatus.Online;
//     //   notifyListeners();
//     // });

//     // this._socket.onDisconnect((_) {
//     //   this._serverStatus = ServerStatus.Offline;
//     //   notifyListeners();
//     // });

//     IO.Socket socket = IO.io('http://192.168.100.5:3000',
//         OptionBuilder().setTransports(['websocket']).build());

//     socket.onConnect((_) {
//       print('connect');
//       socket.emit('msg', 'test');
//     });
//   }
// }

// import 'package:flutter/material.dart';

// import 'package:socket_io_client/socket_io_client.dart' as IO;

// enum ServerStatus {
//   Online,
//   Offline,
//   Conecting,
// }

// class SocketService with ChangeNotifier {
//   ServerStatus _serverStatus = ServerStatus.Conecting;
//   get serverStatus => this._serverStatus;

//   IO.Socket socket;

//   SocketService() {
//     this.connect();
//     print('object');
//   }

//   void connect() {
//     // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
//     // socket = IO.io("http://192.168.100.5:5000/", {
//     //   "transports": ["websocket"],
//     //   "autoConnect": true,
//     // });
//     // socket.onConnect((_) {
//     //   print("Connected");
//     // });
//     // print(socket.connected);

//     socket = IO.io("http://192.168.100.5:5000", <String, dynamic>{
//       "transports": ["websocket"],
//       "autoConnect": false,
//     });
//     socket.connect();
//     socket.emit("signin", "Hola servidor desde el cliente");
//     socket.onConnect((data) {
//       print("Connected");
//       socket.on("message", (msg) {
//         print(msg);
//       });
//     });
//     print(socket.connected);
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// enum ServerStatus {
//   Online,
//   Offline,
//   Conecting,
// }

// class SocketService with ChangeNotifier {
//   ServerStatus _serverStatus = ServerStatus.Conecting;

//   SocketService() {
//     this._initConfig();
//   }

//   void _initConfig() {
//     IO.Socket socket = IO.io('http://192.168.100.5:5000', {
//       "transports": ["websocket"],
//       "autoConnect": false,
//     });
//     socket.connect();
//     socket.onConnect((_) {
//       print('connect');
//     });
//     socket.onDisconnect((_) => print('disconnect'));
//     print(socket.connected);
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class IndividualPage extends StatefulWidget {
//   @override
//   _IndividualPageState createState() => _IndividualPageState();
// }

// class _IndividualPageState extends State<IndividualPage> {
//   bool show = false;
//   FocusNode focusNode = FocusNode();
//   bool sendButton = false;
//   IO.Socket socket;

//   @override
//   void initState() {
//     super.initState();
//     // connect();

//     focusNode.addListener(() {
//       if (focusNode.hasFocus) {
//         setState(() {
//           show = false;
//         });
//       }
//     });
//     connect();
//   }

//   void connect() {
//     // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
//     // socket = IO.io("http://192.168.100.5:3000", <String, dynamic>{
//     socket = IO.io("http://127.0.0.1:3000", <String, dynamic>{
//       "transports": ["websocket"],
//       "autoConnect": false,
//     });
//     socket.connect();
//     socket.emit("signin", "Hola servidor ");
//     socket.onConnect((data) {
//       print("Connected");
//       socket.on("message", (msg) {
//         print(msg);
//       });
//     });
//     print(socket.connected);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image.asset(
//           "assets/whatsapp_Back.png",
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           fit: BoxFit.cover,
//         ),
//       ],
//     );
//   }
// }
