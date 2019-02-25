import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstScreen();
  }
}

class _FirstScreen extends State<FirstScreen> {
  List<String> _passengers = <String>['1', '2', '3', '4', '5', '6'];
  String _passenger = '1';
  DateTime date;
  bool editable = true;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop down page'),
      ),
      body: Column(
        children: <Widget>[
          // InputDecorator(
          //   decoration: const InputDecoration(
          //       icon: const Icon(Icons.airplanemode_active),
          //       labelText: 'Passenger'),
          //   isEmpty: _passenger == '',
          //   child: DropdownButtonHideUnderline(
          //     child: DropdownButton(
          //       value: _passenger,
          //       isDense: true,
          //       onChanged: (String value) {
          //         setState(() {
          //           _passenger = value;
          //         });
          //       },
          //       items: _passengers.map((String value) {
          //         return DropdownMenuItem(
          //           child: Text(value),
          //           value: value,
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // ),
          // DateTimePickerFormField(
          //   inputType: InputType.date,
          //   format: DateFormat('yyyy-MM-dd'),
          //   decoration: InputDecoration(labelText: 'Date'),
          //   editable: editable,
          //   onChanged: (dt) => setState(() => date = dt),
          // ),
          Center(
            child:
                _image == null ? Text('No image selected') : Image.file(_image, height: 500),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
