import 'package:flutter/material.dart';
import 'package:dms_esculape/services/authen.dart';

class HomePage extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  HomePage({this.auth, this.onSignedOut});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    _checkEmailVerification();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Esculape"),
        actions: <Widget>[
          FlatButton(
            child: Text("Logout"),
            onPressed: _signOut,
          ),
        ],
      ),
      body: _showBody(),
    );
  }

  void _checkEmailVerification() async{
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified){
      _showVerifyEmailDialog();
    }
  }

  void _showVerifyEmailDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Verify your account"),
          content: Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            FlatButton(
              child: Text("Resend link"),
              onPressed: (){
                Navigator.of(context).pop();
                _resendVerifyEmail();
              },
            ),
            FlatButton(
              child: Text("Dismiss"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  void _resendVerifyEmail(){
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }
  
  void _showVerifyEmailSentDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Verify your account"),
          content: Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            FlatButton(
              child: Text("Dismiss"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _signOut() async{
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }catch(e){
      print(e);
    }
  }

  Widget _showBody(){

  }
}