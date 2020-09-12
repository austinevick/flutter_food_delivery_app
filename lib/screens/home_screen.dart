import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/data/data.dart';
import 'package:flutter_food_delivery_app/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_app/widgets/recent_order.dart';

import 'restaurant_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading:
              IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
          actions: [
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Cart (${currentUser.cart.length})',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
          title: Text('Food Delivery')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search Food or Restaurants',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Theme.of(context).primaryColor,
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2)),
            ),
            buildRestaurant()
          ]),
        ],
      ),
    );
  }

  buildRestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach((restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => RestaurantScreen(restaurant: restaurant),
          )),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[200],
                ),
                borderRadius: BorderRadius.circular(
                  15,
                )),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        restaurant.imageUrl,
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingStars(restaurant.rating),
                      Text(restaurant.address),
                      Text('0.2 miles away'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: restaurantList);
  }
}
