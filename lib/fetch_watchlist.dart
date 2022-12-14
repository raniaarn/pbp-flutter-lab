import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';

 Future<List<WatchList>> fetchWatchList() async {
        var url = Uri.parse('https://itemmate.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object ToDo
        List<WatchList> listWatchList = [];
        for (var d in data) {
        if (d != null) {
            listWatchList.add(WatchList.fromJson(d));
        }
        }

        return listWatchList;
    }