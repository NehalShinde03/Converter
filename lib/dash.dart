import 'package:conveter/sizedconfig.dart';
import 'package:flutter/material.dart';

var i;
var ss,s5,s6,str;

class dash extends StatefulWidget {
  const dash({Key? key}) : super(key: key);

  @override
  State<dash> createState() => _dashState();
}

class _dashState extends State<dash> {

  final item=['SPI','CPI','CGPA'];
  final _amount=TextEditingController();
  final _tot=TextEditingController();
  final _t=TextEditingController();

  String _val='SPI';
  String _grade='';
  String _class='';

  var _error;
  late double cal;
  late double result;


  @override
  dispose(){
    _amount.dispose();
    _tot.dispose();
    _t.dispose();
    _error.dispose();
    i.dispose();
    str.dispose();
    s5.dispose();
    s6.dispose();
    ss.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 3.1 * SizedConfig.txtAdjust ,color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff2859b1),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white,style:BorderStyle.solid ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(3.1 * SizedConfig.heightAdjust),bottomRight: Radius.circular(3.1 * SizedConfig.txtAdjust))
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            //main Container
            SizedBox(
              height: 82.7 * SizedConfig.heightAdjust,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7 * SizedConfig.heightAdjust),
                ),
                margin: EdgeInsets.all(2.7 * SizedConfig.heightAdjust),
                color: const Color(0xff2859b1),
                child: calculat(),
              ),
            ),
          ],
        )
      ),
    );
  }

  calculat() {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //for Dropdown button
            Expanded(
                  child:Container(
                    padding: EdgeInsets.all(1.2*SizedConfig.heightAdjust),
                    margin: EdgeInsets.only(top: 20.5 * SizedConfig.heightAdjust,left: 2.3 * SizedConfig.heightAdjust,right: 5.4 * SizedConfig.heightAdjust),
                    height: 5.4 * SizedConfig.heightAdjust,
                    width:60.4 * SizedConfig.heightAdjust,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.3 * SizedConfig.heightAdjust),
                        color: const Color(0xff2859b1),
                        border: Border.all(color: Colors.white)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                      isExpanded: true,
                      style: const TextStyle(
                        color: Colors.white
                      ),
                      icon: const Icon(Icons.arrow_circle_down_rounded,color: Colors.white),
                      dropdownColor: const Color(0xff2859b1),
                      iconSize: 3.4 * SizedConfig.heightAdjust,
                      value: _val,
                      items: item.map(buildMenuItem).toList(),
                      onChanged: (value)=>setState(()=>_val=value as String),
                      ),
                    ),
                  ),
               ),

                //for flat button
                Expanded(
                   child: Container(
                    padding: EdgeInsets.all(1.2 * SizedConfig.heightAdjust),
                    width: 20.3 * SizedConfig.heightAdjust,
                    height: 8.20 * SizedConfig.heightAdjust,
                    margin: EdgeInsets.only(top: 19.1 * SizedConfig.heightAdjust,left: 4.1*SizedConfig.heightAdjust,right: 0.82*SizedConfig.heightAdjust),
                    child: FlatButton(
                      onPressed: null,
                      highlightColor: const Color(0xff2859b1),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(3.2 * SizedConfig.heightAdjust)
                      ),
                        child: FittedBox(child: Text('Percentage(%)',style: TextStyle(fontSize: 2 * SizedConfig.txtAdjust,fontWeight: FontWeight.bold,color: Colors.white))),
                    ),
                  ),
                )
          ],
        ),


        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Enter SPI/CPI/CGPA textfield
            Expanded(
                child:Container(
                  padding: EdgeInsets.only(top: 1.2 * SizedConfig.heightAdjust,left: 1.2 * SizedConfig.heightAdjust,bottom: 1.2 * SizedConfig.heightAdjust),
                  margin:  EdgeInsets.only(top: 4.10 * SizedConfig.heightAdjust,left: 0.12 * SizedConfig.heightAdjust,right: 0.68 * SizedConfig.heightAdjust),
                 child: TextField(
                   controller: _amount,
                   cursorColor: Colors.white,
                   style: const TextStyle(
                     color: Colors.white,
                   ),
                    decoration: InputDecoration(
                          hintText: 'Enter ${_val}',
                          border: InputBorder.none,
                          filled: true,
                          errorText:_error,
                    ),
                   keyboardType: TextInputType.number,
                  ),
                )
            ),

               //arrow_right
               Container(
                 width: 10.9 * SizedConfig.heightAdjust,
                  height: 10.9 * SizedConfig.heightAdjust,
                  child: Image.asset('assets/images/arrow_right.gif')
              ),

            //percentage textfield
            Expanded(
                child:Container(
                  padding: EdgeInsets.all(1.2 * SizedConfig.heightAdjust),
                  width: 20.8 * SizedConfig.heightAdjust,
                  margin: EdgeInsets.only(top: 4.1 * SizedConfig.heightAdjust,left: 0.12 * SizedConfig.heightAdjust),
                  child: TextField(
                    controller: _t,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.1*SizedConfig.heightAdjust,
                    ),
                    decoration:  const InputDecoration(
                      hintText: 'Percentage(%)',
                      border: InputBorder.none,
                      filled: true,
                    ),
                    readOnly: true,
                  ),
                )
            ),
          ],
        ),

         SizedBox(height: 7*SizedConfig.heightAdjust),

        //proceed button
        OutlinedButton(
          onPressed: (){
            setState((){

              i=0;
              s5=null;
              s6=null;

              while(i<_amount.text.length){
                if(_amount.text[i]==',' || _amount.text[i]=='-'){
                  _error='please enter valid $_val...';
                  _amount.text='';
                  _t.text='';
                  _grade='';
                  _class='';
                  _tot.text='';
                  break;
                }
                else{
                  i++;
                }
              }

              i=0;
              while(i<_amount.text.length){
                if(_amount.text[i]=='.'){
                  s5=_amount.text.substring(0,i).trim();
                  _amount.text[i].trim();
                  s6=_amount.text.substring(i+1,_amount.text.length).trim();
                  _amount.text="$s5${_amount.text[i]}$s6";
                  break;
                }
                else{
                  i++;
                }
              }
              //calculation for SPI/CPI/CGPA to percentage
              if((double.parse(_amount.text)==0) || (double.parse(_amount.text)==0.1) || (double.parse(_amount.text)==0.2) || (double.parse(_amount.text)==0.3) || (double.parse(_amount.text)==0.4)){
                _tot.text = '0.0'.toString();
              }
              else if((double.parse(_amount.text)>=0) && (double.parse(_amount.text)<=10)){
                cal = double.parse(_amount.text) - 0.5;
                result = cal * 10;
                _tot.text = '$result';
                _t.text='${_tot.text} %';
                _error=null;
              }
              else{
              _error='please enter value\nwithin the rang 1-10'.toString();
              }

              //calculate grade and belongs class
              if(double.parse(_tot.text)>=85 && double.parse(_tot.text)<=100){
                _grade='AA';
                _class='First Class with Distinction';
              }
              else if(double.parse(_tot.text)>=75 && double.parse(_tot.text)<85){
                _grade='AB';
                _class='First Class with Distinction';
              }
              else if(double.parse(_tot.text)>=65 && double.parse(_tot.text)<75){
                _grade='BB';
                if(double.parse(_tot.text)>=66){
                  _class='First Class with Distinction';
                }
                else{
                  _class='First Class';
                }
              }
              else if(double.parse(_tot.text)>=55 && double.parse(_tot.text)<65){
                _grade='BC';
                if(double.parse(_tot.text)>=60){
                  _class='First Class';
                }
                else{
                  _class='Second Class';
                }
              }
              else if(double.parse(_tot.text)>=45 && double.parse(_tot.text)<55){
                _grade='CC';
                if(double.parse(_tot.text)>=50){
                  _class='Second Class';
                }
                else{
                  _class='Pass Class';
                }
              }
              else if(double.parse(_tot.text)>=40 && double.parse(_tot.text)<45){
                _grade='CD';
                _class='Pass Class';
              }
              else if(double.parse(_tot.text)>=35 && double.parse(_tot.text)<40){
                _grade='DD';
                _class='Pass Class';
              }
              else if(double.parse(_tot.text)<35){
                _grade='FF';
                _class='Fail Class';
              }

              //set two digit after '.'
              disp();
            });
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(3.1 * SizedConfig.heightAdjust),
                    side: const BorderSide(color: Colors.white)
                ),
              )
          ),
          child: Text('Proceed',style: TextStyle(fontSize: 2.1 * SizedConfig.txtAdjust,fontWeight: FontWeight.bold,color: Colors.white)),
        ),

        SizedBox(height: 5.1 * SizedConfig.heightAdjust),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${_val.toString()} : ',style: TextStyle(color: Colors.white,fontSize: 2.1 * SizedConfig.txtAdjust)),
              Text(_amount.text,style:  TextStyle(color: Colors.white,fontSize: 2.1 * SizedConfig.txtAdjust)),
            ],
          ),
        ),

        SizedBox(height: 1 * SizedConfig.heightAdjust),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Percentage : ',style: TextStyle(color: Colors.white,fontSize: 2.1 * SizedConfig.txtAdjust)),
              Text('${_tot.text} %',style:TextStyle(color: Colors.white,fontSize: 2.1 * SizedConfig.txtAdjust),)
            ],
          ),
        ),
        SizedBox(height: 1 * SizedConfig.heightAdjust),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('Grade : ',style: TextStyle(color: Colors.white,fontSize: 2.1 * SizedConfig.txtAdjust)),
              Text(_grade.toString(),style:TextStyle(color: Colors.white,fontSize: 2.1 * SizedConfig.txtAdjust))
            ],
          ),
        ),
        SizedBox(height: 1 * SizedConfig.heightAdjust),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Class : ',style: TextStyle(color: Colors.white,fontSize: 2.1 * SizedConfig.txtAdjust)),
              Text(_class,style:  TextStyle(color: Colors.white,fontSize: 2.1 * SizedConfig.txtAdjust))
            ],
          ),
        )

      ],
    );
  }

 DropdownMenuItem<String> buildMenuItem(String item)=>
      DropdownMenuItem(
          value: item,
          child: Text(item,style: TextStyle(fontSize: 2.1 * SizedConfig.txtAdjust,fontWeight: FontWeight.bold))
      );


  //disp() :- used to set two digit after '.'
  void disp() {

    i=0;
    ss=null;
    s5=null;
    s6=null;

    while(i<_tot.text.length){
      if(_tot.text[i]=='.'){
        ss=_tot.text[i];
        s5=_tot.text.substring(0,i).trim();
        _tot.text[i].trim();
        s6=_tot.text.substring(i+1,_tot.text.length).trim();
        break;
      }
      else{
        i++;
      }
    }

    if(s6.length==1){
      if(s6[0]!='0'){
        s6 = '0$s6';
      }
    }
    else{
      s6=s6[0]+s6[1];
    }
    _tot.text=s5+ss+s6;
    _t.text='${_tot.text} %';
  }
}