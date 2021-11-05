import 'package:flutter/material.dart';
import 'package:foodie/models/order.dart';
import 'package:foodie/data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('FOODIE')),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            child: Text(
              'Cart  ${currentUser.cart == null ? 0 : currentUser.cart!.length} items',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                  enabled: true,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8, color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor))),
            )
          ],
        ),
      ),
    );
  }
}
