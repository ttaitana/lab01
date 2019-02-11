import 'package:flutter/material.dart';
import './ui/first_screen.dart';
import './ui/second_screen.dart';
import './ui/my_custom_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        "/" : (context) => MyCustomForm(),
        "/second" : (context) => SecondScreen(),
      },
    );
  }
}



// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: <Widget>[
//                 Tab(
//                   icon: Icon(Icons.dashboard),
//                   text: "Dashboard",
//                 ),
//                 Tab(
//                   icon: Icon(Icons.aspect_ratio),
//                   text: "Camera",
//                 ),
//                 Tab(
//                   icon: Icon(Icons.settings),
//                   text: "Setting",
//                 ),
//               ],
//             ),
//             title: Text("Tabs Demo"),
//           ),
//           body: TabBarView(
//             children: <Widget>[
//               Dashboard(),
//               Icon(Icons.aspect_ratio),
//               Icon(Icons.settings),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You click : "),
            Text("${counter}"),
            Text(" times"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          setState(() {
            counter++;
          });
          print("Counted! value ${counter}");
        },
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello world"),
//       ),
//       body: Text("${counter}"),
//       floatingActionButton: IconButton(
//         icon: Icon(Icons.add),
//         onPressed: () {
//           counter++;
//           print("Counted! value ${counter}");
//         },
//       ),
//     );
//   }
// }
