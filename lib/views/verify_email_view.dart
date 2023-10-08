import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}


class _VerifyEmailViewState extends State<VerifyEmailView> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify email")),
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: <Widget>[
                  Expanded(
                    child: PageView(
                      controller: controller,
                      children: <Widget>[
                        Card(
                          color: Colors.red.shade200,
                          child: Center(child: Text('Dang', style: TextStyle(fontSize: 36.0))), // Adjust the fontSize as desired
                        ),
                        Card(
                          color: Colors.green.shade200,
                          child: Center(child: Text('That', style: TextStyle(fontSize: 36.0))),
                        ),
                        Card(
                          color: Colors.blue.shade200,
                          child: Center(child: Text('Is', style: TextStyle(fontSize: 36.0))),
                        ),
                        Card(
                          color: Colors.yellow.shade200,
                          child: Center(child: Text('Hot', style: TextStyle(fontSize: 36.0))),
                        ),  // Fourth card
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: SwapEffect(type: SwapType.yRotation),
                    ),
                  ),
                ],
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}