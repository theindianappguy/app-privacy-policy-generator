import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Disclaimer extends StatelessWidget {

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
    return  Scaffold(
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
                          Text('''This template for privacy policy and terms & conditions is provided on "AS IS" basis, without warranties or conditions of any kind, either expressed or implied. It is intended for you as an inspirational document and you may use it when compiling your own privacy policy. The developer of App Privacy Policy Generator does not take any responsibility for the legal consequences associated with the use of this privacy policy or terms & conditions, and I urge you to seek local legal advice ensuring compliance with all rules applicable for the users of your application. The developer of App Privacy Policy Generator can in no way be found liable for any direct or indirect damage or loss suffered by you due to the use of this document.
''',style: TextStyle(fontSize: 14, color: Colors.black54),),
                          Row(
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
