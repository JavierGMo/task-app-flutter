import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:tasks/src/blocs/task_bloc.dart';
import 'package:tasks/src/models/tarea_model.dart';

class CreateTaskPage extends StatelessWidget {
  
  final _formKey = GlobalKey<FormState>();
  
  final List<String> tags = [];

  final List<String> opciones = [
    'Gym',
    'Creativp',
    'Tarea',
    'Jugar',
    'Programar',
    'Nadar'
  ];

  final taskBloc = new TaskBloc();

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Container(
          
          alignment: AlignmentDirectional.topStart,
          child: Text(
            'My Task',
            style: TextStyle(
              color: Colors.black
            ),
          )
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: CircleAvatar(
              child: Text('User'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _statusToDo(),
              _createTaskTitleAndBtn(),
              _formTask(context, size),
              _categories(),
              _btnCreateTask(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusToDo(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _itemStatus('To Do', 'in Progess', 12, 1, Icons.timelapse),
          _itemStatus('In Progress', 'Started', 2, 1, Icons.circle),
          _itemStatus('To Do', 'completed', 18, 18, Icons.check),
        ],
      ),
    );
  }//Estatus del todo

  Widget _itemStatus(String nameStatus, String subtitleStatus, int tasks, int taskType, IconData icono){
    return ListTile(
      leading: Icon(icono),
      title: Text('$nameStatus'),
      subtitle: Text('$tasks task now ° $taskType $subtitleStatus'),
    );
  }//Tipo de estatus

  Widget _createTaskTitleAndBtn(){
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Create a new task',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          ),
          FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Color.fromRGBO(242, 129, 158, 1.0),
            shape: CircleBorder(),
            
            child: Icon(Icons.add),
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }

  Widget _formTask(BuildContext context, Size size){
    // final aux =  Container(
    //   padding: EdgeInsets.symmetric(horizontal: 30.0),
    //   color: Colors.white,
    //   child: Form(
    //     key: _formKey,
    //     child: Column(
    //       children: [
    //         _titleTaskField(),
    //         _dateFlied(context, snapshot),
    //         // _timeField(context, 'Start', 'AM'),
    //         Row(
    //           children: [
    //             Container(
    //               width: size.width*0.3,
    //               child: _timeField(context, snapshot, 'Start', 'AM')
    //             ),
    //             Expanded(child: Container()),
    //             Container(
    //               width: size.width*0.3,
    //               child: _timeField(context, snapshot, 'End', 'PM')
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return StreamBuilder(
      stream: taskBloc.modelTask,
      builder: (BuildContext context, AsyncSnapshot<TareaModel> snapshot){
        print('Data');
        print(snapshot.data);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _titleTaskField(snapshot),
                _dateFlied(context, snapshot),
                // _timeField(context, 'Start', 'AM'),
                Row(
                  children: [
                    Container(
                      width: size.width*0.3,
                      child: _timeField(context, snapshot, 'Start', 'AM')
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: size.width*0.3,
                      child: _timeField(context, snapshot, 'End', 'PM')
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );


  }//formularios

  Widget _categories(){
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      color: Colors.white,
      child: Column(
        children: [
          _titleCategories(),
          categorias(),
        ],
      ),
    );
  }
  
  
  
  Widget _titleTaskField(AsyncSnapshot<TareaModel> snapshot){
    return TextFormField(
      initialValue: snapshot.data.titulo,
      decoration: InputDecoration(
        labelText: 'Titulo',
        helperText: 'Titulo de la tarea',
        labelStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        helperStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.black
        ),
      ),
      validator: (String value){
        if(value.length >= 10){
          return null;
        }else{
          return 'El titulo tiene que ser mayo o igual a 10';
        }
      },
      onSaved: (String value){
        print('Value $value');
      },
    );
  }


  Widget _dateFlied(BuildContext context, AsyncSnapshot<TareaModel> snapshot){
    return TextFormField(
      initialValue: '',
      
      decoration: InputDecoration(
        labelText: 'Date',
        helperText: 'Lun, 19 Junio',
        suffixIcon: Icon(Icons.date_range),
        labelStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        helperStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.black
        ),
      ),
      validator: (String value){
        if(value.length >= 10){
          return null;
        }else{
          return 'El titulo tiene que ser mayo o igual a 10';
        }
      },
      onTap: (){
        print('Me presionaste');
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
      onSaved: (String value){
        print('Value $value');
      },
    ); 
  }
  
  Widget _timeField(BuildContext context, AsyncSnapshot<TareaModel> snapshot, String title, String suffixH){
    return TextFormField(
      initialValue: '',
      
      decoration: InputDecoration(
        labelText: '$title Date',
        helperText: '10:00 $suffixH',
        labelStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        helperStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.black
        ),
      ),
      validator: (String value){
        if(value.length >= 10){
          return null;
        }else{
          return 'El titulo tiene que ser mayo o igual a 10';
        }
      },
      onTap: (){
        print('Me presionaste');
        FocusScope.of(context).requestFocus(FocusNode());
        _selectTime(context);
      },
      onSaved: (String value){
        print('Value $value');
      },
    ); 
  }

  Widget _titleCategories(){
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'Categories',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget categorias(){
    return ChipsChoice<String>.multiple(
      value: tags,
      wrapped: true,
      choiceActiveStyle: C2ChoiceStyle(
        color: Colors.white
      ),
      choiceStyle: C2ChoiceStyle(
        color: Color.fromRGBO(242, 129, 158, 0.8),
        brightness: Brightness.dark,
        
      ),
      onChanged: (List<String> options){
        print('On change : $options');
      },
      choiceItems: C2Choice.listFrom<String, String>(
        source: opciones,
      
        value: (int index, String valor){
          print('Value : $index : $valor');
          return valor;
        },
        label: (int index, String valor){
          print('Label : $index : $valor');
          return valor;
        },
        tooltip: (int i, String valor){
          return valor;
        },
        
      ),
    );
  }


  Widget _btnCreateTask(){
    final temp =  Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: 190.0,
      height: 60.0,
      child: RaisedButton(
        color: Color.fromRGBO(242, 129, 158, 1.0),
        child: Text(
          'Create task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        onPressed: (){
          if(_formKey.currentState.validate()){
            print('Guardado');
          }
        }
      ),
    );

    return StreamBuilder(
      stream: taskBloc.modelTask,
      builder: (BuildContext context, AsyncSnapshot<TareaModel> snapshot){
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          width: 190.0,
          height: 60.0,
          child: RaisedButton(
            color: Color.fromRGBO(242, 129, 158, 1.0),
            child: Text(
              'Create task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
            ),
            onPressed: (){
              if(_formKey.currentState.validate()){
                print('Guardado');
              }
            }
          ),
        );
      },
    );
  }

  Future _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025)
    );
    if(picked!=null){
      
      print('${picked.toLocal()}');
      print('${picked.toString()}');
    }
  }//Seleccionar la fecha

  Future _selectTime(BuildContext context) async {
    TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 00, minute: 00),
    );
    if(picked != null){
      print('${picked.toString()}');
    }
  }


}