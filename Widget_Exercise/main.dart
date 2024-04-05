import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: const Icon(
            Icons.help_outline,
            color: Colors.white,
          ),
          title: const Text(
            'ijTracker',
            style: TextStyle(color: Colors.white),
          ),
          actions: const [
            Icon(
              Icons.notification_add,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            )
          ],
        ),
        body: Column(
          children: [
            const ListTile(
              leading: Icon(
                Icons.coffee,
                color: Colors.blue,
                size: 20,
              ),
              title: Text(
                'Robert Steven',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.local_taxi,
                    color: Colors.blue,
                  ),
                  Text(
                    '      20572904 | 23887234957',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Online | Battery: 90%',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.map_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        Text('Map')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        Text('Location')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.history_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        Text('History Location')
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.map_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        Text('GeoReference')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        Text('Detail Info')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.history_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        Text('Edit Device')
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.map_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        Text('change counter number')
                      ],
                    ),
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Icon(
                      Icons.history_rounded,
                      color: Colors.blue,
                      size: 40,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.map_rounded,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Icon(
                      Icons.history_rounded,
                      color: Colors.blue,
                      size: 40,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.map_rounded,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Icon(
                      Icons.history_rounded,
                      color: Colors.blue,
                      size: 40,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
