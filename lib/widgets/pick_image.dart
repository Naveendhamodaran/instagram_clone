import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  // Pick an image
  final XFile? file = await imagePicker.pickImage(source: source);
  // // Capture a photo
  // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  if (file != null) {
    return await file.readAsBytes();
  }
  print('no image selected');
}
