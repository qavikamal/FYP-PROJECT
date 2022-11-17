import 'dart:io';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/navigator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:login_signup/cubit/auth_cubit.dart';
// import 'package:login_signup/screens/home_screen.dart';
import './input_field.dart';

import './theme.dart';
import './custome_checkbox.dart';
import './custom_primary_button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController useridController = TextEditingController(text: '');
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');


  bool passwordVisible = false;
  bool passwordConfrimationVisible = false;
  bool isChecked = false;
  bool isRegistered = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  register_wholesaler(String userid , name, email , password , phonenumber ) async {
    userModel data = userModel(
        userid: userid,
        fullname: name,
        email: email,
        phone: phonenumber,
        password: password
    );
    var provider = Provider.of<DataClass>(context, listen: false);
    await provider.postDataRegister(data);
    if (provider.json_data['success'] == true) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavigatorWidget()));
    }
  }
    //   try{
    //   http.Response response = await http.post(Uri.parse('http://localhost:3000/api/user/createaccount'),
    //       headers: {"Content-Type": "application/json"},
    //       body: jsonEncode(data)
    //   );
    //   var jsondata = jsonDecode(response.body);
    //   print(jsondata['success']);
    //    if(jsondata['success'] == true) {
    //      setState(() {
    //        isRegistered = true;
    //      });
    //      Navigator.push(
    //          context, MaterialPageRoute(builder: (context) =>NavigatorWidget()));
    //      print(isRegistered);
    //      return jsondata;
    //    }}
    //     catch(e){
    //
    //   print(e);
    // }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register new\naccount',
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
                        hintText: 'Enter User ID',
                        controller: useridController,
                        suffixIcon: SizedBox(),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      InputField(
                        hintText: 'Enter Your Name',
                        controller: nameController,
                        suffixIcon: SizedBox(),
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
                      SizedBox(
                        height: 32,
                      ),
                      InputField(
                        hintText: 'Email',
                        controller: emailController,
                        suffixIcon: SizedBox(),
                                              ),
                      SizedBox(
                        height: 32,
                      ),
                      InputField(
                          hintText: 'Enter Phone Number',
                          controller: phoneController,
                          suffixIcon: SizedBox(),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isChecked ? primaryBlue : Colors.transparent,
                          borderRadius: BorderRadius.circular(4.0),
                          border: isChecked
                              ? null
                              : Border.all(color: textGrey, width: 1.5),
                        ),
                        width: 20,
                        height: 20,
                        child: isChecked
                            ? Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.white,
                        )
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'By creating an account, you agree to our',
                          style: regular16pt.copyWith(color: textGrey),
                        ),
                        Text(
                          'Terms & Conditions',
                          style: regular16pt.copyWith(color: primaryBlue),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                // BlocConsumer<AuthCubit, AuthState>(
                //   listener: (context, state) {
                //     if (state is AuthSuccess) {
                //       Navigator.pushAndRemoveUntil(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => HomeScreen(),
                //           ),
                //               (route) => false);
                //     } else if (state is AuthFailed) {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           backgroundColor: Colors.red.shade700,
                //           content: Text(
                //             state.error,
                //           ),
                //         ),
                //       );
                //     }
                //   },
                //   builder: (context, state) {
                //     if (state is AuthLoading) {
                //       return Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //     return CustomPrimaryButton(
                CustomPrimaryButton(
                      buttonColor: primaryBlue,
                      textValue: 'Register',
                      textColor: Colors.white,
                      onPressed: () {
                        register_wholesaler(useridController.text, nameController.text,
                            emailController.text, passwordController.text,
                            phoneController.text);

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => NavigatorWidget()));
                        // isChecked
                        //     ? context.read<AuthCubit>().signUp(
                        //   name: nameController.text,
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        // )
                        //     : ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     backgroundColor: Colors.red.shade700,
                        //     content: Text(
                        //       'Are you agree with our Tems & Conditions?',
                        //     ),
                        //   ),
                        // );

                      }),

                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: regular16pt.copyWith(color: textGrey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Text(
                        'Login',
                        style: regular16pt.copyWith(color: primaryBlue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class userModel {
  String? userid;
  String? fullname;
  String? email;
  String? phone;
  String? password;

  userModel(
      {this.userid, this.fullname, this.email, this.phone, this.password});

  userModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}

Future<http.Response?> register(userModel data) async {
  var jsondata;
  http.Response? response;
  try {
    response =
    await http.post(
        Uri.parse("http://localhost:3000/api/user/createaccount"),

          headers: {"Content-Type": "application/json"},
         body: jsonEncode(data));

  } catch (e) {
    print(e.toString());
  }

  return response;
}


Future<http.Response?> login(userModel data) async {

  http.Response? response;
  try {
    response =
    await http.post(
        Uri.parse("http://localhost:3000/api/user/login"),

        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data));

  } catch (e) {
    print(e.toString());
  }

  return response;
}


class DataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;
  var json_data;
    String userName = " Default ";
  Future<void> postDataRegister(userModel body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await register(body))!;
    json_data= jsonDecode(response.body);
      if (json_data['success'] == true) {
     print(json_data);
    }
    loading = false;
    notifyListeners();
    return json_data;

  }
  Future<void> postDataLogin(userModel body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await login(body))!;
    json_data= jsonDecode(response.body);
    if (json_data['success'] == true) {
      print(json_data);
    }
    loading = false;
    notifyListeners();
    return json_data;

  }

  Future<void> getData() async {
       print(json_data);
    notifyListeners();
  }
}

