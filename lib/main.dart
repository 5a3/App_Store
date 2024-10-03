import 'package:flutter/material.dart';
import 'package:store_app/screen/updateprodect.dart';
import 'screen/homepage.dart';

void main(List<String> args) {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              buttonColor: Color.fromARGB(255, 255, 136, 0)),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Color.fromARGB(255, 255, 140, 0),
          )),
      routes: {
        homepage.id: (context) => homepage(),
        updateProdect.id: (context) => updateProdect(),
      },
      initialRoute: homepage.id,
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
