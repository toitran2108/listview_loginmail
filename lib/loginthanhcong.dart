import 'package:flutter/material.dart';

class loginthanhcong extends StatelessWidget{
  final String user_name;

  loginthanhcong(
      {required this.user_name});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập thành công'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          'Chào mừng, $user_name!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
