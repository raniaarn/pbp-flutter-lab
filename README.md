# counter_7 - Rania Maharani Narendra - 2106650222
## PBP B

# TUGAS 7

## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateful widget: jika widget bisa berubah saat user berinteraksi dengan widget tersebut(memicu adanya variable atau nilai baru yang didapat). Stateful memiliki state yang berubah-ubah (dinamis, mutable saat runtime ketika user berinteraksi). Contoh checkbox, radiobutton, dll.

Stateless Widget: jika widget tidak akan berubah. Hanya akan memiliki final property yang didefine di awal, dan bakal jadi satu-satunya yang muncul di user. (statis, immutable). Berguna jika tidak bergantung dengan apapun. COntoh icon, layout, dll.
<br>

## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Center
untuk meletakkan child widgetnya di tengah
- Scaffold
untuk mengimplementasikan layout design structure umum. DI dalamnya dapat menyajikan widget lain yang disebutkan di bawah ini. (Appbar, FloatingActionButton, dll)
- Appbar
widget yang mengandung toolbar dalam aplikasi flutter. AppBar pada umumnya menampilan seperti daftar menu, judul aplikasi ataupun tombol-tombol aksi contohnya tombol pencarian, notifikasi dll.
- Container
untuk menaruh widget lain dan memposisikannya sesuai kemauan kita (mengatur padding dll)
- Row, Column
seperti flex, sebagai layout secara horizontal (Row) dan vertikal (Column) untuk membuat child di dalamnya sejajar
- Visibility
untuk visibilitas, jika visible=true maka widget didalamnya akan terlihat
- Text
untuk menampilkan sebuah text/string. Text juga memimiliki argument kedua yang bersifat optional untuk memanipulasi tampilan seperti warna, ukuran, posisi, dll
- TextStyle

- FloatingActionButton
sebuah circular icon button. berguna untuk mengaktifkan suatu fungsi (jika ditekan, akan memanggil fungsi) contohnya disini adalah dihubungkan dengan fungsi increment untuk menambah _counter dan decrement untuk menguranginya

<br>

## 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Setiap widget yang merupakan StatefulWidget memiliki object State, objek ini untuk ngetrack variables dan fungsi yang didefinisikan di dalam StatefulWidget. Untuk mengupdate UI (suatu widget), kita perlu memberitahu State Object yaitu dengan menggunakan fungsi setstate(). Dengan menggunakan setState maka akan terjadi perubahan pada UI, jika tidak memakai setState, maka hanya akan merubah nilai variablenya saja.

Pada tugas ini yang berubah adalah variable _counter dan nantinya akan ditampilakn perubahannya, jadi variable yang terdampak sesuai kemauan dari kita sebagai programmer.
<br>


## 4. Jelaskan perbedaan antara const dengan final.
final dan const digunakan jika nilai dari variable tersebut tidak akan diubah kedepannya (immutable/sudah fix/final), jika kita mencoba reassign variable tersebut maka akan terjadi error. Perbedaan diantara keduanya:
| final | const|
| :---: | :---: |
| terinisiasi saat runtime dan hanya bisa di-assign 1x | terinisiasi saat compile-time dan sudah di-assign saat runtime |
| bisa di-define di class dan function | hanya bisa di define di function |
| saat state ter-update, semua yang ada di build method akan terinisasi ulang, termasuk final | tidak akan terinisiasi ulang saat state ter-update |
 
## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat program flutter baru dengan nama counter_7
ini dilakukan dengan cara menjalankan command ` flutter create counter_7 `

2. Mengubah tampilan program
menambahkan button - di sisi kiri, mengganti tulisan flutter demo menjadi program counter, mengganti tulisan "you have clicked the button..." menjadi genap/ganjil (jika genap berwarna merah, jika ganjil berwarna biru) cara mengubah color dengan atribut style:
```
Text(_text(),style: TextStyle(color: _counter % 2 == 0 ? Colors.redAccent : Colors.blue,)),
```

3. Mengimplementasikan logika tombol + menambah sebanyak satu satuan
dilakukan dengan fungsi _incrementCounter() berjenis void, lakukan increment variable _counter `_counter++`

4. mengimplementasikan logika tombol - mengurangi angka sebanyak satu satuan jika counter bernilai selain 0
dilakukan dengan fungsi _decrementCounter() berjenis void, lakukan decrement hanya jika variable _counter diatas 0 (bukan 0)
```
 void _decrementCounter() {
    if (_counter != 0) {
      setState(() {
        _counter--;
      });
    }
  }
```
lalu tambahkan floatingActionButton didalam widget Row agar sejajar dengan floatingActionButton yang increment.

5. Jika counter ganjil atau genap menampilkan teks indikator yang sesuai
menggunakan fungsi _text yang mereturn sebuah string sesuai ketentuan, fungsi ini akan dipanggil di child untuk ditampilkan
```
 String _text() {
    if (_counter % 2 == 0) {
      return "GENAP";
    } else {
      return "GANJIL";
    }
  }
``` 

6. angka 0 dianggap genap
untuk identify suatu angka genap atau ganjil hanya perlu mengecek dengan `_counter%2==0` jika genap, sebaliknya maka ganjil

<hr>


<br>
<br>

# TUGAS 8
## 1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
#### Navigator.push
menambahkan rute halaman ke tumpukan stack saat ini (jadi tidak hilang halaman yang sebelumnya)

### Navigator.pushReplacement
menambahkan rute dengan menggantikan halaman saat ini dengan halaman baru tersebut (replace)

## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- card = untuk membuat card
- TextFormField = input field untuk text dan butuh validator
- DropdownButton = membuat dropdown button berisi list
- ListTile = menampilkan sebuah list
- Drawer = menampilkan menu yang tersembunyi pada sisi kanan/kiri
- Align = untuk set alignment childnya
- InputDecoration = menampilkan elemen desain visual untuk text field
- OutlineInputBorder = membuat border untuk input decorator
- Icon = membuat sebuah icon
- DropdownMenuItem = membuat item pada dropdown menu
- TextField = membuat sebuah simple input field untuk text
-  

## 3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- onPressed = event yang terjadi ketika user menekan suatu button
- onChanged = event yang terjadi ketika user melakukan perubahan pada TextField value
- onTap = event yang terjadi ketika user menekan suatu widget 

## 4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator menggunakan stack berisi halaman-halaman/routes. Jadi tiap dilakukan push suatu halaman maka halaman tersebut akan masuk ke dalam stack (jadi top of stack) dan ditampilkan.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
### <strong>menambahkan drawer menu pada app yang dibuat</strong>
dengan membuat file drawer.dart yang mengembalikan widget Drawer yang berisi routing ke halaman lainnya (counter_7, Tambah Budget, Data Budget)

### <strong>Menambahkan Halaman form</strong>
menambahkan form.dart yang berisi field-field untuk meminta input kepada user. Judul dengan type String, kemudian nominal dengan type int dimana judul dan nominal menggunakan `TextFormField`. String jenis menggunakan `DropDownButton`yang berisi list pilihan

### <strong>Menambahkan button untuk menyimpan budget</strong>
pada `main.dart`, membuat class/model `Budget` berisi atribut2 yang disebutkan sebelumnya. Pada class ini juga berisi constructor yang akan membuat object tiap dipanggil. Kemudian membuat class ListBudget untuk menyimpan data2 yang nantinya bisa ditampilkan.

kemudian pada `form.dart` menambahkan button yang menggunakan onPressed (jika ditekan) akan memvalidasi input form dan jika benar maka tambahkan data (buat object budget baru dengan input) ke list (ListBudget yang isinya sebuah list (budgets))  kemudian reset input.

### <strong>Menambahkan halaman data budget</strong>
halaman baru di `data.dart` menampilkan semua judul, nominal, dan tipe budget menggunakan cards (dengan iterasi static list yang disimpan sebelumnya)

<br>
<br>

# TUGAS 9
## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Bisa dilakukan karena JSON adalah suatu object. Namun, dengan begitu (tidak membuat model dulu) tidak praktis dan tidak mudah digunakan karena model struktur data yang diambil tidak dapat ditentukan oleh kita sendiri, dengan membuat modelnya terlebih dahulu bisa menghindari kesalahan dan memudahkan kita.

## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- FutureBuilder: membuat widgets berdasarkan snapshot terakhir yang berinteraksi dengan suatu Future 
- CircularProgressIndicator: Untuk menunjukkan suatu progress dengan sebuah lingkaran
- Checkbox: untuk menampilkan sebuah input checkbox
- Flexible: untuk mengontrol bagaimana row, column, dan flex akan mengisi space kosong yang ada
- Sizedbox: box simple dengan ukuran yang bisa dispesifikasikan, sizedbox kosong akan memberikan ruang antar widgets
- GestureDetector: untuk mendeteksi gesture dari user (ditargetkan ke suatu widget)
- MaterialPageRoute: rute modal yang menggantikan seluruh layar dengan transisi tergantung platformnya

## 3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
1. menambahkan dependensi http untuk pertukaran data melalui HTTP request seperti GET, POST, PUT, dll
2. membuat model sesuai respons dari data json/web service yang akan diget
3. membuat http request dengan dependesi http (method get)
4. konversi object yang didapat dari json ke model yang dibuat sebelumnya
5. menampilkan data dengan menggunakan FutureBuilder

## 4. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- menambahkan tombol navigasi pada drawer ke halaman mywatchlist
pada `drawer.dart` tambahkan ListTile baru yang mengarah ke page watchlist yang ada di file `watchlist_page.dart`
- Membuat satu file dart yang berisi model mywatchlist.
membuat file `watchlist.dart` dan memasukkannya ke folder model. Kemudian menggunakan [Quicktype](https://app.quicktype.io/) salin data json dari tugas 3 [mywatchlist](https://itemmate.herokuapp.com/mywatchlist/json/). kemudian salin hasil dari quicktype kembali ke file `watchlist.dart`
- menampilkan judul dari setiap mywatchlist 
membuat file `watchlist_page.dart` pada folder page. membuat stateful widget `WatchListPage` dimana di dalamnya melakukan pengambilan data dari URL json tugas 3 menggunakan method GET. Data ditampilkan dengan menggunakan FutureBuilder, tetapi hanya menampilkan judul dari tiap watchlist saja. dengan menggunakan ontap, arahkan ke halaman detail pada file `watchlist_detail.dart`
- Menambahkan halaman detail untuk setiap mywatchlist yang ada pada daftar tersebut. Halaman ini menampilkan judul, release date, rating, review, dan status (sudah ditonton/belum).
pada `watchlist_detail.dart` membuat stateless widget dan menampilkan data-data tersebut
- Menambahkan tombol untuk kembali ke daftar mywatchlist
tombol back dengan `Navigator.of(context).pop()` untuk kembali ke halaman sebelumnya