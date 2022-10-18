import 'package:image_picker/image_picker.dart';

pickImage(ImageSource imageSource) async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? _file = await imagePicker.pickImage(source: imageSource);

  if (_file != null) {
    return _file.readAsBytes();
  }
  print("No image selected");
}
