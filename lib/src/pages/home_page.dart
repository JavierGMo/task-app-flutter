import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    print('');
    
    return Scaffold(
      body: Container(
        child: Center(
          child: Stack(
            children: [
              _backgroundColors(),
              Container(
                margin: EdgeInsets.only(top: size.height*0.5),
                child: _itemsHome(context, size)
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundColors(){
    return Container(
      color: Colors.pinkAccent,
    );
  }//Backgrounds color

  Widget _itemsHome(BuildContext context, Size size){
    return Container(
      height: size.height*0.5,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0)
        )
      ),
      child: Column(
        children: [
          Container(
            width: 170.0,
            height: 8.0,
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            margin: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0)
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Create and check Daily Task',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.only(right: 70.0),
            child: Text(
              'Team managment and project Managment and solution provide app'
            ),
          ),
          _datePickerCustom(),
          _rowAvatars(context),
          _btnCreateTask(context),
        ],
      ),
    );
  }

  Widget _datePickerCustom(){
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _itemCalendar('Mo', '12', false),
          _itemCalendar('Tu', '13', true),
          _itemCalendar('We', '14', false),
          _itemCalendar('Th', '15', false),
          _itemCalendar('Fr', '16', false),
          _itemCalendar('Sa', '17', false),
          _itemCalendar('Su', '18', false),
        ],
      ),
    );
  }//Calendario customizado

  Widget _itemCalendar(String day, String dayNumber, bool isSelected){
    final colorText = isSelected?Colors.white:Colors.black;
    return Container(

      height: 60.0,
      width: 30.0,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      // margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: isSelected?Colors.pinkAccent:Colors.white,
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: colorText
            ),
          ),
          Text(
            dayNumber,
            style: TextStyle(
              color: colorText,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }//Items del calendario

  Widget _rowAvatars(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _circleAvatar(context),
          _circleAvatar(context),
          _circleAvatar(context),
          _circleAvatar(context),
          _circleAvatar(context),
        ],
      ),
    );
  }//Avatar 

  Widget _circleAvatar(BuildContext context){
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.pink,
        child: ClipRRect(
          child: FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://randomuser.me/api/portraits/lego/6.jpg'),
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onTap: (){
        Navigator.pushNamed(context, 'profile');
      },
    );
  }//Avatar

  Widget _btnCreateTask(BuildContext context){
   final algo =  Container(
      width: 110.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.pinkAccent,
            blurRadius: 35.0,
            offset: Offset(1.5, 15.5)
            
          ),
        ],
      ),
    );
    return RaisedButton(
      elevation: 0.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23.0)
      ),
      child: Ink(
        width: 120.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(236, 64, 109, 1.0),
              Color.fromRGBO(235, 55, 100, 1.0),
              Color.fromRGBO(233, 45, 92, 1.0),
              Color.fromRGBO(231, 34, 83, 1.0),
              Color.fromRGBO(229, 20, 58, 1.0),
            ]
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(
          Icons.arrow_right_alt_outlined,
          color: Colors.white,
          size: 40.0,
        ),
      ),
      onPressed: (){
        Navigator.pushNamed(context, 'task');//task
      }
    );
  }//Boton para ir a crear task

  



}