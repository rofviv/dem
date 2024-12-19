import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final List<IconData> _icons = [
    FontAwesomeIcons.ambulance,
    FontAwesomeIcons.fire,
    FontAwesomeIcons.handsHelping
  ];

  void _loginFacebook() {
    // Navigator.pushNamed(context, '/principal');
    Navigator.pushReplacementNamed(context, '/principal');
  }

  @override
  Widget build(BuildContext context) {

    Widget _buildIconAmbulance() {
      return Container(
        height: 48.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: Colors.green[600],
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Icon(
          _icons[0],
          size: 22.0,
          color: Colors.grey[50],
        ),
      );
    }

    Widget _buildIconFire() {
      return Container(
        height: 48.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent[400],
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Icon(
          _icons[1],
          size: 22.0,
          color: Colors.grey[50],
        ),
      );
    }

    Widget _buildIconRescue() {
      return Container(
        height: 48.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: Colors.blue[600],
          borderRadius: BorderRadius.circular(30.0)
        ),
        child: Icon(
          _icons[2],
          size: 22.0,
          color: Colors.grey[50],
        ),
      );
    }

    final _logo = Hero(
      tag: 'hero',
      // child: CircleAvatar(
      //   backgroundColor: Colors.white,
      //   radius: 60.0,
      //   child: Image.asset('assets/dem.png'),
      // ),
      child: Image.asset('assets/dem.png')
    );

    final _txtDem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Departamento de Emergencias Municipal',
        style: TextStyle(fontSize: 14.0, color: Color(0xFFf9b200)),
        textAlign: TextAlign.center,
        ),
    );

    final _btnCall = FlatButton(
      child: Text(
        'Llámanos 800-12-5050',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        // LLAMAR
      },
    );

    final _background = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(28.0),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(colors: [
      //     Color(0xFF002b59),
      //     Color(0xFF002b59)
      //   ])
      // ),
      child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _logo,
              SizedBox(height: 8.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildIconAmbulance(),
                  _buildIconFire(),
                  _buildIconRescue()
                ],
              ),
              SizedBox(height: 16.0,),
              // _txtDem,
              SizedBox(height: 16.0,),
              FacebookSignInButton(text: 'Continuar con Facebook', onPressed: () {
                _loginFacebook();
              }),
              SizedBox(height: 16.0,),
              _btnCall
            ],
          ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFF002b59),
      // body: Center(
      //   child: _background
      // ),
      body: _background,
    );
  }
}