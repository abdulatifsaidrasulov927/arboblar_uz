import 'package:arboblar_uz/data/models/users/users_model.dart';
import 'package:arboblar_uz/data/repositories/users_repostory.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsersModel>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Container(
                    color: Colors.amber,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                              height: 200,
                              width: 220,
                              child: Image.network(
                                  snapshot.data![index].avatar_url)),
                          Column(
                            children: [
                              Text(
                                snapshot.data![index].username,
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text(
                                snapshot.data![index].name,
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text(
                                snapshot.data![index].state,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
