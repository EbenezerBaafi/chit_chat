
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{

  double? _deviceHeight;
  double? _deviceWidth;

  GlobalKey<FormState>? _formKey;

  _LoginPageState(){
    _formKey = GlobalKey<FormState>();
  }


  @override
  Widget build(BuildContext context){
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Align(
        alignment: Alignment.center,
        child: _loginPageUi(),
      ),
    );
  }
  Widget _loginPageUi(){
    return Container(
      height: _deviceHeight !* 0.60,
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth !* 0.05),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _headingWidget(),
          _inputForm(),
          _loginButton(),
          _registerButton(),
        ],
      ),
    );
  }
  Widget _headingWidget(){
    return Container(
      height: _deviceHeight! * 0.12,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Welcome Back!',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700
          ),
        ),
        Text(
          'Please Login into your account',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200),
        )
      ],
    ),
    );
  }
  Widget _inputForm(){
    return Container(
      height: _deviceHeight !* 0.16,
      child: Form(
        key: _formKey,
        onChanged: (){},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _emailTextField(),
            _passwordTextField()
          ],
        ),
      ),
    );
  }
  Widget _emailTextField (){
    return TextFormField(
      autocorrect: false,
      style: TextStyle(
        color: Colors.white
      ),
      validator: (_input) {},
      onSaved: (_input) {},
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Email Adress',
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
      ),
    );
  }
  Widget _passwordTextField (){
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      style: TextStyle(
        color: Colors.white
      ),
      validator: (_input) {},
      onSaved: (_input) {},
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
      ),
    );
  }
  Widget _loginButton(){
    return Container(
      height: _deviceHeight !* .06,
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: (){},
        color: Colors.lightBlue,
        child: Text(
          'Login',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
  Widget _registerButton(){
    return GestureDetector(
      onTap: (){
        print('heyy');
      },
      child: Container(
        height: _deviceWidth !* 0.06,
        width: _deviceWidth,
        child: Text(
          'REGISTER',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
      ),
    );
    }
  }