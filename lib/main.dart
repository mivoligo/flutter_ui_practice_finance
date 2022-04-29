import 'package:dribble_finance/widgets/nav_button.dart';
import 'package:flutter/material.dart';

import 'widgets/current_balance.dart';
import 'widgets/my_goals.dart';
import 'widgets/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pay.Co',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/images/duck.jpg'),
              child: Text('A'),
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Divider(height: 24),
              CurrentBalance(
                balance: '123,000.65',
                growth: '1.76',
              ),
              SizedBox(height: 12),
              Transactions(),
              SizedBox(height: 12),
              MyGoals(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavButton(
              iconData: Icons.home,
              onPressed: () {},
              selected: true,
            ),
            NavButton(
              iconData: Icons.savings,
              onPressed: () {},
            ),
            NavButton(
              iconData: Icons.send,
              onPressed: () {},
            ),
            NavButton(
              iconData: Icons.paid,
              onPressed: () {},
            ),
            NavButton(
              iconData: Icons.settings,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
