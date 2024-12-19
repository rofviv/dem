import 'package:app_dem/models/Categories.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  Map _data = {};

  @override
  Widget build(BuildContext context) {
    _data =
        _data.isNotEmpty ? _data : ModalRoute.of(context).settings.arguments;
    Categories _category = _data['category'];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(0xFF002b59),
        title: Text(_category.title),
        centerTitle: false,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: _category.sub.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  //
                },
                title: Text(_category.sub[index].type),
                subtitle: Text(_category.sub[index].description),
                // leading: CircleAvatar(
                //   backgroundImage: AssetImage(_category.sub[index].img),
                //   backgroundColor: Colors.white,
                // ),
                leading: new Image.asset(
                  'assets/${_category.sub[index].img}',
                  width: 56.0,
                  height: 56.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
