import 'package:flutter/material.dart';
import 'package:foodie/models/order.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/widgets/recent_orders.dart';
import 'package:foodie/widgets/nearby_restaurants.dart';

class HomeScreen extends StatefulWidget {
  // _buildRecentOrder(BuildContext context) {
  //   return
  // }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                iconSize: 25,
                onPressed: () {
                  print('Home screen cart button got pressed');
                },
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Center(
                  child: Text(
                      '${currentUser.cart == null ? 0 : currentUser.cart!.length} items'),
                ),
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: ListView(
          physics: BouncingScrollPhysics(),
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
            ),
            RecentOrder(
              orders: currentUser,
            ),
            NearbyRestaurant(nearbyRestaurants: restaurants),
          ],
        ),
      ),
    );
  }
}
