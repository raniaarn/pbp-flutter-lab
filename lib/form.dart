import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = "";
  int? nominal = 0;
  String? pilihJenis;
  DateTime? date;
  List<String> listJenis = ["Pemasukan", "Pengeluaran"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      // membuat drawer
      drawer: refactoredDrawer(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // field judul
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Sate Pacil",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                // field nominal
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers
                    decoration: InputDecoration(
                      hintText: "Contoh: 15000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nominal = int.tryParse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      } else if (int.tryParse(value) == null) {
                        // tryparse return null jika tidak bisa di parse
                        return 'Nominal harus angka!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050))
                            .then((newDate) {
                          setState(() {
                            date = newDate;
                          });
                        });
                      },
                      child: Text(date == null
                          // jika blm diisi date
                          ? "Pilih tanggal"
                          // jika sudah
                          : "${date!.day}/${date!.month}/${date!.year}"),
                    )),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                          trailing: DropdownButton(
                            hint: Text("Pilih Jenis"),
                            value: pilihJenis,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: listJenis.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                pilihJenis = newValue!;
                              });
                            },
                          ),
                        ),
                      ]),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // tambahkan data ke list
                        ListBudget.budgets
                            .add(Budget(judul, nominal!, pilihJenis!, date!));

                        // snackbar menampilkan pesan
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil disimpan!'),
                          ),
                        );

                        // Mengosongkan form
                        _formKey.currentState!.reset();
                        date = null;
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
