import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

class HomePage extends StatefulWidget {
  final String username;
 
  const HomePage({Key? key, required this.username}) : super(key: key);
 
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends Stateful