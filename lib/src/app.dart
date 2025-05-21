import 'package:flutter/material.dart';
import 'package:http/http.dart' show get; // we only need the get method
import 'dart:convert' show jsonDecode; // for jsonDecode
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

// Initiate a copy of the state class that is specific to the App widget
class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    setState(() {
        counter++;
      });
    var res = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    if (res.statusCode == 200) {
      var imageModel = ImageModel.fromJson(jsonDecode(res.body));

      setState(() {
        images.add(imageModel);
      });
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load image');
    }
  
  }
 
  String name = 'Flutter App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images: images),
        floatingActionButton: FloatingActionButton(
          onPressed:fetchImage,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Let\'s see some images!'),
        ),
      ),
    );
  }
}
