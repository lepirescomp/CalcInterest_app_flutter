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
  var _moedas = ['Dollar','Euros','Libras'];
  final _minPadding =5.0;
  String texto='';
  var _textoSelected='' ;
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _textoSelected =_moedas[0];
  }


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

              },
              keyboardType: TextInputType.numberWithOptions(),
              controller: principalController,
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
              controller: rateController,
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
              controller: termController,
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
            value: _textoSelected,
            onChanged: (String newValueSelected){
              _onDropDownItemSelected(newValueSelected);
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
                      setState(() {
                       this.texto= calculateTotalreturns();
                      });
                  },
                ),
              ),



              Expanded(
                child: RaisedButton(
                    color:  Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                  child: Text('Reset',textScaleFactor: 1.5),
                  onPressed: (){
                      setState(() {
                        _reset();
                      });

                  },
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(_minPadding*2),
          child: Text(this.texto,
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

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._textoSelected=newValueSelected;
    });
  }

  String calculateTotalreturns(){
    double principal = double.parse(principalController.text);
    double rate= double.parse(rateController.text);
    double term = double.parse(termController.text);
    double totalAmountPayable = principal + (principal *rate+term)/100;

    return "After $term years, your investment will worth $totalAmountPayable $_textoSelected";
  }

  void _reset(){
    principalController.text='';
    rateController.text='';
    termController.text='';
    texto='';
    _textoSelected= _moedas[0];
  }

}


