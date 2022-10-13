import 'package:flutter/material.dart';

class MyStickersPage extends StatefulWidget {
  const MyStickersPage({Key? key}) : super(key: key);

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends State<MyStickersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Sticker page'),
      ),
      body: Container(),
    );
  }
}
