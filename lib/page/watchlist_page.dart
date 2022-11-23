import 'package:counter_7/fetch_watchlist.dart';
import 'package:counter_7/page/watchlist_detail.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Watch List"),
      ),
      drawer: refactoredDrawer(context),
      // future builder berisi data watchlist
      body: FutureBuilder(
        future: fetchWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada to do list :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WatchListDetail(
                                  watchlists: snapshot.data![index]),
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    "${snapshot.data![index].fields.watched}" ==
                                            "yes"
                                        ? Colors.blue
                                        : Colors.red,
                                width: 2),
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                offset: Offset(
                                  0,
                                  1.5,
                                ),
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Checkbox(
                                value: snapshot.data![index].fields.watched ==
                                            "yes",
                                onChanged: (newValue) {
                                  setState(() {
                                    snapshot.data![index].fields.watched == "yes"
                                        ? snapshot.data![index].fields.watched =
                                            "no"
                                        : snapshot.data![index].fields.watched =
                                            "yes";
                                  });
                                })
                          ],
                        ),
                      )));
            }
          }
        },
      ),
    );
  }
}
