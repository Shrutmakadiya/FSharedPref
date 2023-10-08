import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  static const String KEYNAME = "name";
  var nameValue = "No value stored";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Pref'),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22)
                    )
                  ),
                ),
                SizedBox(
                  height:25,
                ),
                ElevatedButton(onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString(KEYNAME, nameController.text.toString());
                },
                    child: Text('Save' , style: TextStyle(fontSize:20),)
                ),
                SizedBox(
                  height: 25,
                ),
                Text(nameValue , style:TextStyle(fontSize: 30),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getValue() async {
      var prefs = await SharedPreferences.getInstance();
      var getName = prefs.getString(KEYNAME);
      nameValue = getName ?? "No Value Stored";
      setState(() {

      });
  }
}

