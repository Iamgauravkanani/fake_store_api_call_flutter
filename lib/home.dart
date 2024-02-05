import 'package:fakestore/helper/api_helper.dart';
import 'package:fakestore/mode/model.dart';
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
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<ApiModel>? data = snapshot.data;
            return ListView.builder(itemBuilder: (snapshot, i) {
              return Card(
                child: ListTile(
                  title: Text("${data?[i].title}"),
                  subtitle: Text("${data?[i].description}"),
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage("${data?[i].image}"),
                  ),
                  trailing: Text("${data?[i].price}"),
                ),
              );
            });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
