import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig Weight Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Text(
                    'PIG WEIGHT',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'CALCULATOR',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage('assets/images/pig.png'), height: 160.0,),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 0.0),
                              spreadRadius: 0.0,
                              blurRadius: 1.0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("LENGTH"),
                              Text("(cm)"),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: TextField(
                                  controller: _controller1,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: 'Enter length',
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 0.0),
                              spreadRadius: 0.0,
                              blurRadius: 1.0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Text("GIRTH"),
                              Text("(cm)"),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _controller2,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: 'Enter girth',
                                  ),

                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('CALCULATE',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: (){
                      var inputlength = _controller1.text;
                      var inputgirth = _controller2.text;
                      var length =  double.tryParse(inputlength);
                      var girth = double.tryParse(inputgirth);


                      if(length == null || girth == null){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('ERROR'),
                              content: Text("Invalid input"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else{
                        var pricpig = 112.50;
                        length = length/100;
                        girth = girth/100;
                        var weight = girth * girth * length * 69.3;
                        var sumprice = weight * pricpig;
                        var dweight = (weight - (0.03 * weight)).round();
                        var dsum = (sumprice - (0.03 * sumprice)).round();
                        var uweight = ((0.03 * weight) + weight).round();
                        var usum = (sumprice + (0.03 * sumprice)).round();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('RESULT'),
                              content: Text("Weight: $dweight - $uweight kg\nPrice: $dsum - $usum Baht"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                    },
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );


  }
}