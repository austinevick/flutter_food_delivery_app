import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              image: AssetImage('assets/images/img1.jpeg'),
            ),
          ),
        ),
        Container(
          height: 250,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Text(
                'Choose a tasty dish',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Text(
                'Order anything you want from us\nand make your day more delicious',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Spacer()
            ],
          ),
        ),
        Positioned(
            bottom: 85,
            left: 100,
            child: Row(
              children: [
                FlatButton(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  width: 20,
                ),
                FlatButton(
                    color: Colors.green,
                    shape: OutlineInputBorder(borderSide: BorderSide.none),
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )),
              ],
            )),
        Positioned(
          bottom: 8,
          left: 150,
          child: FlatButton(
              shape: OutlineInputBorder(borderSide: BorderSide.none),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  )),
              child: Text(
                'Maybe later',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )),
        ),
      ],
    ));
  }
}
