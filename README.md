# counter_7 - Rania Maharani Narendra - 2106650222
## PBP B

## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateful widget: jika widget bisa berubah saat user berinteraksi dengan widget tersebut(memicu adanya variable atau nilai baru yang didapat). Stateful memiliki state yang berubah-ubah (dinamis, mutable saat runtime ketika user berinteraksi). 

Stateless Widget: jika widget tidak akan berubah. Hanya akan memiliki final property yang didefine di awal, dan bakal jadi satu-satunya yang muncul di user. (statis, immutable). Berguna jika tidak bergantung dengan apapun.
<br>

## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Text
untuk menampilkan sebuah text/string. Text juga memimiliki argument kedua yang bersifat optional untuk memanipulasi tampilan seperti warna, ukuran, posisi, dll
- FloatingActionButton
sebuah circular icon button. berguna untuk mengaktifkan suatu fungsi (jika ditekan, akan memanggil fungsi)

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
ini dilakukan dengan cara menjalankan command ` flutter createapp counter_7 `

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