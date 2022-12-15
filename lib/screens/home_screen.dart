import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_one/models/users_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    const Tab(child: Text("All POSTS")),
    const Tab(child: Text("PROFILE")),
  ];

  @override
  void initState() {
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      if (kDebugMode) {
        print("Selected Index: ${_controller.index}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const Drawer(backgroundColor: Colors.white),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Lorem Ipsum"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: _controller,
            tabs: list,
          ),
          actions: const [
            Icon(Icons.search_rounded),
            SizedBox(
              width: 10,
            )
          ],
          backgroundColor: const Color(0xffE43228),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xffE43228),
          child: const Icon(Icons.add),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Column(children: [
              Expanded(
                  child: FutureBuilder(
                future: getUserApi(),
                builder: (
                  context,
                  AsyncSnapshot<List<UserModel>> snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(children: [
                            Row(
                              children: [
                                const Text("name"),
                                Text(snapshot.data![index].name.toString())
                              ],
                            )
                          ]),
                        );
                      },
                    );
                  }
                },
              ))
            ]),
            Center(
                child: Text(
              _selectedIndex.toString(),
              style: const TextStyle(fontSize: 40),
            )),
          ],
        ),
      ),
    );
  }
}
//
// Column(children: [
//           Expanded(
//               child: FutureBuilder(
//             future: getUserApi(),
//             builder: (
//               context,
//               AsyncSnapshot<List<UserModel>> snapshot,
//             ) {
//               if (!snapshot.hasData) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount: userList.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: Column(children: [
//                         Row(
//                           children: [
//                             const Text("name"),
//                             Text(snapshot.data![index].name.toString())
//                           ],
//                         )
//                       ]),
//                     );
//                   },
//                 );
//               }
//             },
//           ))
//         ]),