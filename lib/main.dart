import 'dart:convert';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/request.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:simple_permissions/simple_permissions.dart';
import 'package:csv/csv.dart';
import 'package:json_annotation/json_annotation.dart';

void main(){
  runApp(MyApp());
}

// Future<void> caller() async {
//   var data = await getData('http://10.0.2.2:5000/');
//   var decodedData = jsonDecode(data);
//   // print(decodedData['myquery']);
//   print(decodedData["text"]);
//
// }
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var data;
  String qw = "";
  int c ;


// class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App1",
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Home"),
          leading: Icon(Icons.home),
          backgroundColor: Colors.blueAccent,

        ),
        body: SingleChildScrollView(
          child: Center(

            child: Column(

              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,

              children: [
                // Container(
                //   height: 50,
                //   width: 100,
                //   margin: EdgeInsets.all(10.0),
                //   color: Colors.orange,
                //   child: Text("Flutter App"),
                // ),
                // Container(
                //   height: 50,
                //   width: 100,
                //   margin: EdgeInsets.all(10.0),
                //   color: Colors.orange,
                //   child: Text("Flutter App 2"),
                // ),
                // Container(
                //   height: 50,
                //   width: 100,
                //   margin: EdgeInsets.all(10.0),
                //   color: Colors.orange,
                //   child: Text("Flutter App 3"),
                // ),
                // Center(
                //   child: Text("Hello World"),
                // ),
                // Container(
                //   height: 90,
                //   width: 150,
                //   margin: EdgeInsets.all(20),
                //   padding: EdgeInsets.all(10),
                //   alignment: Alignment.center,
                //   child: Text("Hello World"),
                //   decoration: BoxDecoration(
                //       color: Colors.amberAccent,
                //       border: Border.all(width: 5, color: Colors.black),
                //       borderRadius: BorderRadius.circular(50),
                //       boxShadow: [BoxShadow(color: Colors.black54,offset: Offset(5.0,5.0))]
                //   ),
                //   transform: Matrix4.rotationZ(0.2),
                //   //          constraints: BoxConstraints.expand(height: 100,width: 100),
                // ),
                // Text(
                //     "Hello this app is for Webcrawling",
                //   style: TextStyle(
                //     color:Colors.blue,
                //     fontSize: 30,
                //     fontStyle: FontStyle.italic,
                //     fontWeight: FontWeight.w800,
                //     backgroundColor: Colors.black12,
                //     letterSpacing: 4.0,
                //     wordSpacing: 10.0,
                //     shadows: [
                //       Shadow(
                //         color: Colors.black26,offset: Offset(4.0,4.0)
                //       )
                //     ]
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: RichText(
                //       text: TextSpan(
                //         text: "Hello guys",
                //         style: TextStyle(
                //           color: Colors.yellow,
                //         ),
                //         children: [
                //           TextSpan(
                //             text: "This is the next command",
                //             style: TextStyle(
                //               color: Colors.blue,
                //             ),
                //           )
                //         ]
                //
                //   )
                //   ),
                // ),
                // TextField(
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: "Password",
                //     hintText: "Enter your pass"
                //
                //   ),
                // )



                // THIS IS FOR MINI PROJECT1

                Center(
                  child: Container(
                    // margin: EdgeInsets.only(top: 30.0),
                    margin: EdgeInsets.all(30.0),
                    height: 100,
                    // width: Width,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(100),
                        borderRadius: BorderRadius.circular(20),
                      color: Colors.lightBlueAccent,
                      border: Border.all(color: Colors.black,width: 2)
                    ),
                    child: Center(
                      child: Text("Web Crawler",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black
                        ) ,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      onChanged: (val){
                        this.qw=val;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          // hintText: "Enter your name",
                          hintText: "Enter query keyword",
                          icon: Icon(Icons.description_outlined,color: Colors.black,)
                        // icon: Icon(Icons.person,color: Colors.black,)
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      // obscureText: true,
                      onChanged: (val){
                        this.c=int.parse(val);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          // hintText: "Password",
                          hintText: "Enter the query count",
                          icon: Icon(Icons.account_tree_rounded,color: Colors.black)
                          // icon: Icon(Icons.lock,color: Colors.black)
                      ),
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       color: Colors.lightBlueAccent,
                //       borderRadius: BorderRadius.circular(20)
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(4.0),
                //     child: TextField(
                //       decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: "Github",
                //           icon: Icon(Icons.link_sharp,color: Colors.black)
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 30,right: 30),
                //   height: 60,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       color: Colors.lightBlueAccent,
                //       borderRadius: BorderRadius.circular(20)
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Center(
                //       child: Text(
                //         "Update",
                //         style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 25,
                //           fontWeight: FontWeight.bold,
                //           fontStyle: FontStyle.normal,
                //         ),
                //       ),
                //     ),
                //   )
                // ),


                // FlatButton(
                //     onPressed: (){},
                //     child: Text(
                //       "Update",
                //       style: TextStyle(
                //           fontSize: 20,
                //           ),
                //     ),
                //     color: Colors.lightBlueAccent,
                //     textColor: Colors.black,
                // ),
                //
                // RaisedButton(
                //   onPressed: (){},
                //   child: Text(
                //     "Update"
                //   ),
                //   color: Colors.lightBlueAccent,
                //   textColor: Colors.black,
                //   splashColor: Colors.red,
                // ),
                //
                // FloatingActionButton(
                //   onPressed: (){},
                //   child: Icon(Icons.save),
                //   foregroundColor: Colors.black,
                //   backgroundColor: Colors.lightBlueAccent,
                //
                // ),

                FloatingActionButton.extended(
                  onPressed: () async {
                    var data = await getData('http://10.0.2.2:5000/api?qw=$qw&c=$c');
                    // var data = await getData('http://10.0.2.2:5000/');
                    // var decodedData = jsonDecode(data);
                    print('gotcha');
                    // print(data);
                    // var list= new List<dynamic>(data);
                    // print(decodedData['myquery']);
                    // print('the scraped hastags are:');
                    // print(decodedData);

                    Directory tempDir = await getExternalStorageDirectory();
                    print(tempDir);
                    print("creating file...");
                    File file = new File("${tempDir.path}/scraped.csv");
                    file.writeAsString('$data');

                    // String csv = const ListToCsvConverter().convert(list);
                    // file.writeAsString(csv);
                    // file.writeAsString(data);

                    // print("creating file...");
                    // File file =
                    // new File('/storage/Downloads/data.csv');
                    // file.writeAsString('$decodedData');
                    // print('done');
                    // showAlertDialog(context, decodedData['text']);

                    // Directory d = Directory('/storage/emulated/0');
                    // if (d.existsSync()) {
                    //   Directory(d.path + '/MyApp').createSync();
                    //   File mydata = new File(d.path + '/MyApp/data.csv');
                    //   print('saving to ${mydata.path}');
                    //   mydata.createSync();
                    //   mydata.writeAsString('$decodedData');
                    // }

                    // PermissionStatus permissionResult = await SimplePermissions.requestPermission(Permission. WriteExternalStorage);
                    // if (permissionResult == PermissionStatus.authorized){
                    //   // code of read or write file in external storage (SD card)
                    //   print("creating file...");
                    //   File file =
                    //   new File('/storage/emulated/0/Downloads/data.csv');
                    //   file.writeAsString('$decodedData');
                    //   print('done');
                    // }

                  },
                  label: Text("Go"),
                  icon: Icon(Icons.save),
                  foregroundColor: Colors.black,
                  hoverColor: Colors.grey,
                  backgroundColor: Colors.lightBlueAccent,

                )

              ],

            ),
          ),

        )
      )
    );
  }
}
  // showAlertDialog(BuildContext context, String name) {
  //
  //   // set up the button
  //   Widget okayButton = FlatButton(
  //     child: Text("Okay!"),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Data"),
  //     content: Text("The scraped data is: $name"),
  //     actions: [
  //       okayButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }











































//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
