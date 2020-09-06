import 'package:flutter/material.dart';
// import "package:flutter/widgets.dart.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Contador de Pessoas',
    home: Home()));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people= 0;
  String _infoText = 'Pode entrar!';

  void _changePeople(int delta){
    setState(() {
      _people += delta;
    });

    if(_people< 0){
      _infoText = 'Inválido';
    }
    else if(_people <= 10){
      _infoText = 'Pode entrar!';
    }
    else{
      _infoText = 'Estamos lotados, aguarde sua vez';
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              Image.asset(
                'assets/images/restaurant.jpg',
                fit: BoxFit.cover,
                height: 1000.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Pessoas:$_people',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: FlatButton(
                            onPressed: () {
                              _changePeople(1);
                            },
                            child: Text('+1',
                                style: TextStyle(fontSize: 40, color: Colors.white))),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: FlatButton(
                            onPressed: () {
                              _changePeople(-1);
                            },
                            child: Text('-1',
                                style: TextStyle(fontSize: 40, color: Colors.white))),
                      )
                    ],
                  ),
                  Text(_infoText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 25.0))
                ],
              )]));
  }
}
