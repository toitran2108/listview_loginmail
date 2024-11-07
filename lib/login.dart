import 'package:flutter/material.dart';
import 'loginthanhcong.dart';

void main() {
  runApp(AppCuaToi());
}

class AppCuaToi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrangChuApp(),
    );
  }
}

class TrangChuApp extends StatefulWidget {
  @override
  TrangChuAppState createState() => TrangChuAppState();
}

class TrangChuAppState extends State<TrangChuApp> {
  final form_key = GlobalKey<FormState>();
  final TextEditingController user_name = TextEditingController();
  final TextEditingController pass_word = TextEditingController();

  bool isEmail(String input) { //ham kiem tra dinh dang email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(input);
  }

  void lo_gin() {
    if (form_key.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loginthanhcong(user_name: user_name.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Màn hình đăng nhập'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(  //cho phép cuộn nội dung nếu nhập vô bị tràn màn hình
          padding: EdgeInsets.all(16), //tạo khoảng cách từ viền màn hình đến các widget con bên trong
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 300,
                child: Image.asset('assets/anhdn.gif'),
              ),
              Form( // quan li viec nhap du lieu va kiem tra no
                key: form_key,
                child: Column(
                  children: [
                    TextFormField( // nhap du lieu
                      controller: user_name,
                      decoration: InputDecoration(labelText: 'Địa chỉ Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (nhap_email) { // ham kiem tra luc nhap vao
                        if (nhap_email == null || nhap_email.isEmpty) {
                          return 'Vui lòng nhập địa chỉ email';
                        } else if (!isEmail(nhap_email)) {
                          return 'Email không hợp lệ, vui lòng nhập lại';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: pass_word,
                      decoration: InputDecoration(labelText: 'Mật khẩu'),
                      obscureText: true,
                      validator: (nhap_password) {
                        if (nhap_password == null || nhap_password.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        } else if (nhap_password.length < 6) {
                          return 'Mật khẩu phải có ít nhất 6 ký tự';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: lo_gin,
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
