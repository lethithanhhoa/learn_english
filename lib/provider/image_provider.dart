import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyImageProvider  {
  // String image;
  // MyImageProvider(this.image);
  @override
  Widget build(BuildContext context) {
    return FutureProvider<String>.value(
      value: getImage(),
      child: MyImage(),
    );
  }

  Future<String> getImage() async {
    final ref = FirebaseStorage.instance.ref().child('screen_2.jpg');
    var url = await ref.getDownloadURL();
    return url;
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, index) {
      return Image.network(value);
    });
  }
}
