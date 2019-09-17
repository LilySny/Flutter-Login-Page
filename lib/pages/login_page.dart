import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:login_page/blocs/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fkey = GlobalKey<FormState>();
  final loginBloc = LoginBloc();
  final errorLoggingSnack = SnackBar(
      backgroundColor: Colors.red, content: Text('Invalid Email or Password!'));
  final loginSnack =
      SnackBar(backgroundColor: Colors.green, content: Text('You LoggedIn!'));
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150.0,
                  child: TypewriterAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        "Welcome to PodipaChat,",
                        "Please Login into your account!",
                      ],
                      textStyle: TextStyle(
                        fontSize: 40.0,
                      ),
                      textAlign: TextAlign.center,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: _fkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onSaved: (string) {
                            //loginBloc.emailEvent.add();
                        },
                        validator: (e) => e.contains("@") && e.contains(".")
                            ? null
                            : "O valor colocado não é um email!",
                       
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1.0)),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      ),
                      TextFormField(
                        validator: (e) => e.length >= 8 && e.length <= 16
                            ? null
                            : "A senha deve conter no mínimo 8 caractéres e o máximo de 16",
                      
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key),
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(1.0)),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonTheme(
                    minWidth: 100.0,
                    height: 40.0,
                    child: RaisedButton.icon(
                      icon: Icon(Icons.arrow_forward),
                      label: Text(
                        "Enter",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () {
                        if (_fkey.currentState.validate()) {
                          _fkey.currentState.save();

                         // loginBloc.login();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => 
                                  Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Center(child: Text("Você foi logado com sucesso!", 
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 30, decoration: TextDecoration.none)),),
                                  )));
                          // Scaffold.of(context).showSnackBar(errorLoggingSnack);
                        }
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
