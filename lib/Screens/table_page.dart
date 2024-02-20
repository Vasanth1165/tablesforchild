import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/table_provider.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    final wi=MediaQuery.of(context).size.width;
    print("Build!!!!!!!!!!!!!!!!!!!");
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tables for Child',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 15,),
          Consumer<TableProvider>(
            builder: (context, value, child) => Slider(
              label: "${value.value.toInt()}",
              min: 1,
              max: 20,
              divisions: 20,
              value: value.value.toDouble(), onChanged: (val){
                value.tableNumber(val.toInt());
            }),
          ),
          Expanded(
              child: Consumer<TableProvider>(
                builder: (context, value, child) => Stack(
                  children: [
                     Center(
                      child: Text('${value.value.toInt()}',style: TextStyle(fontSize: (wi/2).sp,fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(.2)),),
                    ),
                    ListView.builder(
                      itemCount: value.tableList.length,
                      itemBuilder: (context,index){
                      return ListTile(
                      title: Text(value.tableList[index],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)));
                }),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
