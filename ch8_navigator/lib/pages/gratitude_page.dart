import 'package:flutter/material.dart';

class GratitudePage extends StatefulWidget{
  final int radioGroupValue;

  GratitudePage({Key key, @required this.radioGroupValue}) : super(key: key);

  @override
  _GratitudePageState createState() {
    return _GratitudePageState();
  }
}

class _GratitudePageState extends State<GratitudePage>{
  List<String> _gratitudeList = List();
  String _selectedGratitude;
  int _radioGroupValue;

  @override
  void initState() {
    super.initState();
    _gratitudeList..add('Family')..add('Friends')..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  void _radioOnChanged(int index){
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,//id of radio
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),
              ),
              Text('Family'),
              Radio(
                value: 1,//id of radio
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),
              ),
              Text('Friends'),
              Radio(
                value: 2,//id of radio
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),
              ),
              Text('Coffee'),
            ],
          ),
        ),
      ),
    );
  }

}