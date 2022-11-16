import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

class DataBudget extends StatefulWidget {
  const DataBudget({super.key});

  @override
  State<DataBudget> createState() => _DataBudgetState();
}

class _DataBudgetState extends State<DataBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data Budget'),
        ),
        drawer: refactoredDrawer(context),
        body: ListBudget.data.isEmpty
            // jika belum ada data
            ? const Center(
                child: Text('Belum ada data yang tersimpan.'),
              )
            // jika sudah ada data
            : Container(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: ListBudget.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        child: ListTile(
                          title: Text(ListBudget.data[index].judul),
                          subtitle:
                              Text(ListBudget.data[index].nominal.toString()),
                          trailing: Text(ListBudget.data[index].jenis),
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
