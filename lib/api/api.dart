import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdbapi/models/movie.dart';
import 'package:tmdbapi/widgets/constants.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatingUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}&language=en-US&page=1';
  static const _upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}&language=en-US&page=1';
  static const _discoveryUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}&language=en-US&page=1';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Algo aconteceu');
    }
  }

  Future<List<Movie>> getTopRatingMovies() async {
    final response = await http.get(Uri.parse(_topRatingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Algo aconteceu');
    }
  }

  Future<List<Movie>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(
          'Falha na solicitação HTTP: Status ${response.statusCode}');
    }
  }

  Future<List<Movie>> getDiscoveryMovies() async {
    final response = await http.get(Uri.parse(_discoveryUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(
          'Falha na solicitação HTTP: Status ${response.statusCode}');
    }
  }
}
