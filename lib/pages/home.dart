import 'package:flutter/material.dart';
import 'package:restapi_implementation/services/user_service.dart';


import '../models/user_mdoel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("users")),
      body: FutureBuilder<List<Users>>(
          future: UserService.getUser(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: SizedBox.fromSize(
                      size: Size(60, 60),
                      child: Text(
                        snapshot.data?[index].phone ?? "",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                    title: Text(
                      snapshot.data?[index].address.street ?? "",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data?[index].name ?? "",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: SizedBox.fromSize(
                      size: Size(120, 100),
                      child: Text(
                        snapshot.data?[index].company.catchPhrase ?? "",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                  );
                }));
          })),
    );
  }
}
