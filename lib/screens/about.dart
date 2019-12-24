import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {

  _launchProfileURL() async {
    const url = 'https://www.linkedin.com/in/lamsanskar/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16,20,16,50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16,16,16,50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text('''App Privacy Policy Generator is a simple Flutter App that can be used to generate generic Privacy Policy and Terms & Conditions for your apps Made by Sanskar Tiwari.
                          \nIf you would like to request for more options of choosing privacy policy by third party services, please open an request issue on github.. Make sure to include the link to privacy policy you wish to be added.''',style: TextStyle(fontSize: 14, color: Colors.black54),),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Made with', style: TextStyle(fontSize: 16),),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                  height: 26,
                                  width: 26,
                                  child: Image.asset('assets/heart.png')
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              InkWell(
                                  onTap: (){
                                    _launchProfileURL();
                                  },
                                  child: Text('by Sanskar Tiwari', style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),)
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
