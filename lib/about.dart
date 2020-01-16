import 'package:flutter/material.dart';
import 'menu.dart';

class AboutPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            drawer: MenuDrawer(),
            appBar: AppBar(
                title: Text('About'),
            ),
            body: Center(
                child: Text('merzlyakov.pro, 2019 (c)'),
            ),
        );
    }
}