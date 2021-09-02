import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = 'Name to be displayed here';

  TextEditingController nameController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                nameController: nameController,
                inputType: TextInputType.name,
                hint: 'Please Enter your Name',
              ),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                nameController: pwController,
                inputType: TextInputType.visiblePassword,
                hint: 'Please Enter your Password',
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                ),
                onPressed: () {
                  setState(() {
                    name = nameController.text;
                  });
                },
                child: Text('submit'),
              ),
              SizedBox(
                height: 10,
              ),
              Text('$name')
            ],
          ),
        ),
      )),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.hint,
    required this.inputType,
    required this.nameController,
  });
  final String hint;
  final TextInputType inputType;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      obscureText: false,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hint,
      ),
    );
  }
}
