import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  
  final myBorder = Border.all(
    color: Colors.black38,
    width: 1.0,
  );
  final positions = [
    'Programmer in python',
    'Engiener in Pyhon'
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                _profileStack(size),
                // _profileAndAvatar(size, 'Mary Smith', positions),
                _works(),
                _references('References')
              ],
            ),
          ),
        ),
      ),
    );
  }

  

  Widget _profileAndAvatar(Size size, String name, List<String> positions){
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      alignment: AlignmentDirectional.topCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        border: myBorder,
      ),
      child: Column(
        children: [
          _circleAvatar(),
          _descriptionContact('Mary Smith', 35.0, FontWeight.bold, Colors.black),
          _descriptionContact('UX/UI Designer', 25, FontWeight.normal, Colors.grey),
          _descriptionContact('Expert Programmer', 25.0, FontWeight.normal, Colors.grey),
          
        ],
      ),
    );
  }


  Widget _descriptionContact(String title, double fontSize, FontWeight fontWeight, Color color){
    return Text(
      '$title',
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }//Descripcion del contacto

  Widget _profileStack(Size size){

    final container = Container(
      width: size.width*0.85,
      height: size.height*0.3,
      margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        border: myBorder,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),
          Container(
            width: size.width*0.15,
            height: size.height*0.1,
            
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.elliptical(57.0, 57.0),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(00.0),
                  // bottomRight: Radius.elliptical(70.0, 50.0),
              ),
            ),
            child: Icon(
              Icons.crop_square,
              
            ),
          ),
        ],
      ),
    );

    final descriptions = Container(
      child: Column(
        children: [
          _circleAvatar(),
          _descriptionContact('Mary Smith', 35.0, FontWeight.bold, Colors.black),
          _descriptionContact('UX/UI Designer', 25, FontWeight.normal, Colors.grey),
          _descriptionContact('Expert Programmer', 25.0, FontWeight.normal, Colors.grey),
        ],
      ),
    );


    return Stack(
      children: [
        container,
        Positioned(
          left: size.width*0.23,
          top: size.height*0.01,
            child: descriptions,
        ),
        // _profileAndAvatar(size, 'Mary Smith', positions),
      ],
    );
  }

  Widget _circleAvatar(){
    return Container(
      width: 70.0,
      height: 70.0,
      child: CircleAvatar(
        child: FlutterLogo(),
      ),
    );
  }//Avatar del perfil

  Widget _works(){
    return Container(
      height: 100.0,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: myBorder,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _itemWork('36', 'Hours'),
          VerticalDivider(color: Colors.black,),
          _itemWork('34', 'Projects'),
          VerticalDivider(color: Colors.black,),
          _itemWork('4.8', 'Ratings'),
        ],
      ),
    );
  }//Tiempo de trabajo del perfil

  Widget _itemWork(String numberOfwork, String label){
    return Column(
      children: [
        Text(
          '$numberOfwork',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          '$label',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black45
          )
        ),
      ],
    );
  }//Item del tiempo trabajado


  Widget _references(String title){

    final titleReference = Text(
      '$title',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      padding: EdgeInsets.symmetric(vertical: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: myBorder,
      ),
      child: Column(
        children: [
          titleReference,
          _circlesAvatars(),
          _btnContact(),
        ],
      ),
    );
  }

  Widget _circlesAvatars(){
    return Container(
      
      // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _avatarReference(),
          _avatarReference(),
          _avatarReference(),
          _avatarReference(),
          _avatarReference(),
        ],
      ),
    );
  }//Avatar de referencia

  Widget _avatarReference(){
    return CircleAvatar(
      child: FlutterLogo(),
    );
  }//Avatar de referencias

  Widget _btnContact(){
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
        print('Contacto');
      }
    );
  }


}