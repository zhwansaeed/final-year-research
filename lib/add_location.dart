import 'package:flutter/material.dart';



class addNewLocation extends StatefulWidget {
  const addNewLocation({super.key});
 
  @override
  State<addNewLocation> createState() => _addNewLocationState();
}

class _addNewLocationState extends State<addNewLocation> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _xController = TextEditingController();
  TextEditingController _yController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _imageController.dispose();
    _xController.dispose();
    _yController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Location'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'image',
              ),
            ),
            SizedBox(height: 20.0),
            // TextField(
            //   controller: _imageController,
            //   decoration: InputDecoration(
            //     labelText: 'Image URL', 
            //   ),
            // ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _xController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Latitude'
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _yController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Longitude',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                  
                  String name = _nameController.text;
                  String imageURL = _imageController.text; 
                  double x = double.tryParse(_xController.text) ?? 0.0;
                  double y = double.tryParse(_yController.text) ?? 0.0;
                  
                  print('Name: $name, Image URL: $imageURL, X: $x, Y: $y'); 
                },
                child: Text('Send Map Address'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddLocationScreen extends StatefulWidget {
  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _xController = TextEditingController();
  TextEditingController _yController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Location'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'Image URL', 
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _xController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Latitude',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _yController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Longitude',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                  
                  String name = _nameController.text;
                  String imageURL = _imageController.text; 
                  double x = double.tryParse(_xController.text) ?? 0.0;
                  double y = double.tryParse(_yController.text) ?? 0.0;
                 
                  print('Name: $name, Image URL: $imageURL, X: $x, Y: $y'); 
                },
                child: Text('Send Map Address'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageController.dispose();
    _xController.dispose();
    _yController.dispose();
    super.dispose();
  }
}

