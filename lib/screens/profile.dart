// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/login_registration/wholesaler_registration.dart';

import '../provider/product_provider.dart';
import '../widgets/profile_listtile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();

}

bool _darkMode = true;

class _ProfileState extends State<Profile> {
  @override
  String username= "";
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DataClass>(context, listen: false).getData();

    });
  }
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<DataClass>(context);

    setState(() {
      username = (userProvider.json_data['data']['fullname']);
    });

    //String username = userProvider.us['username'].toString();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
            height: 210,
            width: double.infinity,
            color: Colors.indigo,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/profile.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      height: 32,
                      width: 140,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          onPressed: () {},
                          child: Text(
                          " default value",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15, bottom: 14),
            child: Text(
               username ?? "Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            child: CustomListTile(
              "My Cart",
              Icons.read_more,
              Icons.keyboard_arrow_right_outlined,
            ),
          ),
          CustomListTile(
            "Favorite list",
            Icons.favorite_outline,
            Icons.keyboard_arrow_right_outlined,
          ),
          CustomListTile(
            "Notification",
            Icons.notifications_outlined,
            Icons.keyboard_arrow_right_outlined,
          ),
          CustomListTile(
            "Setting",
            Icons.settings,
            Icons.keyboard_arrow_right_outlined,
          ),
          SwitchListTile(
            value: _darkMode,
            title: Text(
              ' Night Mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            secondary: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Icon(Icons.dark_mode),
            ),
            onChanged: (newValue) {
              setState(() {
                _darkMode = newValue;
              });
            },
            visualDensity: VisualDensity.adaptivePlatformDensity,
            // switchType: SwitchType.material,
            activeColor: Colors.indigo,
          ),
          ListTile(
            title: Text(
              ("Sign out"),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: (Icon(
                Icons.logout,
                size: 25,
              )),
            ),
            tileColor: Colors.grey.shade100,
            subtitle: Text("Registered to example@gmail.com"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15, bottom: 14),
            child: Text(
              "Support",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          CustomListTile(
            "Help",
            Icons.space_bar_rounded,
            Icons.keyboard_arrow_right_outlined,
          ),
          CustomListTile(
            "About us",
            Icons.person_outline,
            Icons.keyboard_arrow_right_outlined,
          ),
          CustomListTile(
            "Contact us",
            Icons.message,
            Icons.keyboard_arrow_right_outlined,
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Zulu Shop 1.0.0",
              style: TextStyle(color: Colors.blueGrey, fontSize: 15),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}


