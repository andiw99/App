import 'package:chatapp_frontend/components/gallerayimage.dart';
import 'package:chatapp_frontend/main.dart';
import 'package:chatapp_frontend/src/constants.dart';
import 'package:chatapp_frontend/src/functions.dart';
import 'package:chatapp_frontend/src/restapi.dart';
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
  List<String> _images = [];
  List<String> _cachedImages = [];
  List<bool> _checkedImages = [];
  Directory _assetDirectory = Directory("");

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      if (context.mounted) {
        Navigator.pop(context); // Close the bottom sheet
        // TODO do we want to write the image to the disk? Probably not? maybe cache it?

        // so we just want to upload it
        final statuscode =
            await restClient.upload(userMemoryClient.getToken(), pickedFile);
        // For now, just show a simple dialog with the file path
        if (statuscode == 201) {
          _getImages();          
        }
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
            height: 205, // Adjust height as needed
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

  void _getImages() async {
    _assetDirectory = await getAssetDirectory();
    _cachedImages = await repositoryClient
        .getGalleryPictures((await repositoryClient.getProfile())['id']);
    setState(() {
      _images = _cachedImages;
      _checkedImages = List.filled(_images.length, false);
    });

    if (userMemoryClient.getToken().isNotEmpty) {
      _images =
          await restClient.getGalleryPictures(userMemoryClient.getToken());
    }
    // check if we already know thi
    List<String> downloadableImages = [];
    for (var image in _images) {
      // most gallery pictures will be cached
      if (!_cachedImages.contains(image)) {
        downloadableImages.add(image);
      }
    }

    // dowload new images
    _downloadImages(downloadableImages);
  }

  void _downloadImages(List<String> images) async {
    // add newly downloaded pictures to db
    var profileId = (await repositoryClient.getProfile())['id'];
    for (var image in images) {
      var imageResponse =
          await restClient.downloadPicture(userMemoryClient.getToken(), image);
      int statuscode = imageResponse['status'];
      if (statuscode == 1) {
        // can this already happen when the picture is not fully downloaded?
        print("Successfully downloaded picture, adding it to DB");
        // should the repository client save the File? Not for now...
        var imageBytes = imageResponse['FileBytes'];
        await storeImage(image, imageBytes);
        repositoryClient.addGalleryPicture(profileId, image);
        setState(() {
          _images = _images;
          _checkedImages = List.filled(_images.length, false);
        });
      } else {
        print("Error downloading... statuscode $statuscode");
      }
    }
  }

  void _deleteImages(List<String> images) async {
    // will call a method from the restClient obviously
    // probably just one image at a time
    // should also delete the cached image on the phone
    for (var image in images) {
      int statuscode =
          await restClient.deletePicture(userMemoryClient.getToken(), image);
      if (statuscode == 1) {
        // can this already happen when the picture is not fully downloaded?
        print("Successfully deleted picture, removing it from DB");
        repositoryClient.removeGalleryPicture(image);
        _images.remove(image);
      } else {
        print("Error downloading... statuscode $statuscode");
      }
    }
    setState(() {
          _images = _images;
          _checkedImages = List.filled(_images.length, false);
        });
  }


  void _checkBox(bool? value, int index) {
      setState(() {
        if (value == true) {
          _checkedImages[index] = true;
        } else {
          _checkedImages[index] = false;
        }
      });
  }

  @override
  void initState() {
    super.initState();
    _getImages();
    // similar to the friends page, we need a function that checks for available pictures. If it knows the pictures already and has cached
    // it, the pictures should be loaded from cache. Otherwise they should be downloaded and cached
    // is there already an interface for retrieving pictures?
    // _retrieveFriends();
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
            SizedBox(
              height:
                  400, // TODO how do I build it so it stretches the whole screen?
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.count(
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 3, // 3 pictures per row
                  children: [
                    ...List.generate(_images.length, (index) {
                      return galleryImageWidget(
                        image: File("${_assetDirectory.path}${_images[index]}"),
                        onPress: (value) {_checkBox(value, index);},
                        checked: _checkedImages[index]);                    
                    }),
                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () => _showImageSourceSelection(context),
                        child: Container(
                          color: Colors.white38,
                          width: galleryImageWidth,
                          height: galleryImageHeight,
                          child: const ClipRRect(
                              child: Icon(
                            Icons.upload,
                            size: 32,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),                
              ),
            ),
            const SizedBox(height: formHeight),

            Row(
              children: [
                if (_checkedImages.any((value) => value))
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {_deleteImages(getFilteredList(_images, _checkedImages));},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: alertColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(deleteString,
                            style: TextStyle(color: darkColor)),
                      ),
                    ),
                  ),                
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
