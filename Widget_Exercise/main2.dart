// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Card(
            child: Row(
          children: [Icon(Icons.search), Text('Search Product')],
        )),
        actions: [Icon(Icons.shopping_cart), Icon(Icons.notifications)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/car.jpg'),
          Container(
            padding: EdgeInsets.all(20),
            child: ListTile(
              leading: Text(
                '\$8.6',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.favorite),
            ),
          ),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [Icon(Icons.star), Text('5.0(341)')],
              ),
              Row(
                children: [Text('541 Sale')],
              ),
              Row(
                children: [Icon(Icons.location_on_rounded), Text('5.0(341)')],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Variant',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          Text(
            'Size: XS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Chip(
                  label: Text(
                'XS',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Chip(
                  label: Text(
                'XS',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Chip(
                  label: Text(
                'XS',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Chip(
                  label: Text(
                'XS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            ],
          ),
          Text(
            'Color: Red',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Chip(
                  label: Text(
                'XS',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Chip(
                  label: Text(
                'XS',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Chip(
                  label: Text(
                'XS',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              Chip(
                  label: Text(
                'XS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            ],
          ),
          ListTile(
            leading: Icon(Icons.comment_bank_outlined),
            title: TextButton(
              onPressed: () {},
              child: Text('Add to Shopping Cart'),
            ),
          )
        ],
      ),
    ),
  ));
}

