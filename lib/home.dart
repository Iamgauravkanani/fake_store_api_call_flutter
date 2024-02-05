import 'package:fakestore/helper/api_helper.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.fetchData(),
        builder: (context, snapshot) {
          // if(){
          //
          // }else if(){
          //
          // }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
