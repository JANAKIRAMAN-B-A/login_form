import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
       home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override 
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {

  final formkey=GlobalKey<FormState>();
  final scaffoldkey=GlobalKey<ScaffoldState>();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
    body: new Container(
      padding: EdgeInsets.all(40.0),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient (
          begin:  Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1,0.4,0.7,0.9,],
          colors: [
            Colors.purple[600],
            Colors.purple[500],
            Colors.purple[300],
            Colors.purple[200],
          ], 
        ),
      ),
      child: Center(
        child: new ListView(
          shrinkWrap: true,
        children: <Widget>[
          Image.asset("assets/nike_logo.png",
        height: 50.0,
        color: Colors.white,
        ),
        SizedBox(
          height: 50.0,
          ),
          Form( 
            key: formkey,
                 child: Column( 
                   children: <Widget>[ 
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                        {
                          return "please enter the username";
                        } else if (value.length > 8){
                          return "Username should not exceed 8 characters";
                        }
                      },
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle,color: Colors.white),
               hintText: "Username",
               hintStyle: TextStyle(color: Colors.white70),
               ),
          ),
           SizedBox(
          height: 30.0,
          ),
          TextFormField(
            obscureText: true,
            validator: (value) {
                        if(value.isEmpty)
                        {
                          return "please enter the Password";
                        }
                      },
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white),
               hintText: "Password",
               hintStyle: TextStyle(color: Colors.white70),
                    ),
                ),
              ],
            ),
          ),
          SizedBox(
          height: 50.0,
           ),
          Container(
            decoration: BoxDecoration( 
           gradient: LinearGradient (
          begin:  Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1,0.4,0.7,0.9,],
          colors: [
            Colors.purple[600],
            Colors.purple[500],
            Colors.purple[300],
            Colors.purple[200],
          ],
        ),  
      ),
      child: ButtonTheme(
        buttonColor: Colors.white10,
        height: 50.0,
        minWidth: double.infinity,
        child: RaisedButton( 
          onPressed: () {
            if(formkey.currentState.validate())
            {
              scaffoldkey.currentState.showSnackBar(SnackBar(
                content: Text("Form Validated Successfully"),
              ) );
              Navigator.pushReplacement(
                context,
              MaterialPageRoute(
                builder: (context) => FirstPage()
                ));
            } else {
              scaffoldkey.currentState.showSnackBar(SnackBar(
                content: Text("Error in form"),
              ));
             }
          },
          child: Text(
            "LOGIN",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    SizedBox(
          height: 20.0,
          ),
          Text(
            "Forget Password?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),
            ),
            SizedBox(
          height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.asset(
              "assets/google_logo.png",
               height: 30.0,
               ),
               SizedBox(
                 width: 20.0,
               ),
              Image.asset(
                "assets/twitter_logo.png",
                height: 30.0,
                ),
              ],
            )
        ],
      ),
      ), 
    ) );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome Flutter Login Form"),
      ),
    );
  }
}