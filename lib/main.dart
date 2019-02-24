import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(title: 'Interest Calculator, your life made easier',
  home: SIForm())
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
              onChanged: (String value){
                setState(() {
                  texto=value;
                });
              },
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelText: 'Principal',
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
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  labelText: 'Rate of Interest',
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
                  child: Text(value)
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
                  child: Text('Calculate'),
                  onPressed: (){

                  },
                ),
              ),
             Container(
               width: _minPadding*5,
             ),


              Expanded(
                child: RaisedButton(
                  child: Text('Reset'),
                  onPressed: (){

                  },
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_minPadding*2),
          child: Text(texto),
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


