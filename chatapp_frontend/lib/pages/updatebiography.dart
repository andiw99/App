import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';

class UpdateBiography extends StatelessWidget {
  const UpdateBiography({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text(editBiography,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(children: [
            // -- IMAGE with ICON
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                          const Image(image: AssetImage(profilePicturePath))),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // -- Form Fields
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      // Set minimum and maximum lines
                      minLines: 6, // You can adjust this value as needed
                      maxLines: null, // Grow the text field as needed
                      initialValue: myBiography,
                      decoration: const InputDecoration(
                        labelText: writeBiography,
                        border: OutlineInputBorder(),
                        alignLabelWithHint:
                            true, // Align label with the top of the field
                      ),
                    ),
                    const SizedBox(height: formHeight),
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
                  ],
                ),
              ),
            ),

          ]),
        ),
      ),
    );
  }
}
