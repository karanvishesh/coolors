
import 'package:coolors/coolors_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("COOLORS"),
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "The super fast\n color schemes\n generator!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Create the perfect palette or get inspired by\n thousands of beautiful color schemes.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoolorsScreen()),
                      );
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "Start the generator",
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
