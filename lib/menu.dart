import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {

    // Push the page and remove everything else
    navigateToPage(BuildContext context, String page) {
        Navigator.of(context).pushNamed(page);
    }

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child:
            ListView(
                children:  <Widget>[
                    ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Default'),
                        onTap: () => navigateToPage(context, 'Default'),
                    ),
                    ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                        onTap: () => navigateToPage(context, 'About'),
                    ),
                ],
            ),
        );
    }
}