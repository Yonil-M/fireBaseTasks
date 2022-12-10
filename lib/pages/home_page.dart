import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firetasks/ui/general/colors.dart';
import 'package:firetasks/ui/widgets/general_widget.dart';
import 'package:firetasks/ui/widgets/texField_searchWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  CollectionReference tasksReference=FirebaseFirestore.instance.collection("tasks");

  
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
                TextFieldSearchWidget(),
              ],
            ),
          ),
    
        ],
      ),
    ),
    );
  }
}
