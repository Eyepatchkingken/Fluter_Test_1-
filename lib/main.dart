import 'package:flutter/material.dart';
/* make the drawers open a new page that contain tabs
each tab view containing a button and each button displaying a snackbar
*/
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final appName = "Testing"; // created a variable containing the app's name
  final appBarColour = Color(0xfffcc9b9); // variable containing the appbar's colour
  final accentColour = Color(0xfffdd023); // accent/secondary colour of the app
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: appName,
        theme: ThemeData( // defining the app's theme
          appBarTheme: AppBarTheme( 
            color: appBarColour,
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColour, brightness: Brightness.dark)
        ),
        home: homePage(), //calling the homePage class
    );
  }
}

// the class containing the drawer
class homePage extends StatefulWidget{
  final appName = "Testing";
  /* final String titleText; //parameter for the constructor
  drawerClass({Key? key, required this.titleText}): super(key: key); //drawerClass constructor
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Account Info"),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary
                ),
                ),
                ListTile(
                  title: Text("Settings"),
                  onTap: () {
                    return;
                  },
                ),
                ListTile(
                  title: Text("About app"),
                  onTap: () {
                   
                  },)
            ],
          ),
        ),
    );
  } */
 @override
  State<StatefulWidget> createState() {
    // calling the drawerClass
    return drawerClass(titleText: appName); // the drawer class becomes the home page
  } 
}

class drawerClass extends State<homePage>{
  final String titleText; //parameter for the 
    
  drawerClass({Key? key, required this.titleText}); //drawerClass constructor
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
        drawer: Drawer( //creating a drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader( 
                child: Text("Account Info"),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary //setting the theme of the drawer header
                ),
                ),
                ListTile(
                  title: Text("Settings"),
                  onTap: () {
                    //the settings drawer calls the settingsAppBar class which is a page containing an app bar
                    Navigator.push(context, MaterialPageRoute(builder: (context) => settingsAppBar()));
                  },
                ),
                ListTile(
                  title: Text("About app"),
                  onTap: () {
                   
                  },)
            ],
          ),
        ),
    );
  }
  

}

class settingsAppBar extends StatelessWidget{
  final appBarColour = Color(0xfffcc9b9); // variable containing the appbar's colour
  final accentColour = Color(0xfffdd023); // accent/secondary colour of the app
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData( // defining the app's theme
          appBarTheme: AppBarTheme(
            color: appBarColour,
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColour, brightness: Brightness.dark)
        ),
      home: DefaultTabController( //creating the tab bar
        length: 2, //setting the number of tabs
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            bottom: const TabBar(tabs: <Widget>[
                Tab(icon: Icon(Icons.settings),), //the first tab is a settings icon
                Tab(icon: Icon(Icons.settings_accessibility),) //the second tab is a settings accesibility icon
            ]),
            title: Text("Settings Tab"), // title of the tab bar
          ),
          body: TabBarView(children: <Widget>[ //array of widgets containing the tab bars functions
            Center( //the first tab contains a button that is centrally oriented
            child: ElevatedButton( 
              onPressed: (){ //the button should show a snack bar when pressed
                final snackbar = SnackBar( 
                  content: Text("Settings tab button clicked"), // text the snap bar shows when created
                  action: SnackBarAction(label: "close", 
                  onPressed: (){

                  }),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar); //showing the snackbar
              }, 
              child: Text("Settings Tab") )  //title of the elevated button
                ),
           Center( //the second tab contains a button that is centrally oriented
              child: 
              ElevatedButton(onPressed: (){ //the button should show a snack bar when pressed
                final snackbar2 = SnackBar(content: Text("Settings accesibility button pressed"), // text the snap bar shows when created
                action: SnackBarAction(label: "Close",
                 onPressed: (){
                  
                 }),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar2);//showing the snackbar
              }, child: Text("Settings Accesibility Tab")), //title of the elevated button
              )
              
          ]
          ),
        ),
       ),
    );
    
  }
}


