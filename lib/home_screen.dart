import 'package:flutter/material.dart';
import 'package:levys_books_rating/nav_bar.dart';
import 'consts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: heightOfAppbar,
            child: NavBar(),

          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.redAccent,
                ),
                Container(
                  width: 300,
                  height: 200,
                  color: Colors.grey,
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  void searchBook(String bookName) {
    print(bookName);
  }

  AppBar createAppBar() {
    return AppBar(
      title: Row(
//        mainAxisAlignment: MainAxisAlignment,
        children: [
          const Text(
            websiteTitle,
            style: TextStyle(
              fontFamily: appbarTitleFont,
              fontWeight: appbarTitleFontWeight,
              fontSize: 35,
            ),
            textAlign: TextAlign.right,
          ),
          Padding(padding: EdgeInsets.all(paddingSearchAndTile(MediaQuery. of(context). size. width))),
          Container(
            width: widthOfSearchBox(MediaQuery. of(context). size. width),
            height: heightOfSearchBox,
            decoration: BoxDecoration(color: primaryColorMaterial.shade50),
            child: Center(
              child: TextField(
                controller: _searchController,
                onSubmitted: (String searchValue) {
                  searchBook(searchValue);
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      searchBook(_searchController.value.text);
                      },
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                  hintText: 'Search book name',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(paddingSearchAndTile(MediaQuery. of(context). size. width))),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.help),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.language),
          onPressed: () {},
        )
      ],
    );


  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
