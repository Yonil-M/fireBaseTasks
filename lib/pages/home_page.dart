import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firetasks/models/task_model.dart';
import 'package:firetasks/ui/general/colors.dart';
import 'package:firetasks/ui/widgets/bottom_page.dart';
import 'package:firetasks/ui/widgets/general_widget.dart';
import 'package:firetasks/ui/widgets/item_task_widget.dart';
import 'package:firetasks/ui/widgets/texField_normalWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  CollectionReference tasksReference=FirebaseFirestore.instance.collection("tasks");

  showTaskForm(BuildContext context){
    showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.transparent,
      builder:(BuildContext context) {
        return Container(
          padding: EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22.0)),
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Agregar tarea",style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),),
            divider6(),
            TextFieldNormalWidget(hintText:"Titulo" ,icon:Icons.text_fields ),
            divider10(),
            TextFieldNormalWidget(hintText:"Description" ,icon: Icons.description),
            divider10(),
            Text("Categoria"),

            Wrap(
              spacing: 10.0,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
              FilterChip(
              selected: true,
              backgroundColor: kBrandSegundaryColor,
              padding:const EdgeInsets.symmetric(horizontal: 8.0),
              selectedColor: categoryColor["Personal"],
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              label: Text("Personal"), 
              onSelected: (bool value){

              }),

              FilterChip(
              selected: true,
              backgroundColor: kBrandSegundaryColor,
              padding:const EdgeInsets.symmetric(horizontal: 8.0),
              selectedColor: categoryColor["Trabajo"],
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              label: Text("Trabajo"), 
              onSelected: (bool value){

              }),

              FilterChip(
              selected: true,
              backgroundColor: kBrandSegundaryColor,
              padding:const EdgeInsets.symmetric(horizontal: 8.0),
              selectedColor: categoryColor["Otro"],
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              label: Text("Otro"), 
              onSelected: (bool value){

              }),
              
            ],),
            divider10(),
            
            ButtomNormalWidget(),
            
          ],
        ),
        );
      },);
  }
  
  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      //appBar: AppBar(
        //title: Text("Firebase and store"),),
    /*body: StreamBuilder(
      stream:tasksReference.snapshots(),
      builder: (BuildContext context,AsyncSnapshot snap) {
        if(snap.hasData){
          QuerySnapshot collection=snap.data;
          List<QueryDocumentSnapshot> docs=collection.docs;
          List<Map<String,dynamic>> docsMap=docs.map((e)=>e.data()as Map<String,dynamic>).toList();
          print(docsMap);
          return ListView.builder(
            itemCount: docsMap.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(docsMap[index]["title"]),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    ),*/
    backgroundColor: kBrandSegundaryColor,
    floatingActionButton: InkWell(
      onTap: () {
        showTaskForm(context);
      },borderRadius: BorderRadius.circular(14.0),

      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
        decoration: BoxDecoration(
          color: kBrandPrimaryColor,
          borderRadius: BorderRadius.circular(14.0)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add,color: Colors.white,),
            Text("Nueva Tarea",style: TextStyle(
              color: Colors.white,
            ),),
          ],
        ),
      ),
    ),

    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 18.0),
            width: double.infinity,
            decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(30.0),
            boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12.0,
            offset: const Offset(4, 4),
            )],
          
            ),
           
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bienvenido Yonil",style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: kBrandPrimaryColor,
                ),),

                Text("Mis tareas",style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w600,
                  color: kBrandPrimaryColor,
                ),),
                divider10(),
                TextFieldNormalWidget(hintText:"Buscar tarea..." ,icon:Icons.search ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text(" Todas mis tareas",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: kBrandPrimaryColor.withOpacity(0.9),
          ),),
            StreamBuilder(
              stream: tasksReference.snapshots(),
              builder:(BuildContext context,AsyncSnapshot snap) {
                if(snap.hasData){

                  List<TaskModel> tasks=[];
                QuerySnapshot collection=snap.data;
                /*collection.docs.forEach((element) { 
                  Map<String,dynamic> myMap=element.data()as Map<String,dynamic>;
                  tasks.add(TaskModel.fromJson(myMap));
                });*/
                tasks=collection.docs.map((e)=> TaskModel.fromJson(e.data()as Map<String,dynamic>)).toList();

                return ListView.builder(
                  itemCount: tasks.length,
                  shrinkWrap: true,
                  physics:const ScrollPhysics(),
                  itemBuilder: (BuildContext context,int index) {
                    return ItemTaskWidget(
                      taskModel: tasks[index],
                    );
                  },
                  );
                }
                return loadingWidget();
              },
              ),
            
           ],
            ),)
 
        ],
      ),
    ),
    );
  }
}
