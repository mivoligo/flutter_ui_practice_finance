import 'package:dribble_finance/screens/chart_screen.dart';
import 'package:dribble_finance/screens/main_screen.dart';
import 'package:dribble_finance/widgets/nav_button.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

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
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          MainScreen(),
          ChartScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavButton(
              iconData: Icons.home,
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              selected: selectedIndex == 0,
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
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              selected: selectedIndex == 1,
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
