import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/config/config.dart';
import 'package:news/model/topnews.dart';

class ScienceNewsBlock extends ChangeNotifier{
  List<Articles> _topNews = [];
  List<Articles> get topNews => _topNews;

  bool? _isLoading = true;
  bool? get isLoading => _isLoading;

  bool _hasData = true;
  bool get hasData => _hasData;

  bool _dataLoaded = false;
  bool get dataLoaded => _dataLoaded;

  Future fetchData(mounted) async {
    var response = await http.get(Uri.parse("${Config.baseUrl}/top-headlines?country=in&category=science&apiKey=${Config.apiKey}"));
    if (mounted) {
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        print(response.body);

        var decodedData1 = TopNews.fromJson(decodedData);
        _topNews.addAll((decodedData1.articles)!.map((x) => Articles.fromJson(x.toJson())).toList());
        print("Article News :"+_topNews[0].content.toString());

        _isLoading = false;
        if (_topNews.length == 0) {
          _hasData = false;
          _dataLoaded = true;
          notifyListeners();
        }else{
          _hasData = true;
          _dataLoaded = true;
          notifyListeners();
        }
      }
    }
  }
  setLoading (bool value){
    _isLoading = value;
    notifyListeners();
  }
  onReload(mounted) async {
    _isLoading = null;
    _hasData = true;
    _dataLoaded = false;
    _topNews.clear();
    notifyListeners();
    await fetchData(mounted);
  }

}