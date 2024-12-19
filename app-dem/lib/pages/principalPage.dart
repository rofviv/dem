import 'package:app_dem/models/Categories.dart';
import 'package:app_dem/models/ListCategories.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  final ListCategories _lstElement = ListCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002b59),
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: Icon(Icons.menu),
        title: Text("DEM Santa Cruz"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Roy Favio'),
              accountEmail: Text('royvillarroel94@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('R'),
              ),
            ),
            ListTile(
              title: Text('Page'),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Cerrar Sesión'),
              trailing: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Card(
                  margin: EdgeInsets.all(2.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Image.asset('assets/llamar.png'),
                          title: Text('Llamar 800-12-5050'),
                          subtitle: Text('Ubicación NO disponible'),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 10.0,),
              Expanded(
                child: Container(
                  child: GridView(
                    physics: BouncingScrollPhysics(), // Solo para iOS
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: _lstElement.getList().map((item) {
                      return GestureDetector(
                        child: Card(
                          margin: EdgeInsets.all(4.0),
                          child: _getCard(item),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/categories', arguments: {'category': item});
                        },
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _getCard(Categories item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
            child: new Stack(
              children: <Widget>[
                new Image.asset(
                  'assets/${item.img}',
                  width: 80.0,
                  height: 80.0,
                )
              ],
            ),
          ),
        ),
        Text(
          item.title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
