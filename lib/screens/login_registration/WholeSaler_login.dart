import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/login_registration/wholesaler_registration.dart';
//import './custome_checkbox.dart';
import './input_field.dart';
//import './custom_button_widget.dart';
import './theme.dart';
import './custom_primary_button.dart';
//import  '../profile.dart';
import '../../widgets/navigator.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text:'');

  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
  bool islogin = false;


  login(String email , password  ) async{
    userModel data = userModel(
        email: email,
        password: password
    );
    var provider = Provider.of<DataClass>(context, listen: false);
    await provider.postDataLogin(data);
    if (provider.json_data['success'] == true) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavigatorWidget()));
    }
    }

   //  try {
   //    http.Response response = await http.post(
   //        Uri.parse('http://localhost:3000/api/user/login'),
   //        headers: {"Content-Type": "application/json"},
   //        body: jsonEncode(data)
   //    );
   //    var jsondata = jsonDecode(response.body);
   //               print(jsondata['success']);
   //
   //    if (jsondata['success'] == false) {
   //        _showDialog(context);
   //        setState(() {
   //          data_passing = jsondata;
   //
   //        });
   //
   //             }
   //    else {
   //      setState(() {
   //        islogin = true;
   //        Navigator.push(
   //            context,
   //            MaterialPageRoute(builder: (context) => NavigatorWidget()));
   //      });
   //    }
   //  }
   //
   //  catch(e){
   // print(e);
   //  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login to your\naccount',
                    style: heading2.copyWith(color: textBlack),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    child: Image.asset(
                      'assets/images/accent.png',

                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Form(
                child: Column(
                  children: [
                    InputField(
                      hintText: 'Email',
                      suffixIcon: SizedBox(),
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    InputField(
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: !passwordVisible,
                      suffixIcon: IconButton(
                        color: textGrey,
                        splashRadius: 1,
                        icon: Icon(passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: togglePassword,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 32,
              ),
              CustomPrimaryButton(
                buttonColor: Color(0xfffbfbfb),
                textValue: 'Login',
                textColor: textBlack,
                onPressed: () {
                 login(emailController.text ,passwordController.text);
                },
                  ),

              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'OR',
                  style: heading6.copyWith(color: textGrey),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CustomPrimaryButton(
                buttonColor: Color(0xfffbfbfb),
                textValue: 'Login with Google',
                textColor: textBlack,
                onPressed: () {},
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: regular16pt.copyWith(color: textGrey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text(
                      'Register',
                      style: regular16pt.copyWith(color: primaryBlue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Invalid User"),
        content: Text("Enter Correct Details Thank You!"),
        actions: <Widget>[
          ElevatedButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



