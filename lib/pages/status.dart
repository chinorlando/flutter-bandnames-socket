import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/services/socket_service.dart';
// import 'package::band_names/services/IndividualPage.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ServerStatus: ${socketService.serverStatus}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketService.socket
              .emit('mimensaje', {'nombre': "Carola", 'menaje': "eso"});
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// import 'package:band_names/services/IndividualPage.dart';

// class StatusPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final socketService = Provider.of<IndividualPage>(context);
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (contex) => IndividualPage()));

//     // return Scaffold(
//     //   body: Center(
//     //     child: Text("hola mundo"),
//     //   ),
//     // );
//   }
// }
