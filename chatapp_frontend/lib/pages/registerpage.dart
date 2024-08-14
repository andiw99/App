import 'package:chatapp_frontend/components/blackbutton.dart';
import 'package:chatapp_frontend/components/cleantextformfield.dart';
import 'package:chatapp_frontend/components/horizontallign.dart';
import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final client = http.Client();

  final repeatPasswordController = TextEditingController();

  final emailController = TextEditingController();

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

      var message = {
        'email': emailController.text,
        'username': usernameController.text,
        'password1': passwordController.text,
        'password2': repeatPasswordController.text,
      };
      // well we now have to send an http get? request to receive the token
      var retrieveURL = Uri.parse(
          '$baseURL/signup/'); // TODO We should probably have a class that deals with all connections so we don't have to change everything around in every file if we change something? Dependency inversion, niedrige Kopplung...
      var response = jsonDecode((await client.post(retrieveURL,
                  headers: <String, String>{
                    'Content-Type': 'application/x-www-form-urlencoded',
                  },
                  body: message))
              .body)
          as Map<String,
              dynamic>; // TODO in a get request you can send headers, you probably need to handle the authorization with this
      await Future.delayed(const Duration(
          milliseconds:
              700)); // TODO remove just makes the feeling a little bit more real
      print(response);
      // depending on the response code we do something else... is response['statuscode'] already integer?
      if (response['statuscode'] == 200) {
          showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.success(
                          message: response['statusmessage'] // + "\nplease log in"                            
                        ),
                      );
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text(response['statusmessage'])),
        // );
        // If registration was successful, we pop and tell to login?
        if (mounted) Navigator.of(context).pop();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('please log in')),
        // );
      } else {
        // Else we pop nothing but show the errormessages
        String errorString = "";
        for (final msgList in response['errors'].values) {
          for (final msg in msgList) {
            if (errorString.isNotEmpty) {
              errorString += "\n\n";
            }            
            errorString += msg;
          }
        }
        showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          message: errorString                             
                        ),
                      );
        // ScaffoldMessenger.of(context).showSnackBar(
          //SnackBar(
            // dismissDirection: DismissDirection.up,
            // backgroundColor: Colors.grey,
            // margin: EdgeInsets.only(
            // bottom: MediaQuery.of(context).size.height - 150,
            // left: 10,
            // right: 10),
            // behavior: SnackBarBehavior.floating,
            // content: Text(errorString)),
        //);
      }
      if (mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text(
          'Register',
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
                  Icons.edit_note,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Sign Up now!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                CleanTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
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
                const SizedBox(height: 10),

                // password textfield
                CleanTextFormField(
                  controller: repeatPasswordController,
                  hintText: 'Repeat Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                Blackbutton(onTap: signUserIn, text: "Sign up"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
