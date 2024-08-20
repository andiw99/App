import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';

class UpdateProfileInfo extends StatefulWidget {
  const UpdateProfileInfo({super.key});

  @override
  State<UpdateProfileInfo> createState() => _UpdateProfileInfoState();
}

class _UpdateProfileInfoState extends State<UpdateProfileInfo> {

  Map<String, dynamic> profileData ={};

  @override
  void initState() {
    super.initState();
    _populateForm();    
  }

  Future<void> _populateForm() async {
      var profileDataRepo = await repositoryClient.getProfile();
      setState(() {
        profileData = profileDataRepo;
      });
      print(profileData['username']);
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text(editProfile, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(profilePicturePath))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100), color: primaryColor),
                      child: const Icon(Icons.photo_camera_outlined, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Center(                
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: formWidth),
                    child: Form(
                      key: Key(profileData.toString()),                
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: profileData['username'] ?? "", // if username does not exist, empty string
                          decoration: const InputDecoration(
                              label: Text(usernameString), prefixIcon: Icon(Icons.badge)),
                        ),
                        const SizedBox(height: formHeight),
                        TextFormField(
                          initialValue: profileData['firstName'] ?? "", // TODO replace initial values with actual values from DB (and or server?)
                          decoration: const InputDecoration(
                              label: Text(firstNameString), prefixIcon: Icon(Icons.person)),
                        ),
                        const SizedBox(height: formHeight),
                        TextFormField(
                          initialValue: profileData['lastName'] ?? "",
                          decoration: const InputDecoration(
                              label: Text(lastNameString), prefixIcon: Icon(Icons.person_outline)),
                        ),
                        const SizedBox(height: formHeight),
                        TextFormField(
                          initialValue: profileData['email'] ?? "",
                          decoration: const InputDecoration(
                              label: Text(emailString), prefixIcon: Icon(Icons.email)),
                        ),
                        const SizedBox(height: formHeight),
                        TextFormField(
                          initialValue: profileData['phoneNumber'] ?? "",
                          decoration: const InputDecoration(
                              label: Text(phoneNumberString), prefixIcon: Icon(Icons.phone)),
                        ),
                        const SizedBox(height: formHeight),
                        // TextFormField(
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //     label: const Text(tPassword),
                        //     prefixIcon: const Icon(Icons.fingerprint),
                        //     suffixIcon:
                        //     IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
                        //   ),
                        // ),
                        const SizedBox(height: formHeight),
                  
                        // -- Form Submit Button
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(submitChanges, style: TextStyle(color: darkColor)),
                          ),
                        ),
                        const SizedBox(height: formHeight),
                  
                        // -- Created Date and Delete Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text.rich(
                              TextSpan(
                                text: registeredOn,
                                style: TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                      text: registeredOnDate,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent.withOpacity(0.1),
                                  elevation: 0,
                                  foregroundColor: Colors.red,
                                  shape: const StadiumBorder(),
                                  side: BorderSide.none),
                              child: const Text(deleteAcc),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}