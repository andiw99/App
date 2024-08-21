import 'package:chatapp_frontend/components/blackbutton.dart';
import 'package:chatapp_frontend/components/cleantextformfield.dart';
import 'package:chatapp_frontend/components/horizontallign.dart';
import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/pages/registerpage.dart';
import 'package:chatapp_frontend/src/repository.dart';
import 'package:chatapp_frontend/src/restapi.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  bool logout;
  LoginPage({super.key, this.logout = false});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  Api restClient = DjangoRestApi(); // Or we could even hand the client as parameter, but that should be fine for now
  RepositoryClient repoClient = DriftRepositoryClient();      // I actually don't want to initialize it here, but rather when it is needed. But then I have the DriftRepository Client
  // In the middle of my Code, which is not very beautiful. Should we have a static class like a 'ClientGetter' which gets the clients so we would only have to change the clientgetter if
  // we were to change up some architectural stuff?

  @override
  void initState() {
    super.initState();
    if(widget.logout) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.info(
            message:
                "Logged out",
          ),
      );
    });}
    
  }

  // sign user in method
  void signUserIn() async {
    // Here i want to send a json like
    // msg = {"username": actualusername
    //        "password": actualpassword
    // }
    // Which means I need the things I entered the textbox
    if (usernameController.text.isNotEmpty &
        passwordController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // well we now have to send an http get? request to receive the token
      var tokenMap = await restClient.apiTokenAuth(usernameController.text, passwordController.text);  
      await Future.delayed(const Duration(
          milliseconds:
              700)); // TODO remove just makes the feeling a little bit more real
      if (tokenMap.containsKey("token")) {
        // Redirect to Home with message logged in as...
        // I am not to sound with the routing at the moment
        
        var userInfoMap = await restClient.getProfileInfo(tokenMap["token"]);
        // We also add the token
        userInfoMap['token'] = tokenMap["token"];
        // Here we now want to persist the userdata
        print("\n\n\nBefore add Profile call");
        // TODO remove at some point
        // await (driftDatabaseInstance.delete(driftDatabaseInstance.profile)..where((t) => t.username.equals("Andi"))).go();
        repoClient.addProfile(userInfoMap);
        print("After add Profile call\n\n\n");
        setState(() {

          token = tokenMap["token"];          // We will keep this for now because of the many places where I used the global token, but actually we should get it from the repo now.
          username = usernameController.text;
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: 'Logged in as $username',
            ),
          );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text()),
          // );
        });
      } else {
        // Redirect to Login with message 'unable to log in'
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
              message: "Unable to login with the provided credentials."),
        );
      }
      if (mounted) Navigator.of(context).pop();
      // setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    //if(token.isNotEmpty) {
    //  // TODO this is the method of logging out at the moment
    //  token = "";
    //}
    print("Widget.logout: ${widget.logout}");
    if (widget.logout) {
      token = "";
      // I think we need to reset logout then...
      widget.logout = false;
    }
    if (token.isNotEmpty) {
      return const MyHomePage(title: "Best App ever after login");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          'Login',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                CleanTextFormField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                CleanTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                Blackbutton(onTap: signUserIn, text: "Sign in"),

                const SizedBox(height: 20),

                const HorizontalLineWithLabel(label: ""),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not registered?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => {
                        // on Tap we want to to push the register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        )
                      },
                      child: const Text(
                        'Sign Up!',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
