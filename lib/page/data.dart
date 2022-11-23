import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';

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
        body: ListBudget.budgets.isEmpty
            // jika belum ada data
            ? const Center(
                child: Text('Belum ada data yang tersimpan.'),
              )
            // jika sudah ada data
            : Container(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: ListBudget.budgets.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        child: ListTile(
                          title: Text(ListBudget.budgets[index].judul),
                          subtitle: 
                              Text(ListBudget.budgets[index].nominal.toString()),
                          trailing:
                              Padding(padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                  Text(ListBudget.budgets[index].jenis.toString()),
                                  Text("${ListBudget.budgets[index].date.day}/${ListBudget.budgets[index].date.month}/${ListBudget.budgets[index].date.year}")
                              ],)
                              )
                              
                        ),
                      ),
                    );
                  },
                ),
              ));
  }
}
