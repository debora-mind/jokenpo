import 'package:flutter/material.dart';
import 'dart:math';

class Jokenpo extends StatefulWidget {
  const Jokenpo({super.key});

  @override
  State<Jokenpo> createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  var _appSelected = 'default';
  var _result = 'Escolha uma opção abaixo';
  var _pointsApp = 0;
  var _pointsUser = 0;

  void selectedOption(String userSelected) {
    final options = ['paper', 'stone', 'scissors'];
    int randomNumber = Random().nextInt(options.length);
    _appSelected = options[randomNumber];

    if (_appSelected == userSelected) {
      _result = 'Empate!';
    } else if ((_appSelected == 'stone' && userSelected == 'paper') ||
        (_appSelected == 'paper' && userSelected == 'scissors') ||
        (_appSelected == 'scissors' && userSelected == 'stone')) {
      _result = 'Parabéns, você venceu! :D';
      _pointsUser++;
    } else {
      _result = 'Que pena, você perdeu! :(';
      _pointsApp++;
    }

    setState(() {
      _appSelected = _appSelected;
      _result = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JokenPo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        alignment: AlignmentGeometry.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(top: 32, bottom: 16),
              child: Text(
                'Escolha do App:',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Image.asset('images/$_appSelected.png'),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 32, bottom: 16),
              child: Text(
                _result,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => selectedOption('stone'),
                  child: Image.asset('images/stone.png', height: 100),
                ),
                GestureDetector(
                  onTap: () => selectedOption('paper'),
                  child: Image.asset('images/paper.png', height: 100),
                ),
                GestureDetector(
                  onTap: () => selectedOption('scissors'),
                  child: Image.asset('images/scissors.png', height: 100),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 36, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'App',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _pointsApp.toString(),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Você',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _pointsUser.toString(),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
