import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';

class UpdateGallery extends StatefulWidget {
  const UpdateGallery({super.key});

  @override
  State<UpdateGallery> createState() => _UpdateGalleryState();
}

class _UpdateGalleryState extends State<UpdateGallery> {

    Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      if (context.mounted) {
      Navigator.pop(context); // Close the bottom sheet
      // TODO do we want to write the image to the disk? Probably not? maybe cache it?

      // so we just want to upload it
      final statuscode = await restClient.upload(userMemoryClient.getToken(), pickedFile);

      // For now, just show a simple dialog with the file path

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Selected Image'),
          content: Text('$statuscode'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    }
  }

  void _showImageSourceSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 205,  // Adjust height as needed
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text('Select image from'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Gallery'),
                  onTap: () {
                    _pickImage(context, ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Camera'),
                  onTap: () {
                    _pickImage(context, ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
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
                          child: GestureDetector(
                            onTap: () => _showImageSourceSelection(context),
                            child: Container(
                                color: Colors.white38,                              
                                width: galleryImageWidth,
                                height: galleryImageHeight,                          
                                child: const ClipRRect(
                                    child: Icon(Icons.upload, size: 32,)),),
                          ),
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
