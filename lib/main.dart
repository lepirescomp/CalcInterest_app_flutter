import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interest Calculator, your life made easier',
  home: SIForm(),
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.indigo,
    accentColor: Colors.indigoAccent
  ),)
);

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _moedas = ['Dollars','Euros','Libras'];
  final _minPadding =5.0;
  String texto='';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    // TODO: implement build
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Interest Calculator'),
      ),
    body: Container(
      margin: EdgeInsets.all(_minPadding*2),
      child: ListView(children: <Widget>[
          getImageAsset(),

          Padding(
            padding: EdgeInsets.only(top: _minPadding,bottom: _minPadding),
            child: TextField(
              style: textStyle,
              onChanged: (String value){
                setState(() {
                  texto=value;
                });
              },
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelText: 'Principal',
                labelStyle: textStyle,
                hintText: 'Enter Principal (E.g. 100)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _minPadding,bottom: _minPadding),
            child: TextField(
              style: textStyle,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  labelStyle: textStyle,
                  hintText: 'In percent',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            ),
          ),
      Padding(
        padding:EdgeInsets.only(top:_minPadding,bottom: _minPadding),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelStyle: textStyle,
                  labelText: 'Term',
                  hintText: 'Time in years',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
          ),
            ),
          Container(
            width: _minPadding*5,
          ),

          Expanded(
            child: DropdownButton<String>(
              items: _moedas.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                  style: textStyle)
                );
              }
            ).toList(),
            value:'Dollars',
            onChanged: (String newValueSelected){

            },
            ),
          )

          ],

        ),
      ),
        Padding(
          padding:  EdgeInsets.only(bottom: _minPadding,top: _minPadding),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color:  Theme.of(context).accentColor,
                  textColor: Theme.of(context).primaryColorDark,
                  child: Text('Calculate',textScaleFactor: 1.5),
                  onPressed: (){

                  },
                ),
              ),



              Expanded(
                child: RaisedButton(
                    color:  Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                  child: Text('Reset',textScaleFactor: 1.5),
                  onPressed: (){

                  },
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_minPadding*2),
          child: Text(texto,
          style: textStyle),
        )


      ],),
    ),
    );

  }

  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(image: assetImage,width: 125.0,height: 80.0);
    return Container(
      child: image,
      margin: EdgeInsets.all(_minPadding*10),

    );

  }
}


