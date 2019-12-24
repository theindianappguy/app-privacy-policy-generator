import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:privacy_policy_generator/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final formKey = GlobalKey<FormState>();
  String appName, appContactInfo, devComName, infoCollectes;

  // app mame , contact info, Personally Identifiable Information you collect (comma separated)

  //this is lists
  //choosing the app type
  String _appType = null;
  List<String> _appTypes = new List<String>();

  //choosing the dev type
  String _devType = null;
  List<String> _devTypes = new List<String>();

  //choosing the mobile OS
  String _osType = null;
  List<String> _osTypes = new List<String>();

  @override
  void initState() {
    // TODO: implement initState
    _appTypes.addAll(
        ['Free', 'Open Source', 'Freemium', 'Ad Supported', 'Commercial']);
    //_appType = _appTypes.elementAt(0);

    _devTypes.addAll(['Individual', 'Company']);
    //_devType = _devTypes.elementAt(0);

    _osTypes.addAll(['Android', 'Ios', 'Android & Ios']);
    //_osType = _osTypes.elementAt(0);
  }

  void appTypeOnChanges(String value) {
    setState(() {
      _appType = value;
    });
  }

  void devTypeOnChanges(String value) {
    setState(() {
      _devType = value;
    });
  }

  void osTypeOnChanges(String value) {
    setState(() {
      _osType = value;
    });
  }

  void generateTermsAndCondition() {
    setState(() {
      String texttoCopy = generateTermsAndConditionString(
          devComName, appName, _devType, _osType, infoCollectes);
      ClipboardManager.copyToClipBoard(texttoCopy).then((result) {
        final snackBar = SnackBar(
          content: Text('TermsAndCondition Copied to Clipboard'),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      });
    });
  }

  _launchProfileURL() async {
    const url = 'https://www.linkedin.com/in/lamsanskar/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void generatePrivacyPolicy() {
    setState(() {
      String texttoCopy = generatePrivacyPolicyString(devComName, appName,
          _appType, _devType, appContactInfo, infoCollectes);
      ClipboardManager.copyToClipBoard(texttoCopy).then((result) {
        final snackBar = SnackBar(
          content: Text('Privacy Policy Copied to Clipboard'),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: formKey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'App Name'),
                      validator: (input) =>
                          input.isEmpty ? 'App Name Is Required' : null,
                      onSaved: (input) => appName = input,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Contact Information'),
                      validator: (input) => input.isEmpty
                          ? 'Contact Information Is Required'
                          : null,
                      onSaved: (input) => appContactInfo = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Developer Name'),
                      validator: (input) =>
                          input.isEmpty ? 'Developer Name Is Required' : null,
                      onSaved: (input) => devComName = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText:
                              'Personally Identifiable Information you collect(comma separated)'),
                      onSaved: (input) => infoCollectes = input,
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    //App Types Drop Down

                    new DropdownButton<String>(
                      value: _appType,
                      hint: Text('Choose type of app'),
                      items: _appTypes.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        appTypeOnChanges(value);
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    //Dev Type Drop Down

                    new DropdownButton<String>(
                      value: _devType,
                      hint: Text('Choose Dev Type'),
                      items: _devTypes.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        devTypeOnChanges(value);
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    //Os Types Drop DOwn

                    new DropdownButton<String>(
                      value: _osType,
                      hint: Text('Choose Mobile Os'),
                      items: _osTypes.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        osTypeOnChanges(value);
                      },
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.pink,
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              generatePrivacyPolicy();
                            }
                          },
                          child: Text(
                            'Generate Privacy Policy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        RaisedButton(
                          color: Colors.pink,
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              generateTermsAndCondition();
                            }
                          },
                          child: Text(
                            "Generate Terms & Condition.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
