import 'package:flutter/material.dart';

class EditDestination extends StatelessWidget {
  const EditDestination({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is the EditDestination page"),

      ),
      body: const Center(
        child: Text('Edit Destination',
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,),
        ),
        ),




      
    );
  }
}