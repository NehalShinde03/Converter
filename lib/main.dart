import 'package:conveter/dash.dart';
import 'package:conveter/sizedconfig.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return OrientationBuilder(
          builder: (context,orientation) {
            SizedConfig().init(constraints, orientation);
            return dash();
          }
        );
      }
    );
  }
}
