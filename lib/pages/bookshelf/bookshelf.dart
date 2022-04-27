import 'package:flutter/material.dart';

class BookShelfPage extends StatefulWidget {
  const BookShelfPage({Key? key}) : super(key: key);

  @override
  State<BookShelfPage> createState() => _BookShelfPageState();
}

class _BookShelfPageState extends State<BookShelfPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE1EDFF),
      width: double.infinity,
      height: double.infinity,
      child: Text('书架BookShelfPage'),
    );
  }
}
