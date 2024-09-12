import 'package:flutter/material.dart';
import '../widgets/login_text_field.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: const Center(
          child: Column(
        children: [
          Text("Enter Message"),
          LoginTextField(controller: null, hintText: 'Report here', obscureText: false,),
          OutlinedButton(onPressed: null, child: Text("Press for police"))
        ],
      )),
    );
  }
}
