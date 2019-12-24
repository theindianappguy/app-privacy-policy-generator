import 'package:flutter/material.dart';

class TANDC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        Text('Terms & Conditions', style: TextStyle(fontSize: 16, color: Colors.black),textAlign: TextAlign.start,),
                        SizedBox(height: 16,),
                        Text('''''',style: TextStyle(fontSize: 14, color: Colors.black54),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
