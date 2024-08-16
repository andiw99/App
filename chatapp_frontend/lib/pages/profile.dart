import 'package:chatapp_frontend/components/profilemenuwidget.dart';
import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/pages/loginpage.dart';
import 'package:chatapp_frontend/pages/registerpage.dart';
import 'package:chatapp_frontend/pages/updatebiography.dart';
import 'package:chatapp_frontend/pages/updategallery.dart';
import 'package:chatapp_frontend/pages/updateprofile.dart';
import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(profile, style: Theme.of(context).textTheme.headlineMedium),
        // actions: [IconButton(onPressed: () {}, icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child:  Image.asset('assets/images/profile.png')),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Container(
                  //     width: 35,
                  //     height: 35,
                  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: primaryColor),
                  //     child: const Icon(
                  //       Icons.edit,
                  //       color: Colors.black,
                  //       size: 20,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              Text(username, style: Theme.of(context).textTheme.headlineMedium),
              Text(email, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UpdateProfileInfo()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor, side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text(editProfile, style: TextStyle(color: darkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(title: "Profile Info", icon: Icons.person, onPress: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UpdateProfileInfo()),
                    );
              }),
              ProfileMenuWidget(title: "Biography", icon: Icons.list, onPress: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UpdateBiography()),
                    );
              }),
              ProfileMenuWidget(title: "Gallery", icon: Icons.photo_library_outlined, onPress: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UpdateGallery()),
                    );
              }),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "Settings", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(title: "Information", icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(logout: token.isNotEmpty),
                          ),
                        );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}