import 'package:flutter/material.dart';
import 'package:foodie/models/order.dart';
import 'package:foodie/data/data.dart';
import 'package:foodie/widgets/recent_orders.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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

            ///TODO- Refractor It
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  child: Text(
                    'Nearby Restaurants',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // height: 120,
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                height: 120,
                                width: 120,
                                image: AssetImage(restaurants[index].imageUrl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    restaurants[index].name!,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  RatingBarIndicator(
                                    rating:
                                        restaurants[index].rating!.toDouble(),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    restaurants[index].address!,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Distance: ${restaurants[index].distance.toString()} km',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: restaurants.length,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
