import 'dart:io';
import 'dart:typed_data';
import 'package:chatapp_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'constants.dart';
import 'package:path/path.dart' as path;


List<T> getFilteredList<T>(List<T> list, List<bool> bools) {
  return List<T?>.generate(
    list.length,
    (index) => bools[index] ? list[index] : null,
  ).whereType<T>().toList();
}

Future<Directory> getAssetDirectory() async {
    final assetDirectory = Directory("${(await getApplicationDocumentsDirectory()).path}/$pictureBasePath");
    if (!await assetDirectory.exists()) {
      await assetDirectory.create(recursive: true);
    }
  return assetDirectory;
}

Future<int> storeImage(String name, Uint8List bytes) async {
  try {
    Directory assetDirectory = await getAssetDirectory();
    final File imageFile = File('${assetDirectory.path}$name');
    imageFile.writeAsBytes(bytes);
    return 1;
  } catch (e) {
    print(e);
    return 0;
  }
}

void clickImageStandard(BuildContext context, String imageName) async {
          bool done = false;
          bool canceled = false;
          // final imageWidet =
          showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: const RoundedRectangleBorder(),
              backgroundColor:
                  Colors.transparent, // Make the background transparent
              child: Center(
                child: Container(
                  width: 150, // Explicitly set the width of the dialog
                  height: 150, // Explicitly set the height of the dialog
                  decoration: const BoxDecoration(
                    color: Colors.white, // Semi-transparent background
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                      strokeWidth:
                          6.0, // Customize the thickness of the progress indicator
                    ),
                  ),
                ),
              ),
            ),
          ).then((value) {
            // If the state is not done
            print("done? = $done");
            if(!done) {
              canceled = true;
            }
          });
          final imageResponse = await restClient.downloadPicture(
          userMemoryClient.getToken(), imageName, downloadUrl: downloadFullImageUrl);
          var fullImageBytes = imageResponse['FileBytes'];
          done = true;
          print("loaded..");
          if(!canceled) {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (context) => Dialog(
                      shape: const RoundedRectangleBorder(),
                      insetPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 0,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              child: Image.memory(fullImageBytes,
                                  width: double.infinity,
                                  fit: BoxFit.cover)),
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(
                                size: 40,
                                Icons.close,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                // TextButton(
                //   onPressed: () => Navigator.of(context).pop(),
                //   child: const Text('Close'),
                // ),
                );
          }
        }