import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpdateGallery extends StatelessWidget {
  const UpdateGallery({super.key});


  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text(editGallery,
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
            const Text("Upload images to curate your mystery"),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        const SizedBox(
                          width: galleryImageWidth,
                          height: galleryImageHeight,
                          child: ClipRRect(
                              child: Image(
                                  image: AssetImage(profilePicturePath))),
                        ),
                        const SizedBox(
                          width: galleryImageWidth,
                          height: galleryImageHeight,
                          child: ClipRRect(
                              child: Image(
                                  image: AssetImage(profilePicturePath))),
                        ),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                              color: Colors.white38,                              
                              width: galleryImageWidth,
                              height: galleryImageHeight,                          
                              child: const ClipRRect(
                                  child: Icon(Icons.upload, size: 32,)),),
                        ),                        
                      ],
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
                            child: const Text(submitChanges,
                                style: TextStyle(color: darkColor)),
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
