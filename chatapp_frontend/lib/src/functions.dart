import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'constants.dart';

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