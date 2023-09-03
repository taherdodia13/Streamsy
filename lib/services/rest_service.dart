import 'dart:convert';

import 'package:anime_app/model/movies_similar_response_model.dart';
import 'package:anime_app/model/popular_people_response_model.dart';
import 'package:anime_app/model/popular_tvshows_response_model.dart';
import 'package:anime_app/model/recent_anime_response_model.dart';
import 'package:anime_app/model/you_might_like_response_model.dart';
import 'package:anime_app/services/service_configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/anime_details_response_model.dart';
import '../model/celeb_credits_response_model.dart';
import '../model/celeb_media_response_model.dart';
import '../model/genre_response_model.dart';
import '../model/movies_credits_response_model.dart';
import '../model/movies_details_response_model.dart';
import '../model/movies_images_response_model.dart';
import '../model/movies_recommendations_response_model.dart';
import '../model/movies_trending_response_model.dart';
import '../model/people_info_response_model.dart';
import '../model/popular_anime_response_model.dart';
import '../model/popular_movies_response_model.dart';
import '../model/tvseries_aggregate_credits_response_model.dart';
import '../model/tvseries_details_response_model.dart';
import '../model/tvseries_images_response_model.dart';
import '../model/tvseries_recommendations_response_model.dart';
import '../model/tvseries_similar_response_model.dart';

enum Method { post, get }

class RestService {
  static Future<http.Response> getData(
      {required String url, required Method method, String? body}) async {
    debugPrint(body);
    if (method == Method.post) {
      return await http.post(
        Uri.parse(ServiceConfigurations.baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMTI4YzljNmYyZjcwM2E3Njc5ZTlmYTQxMWY0M2QwNSIsInN1YiI6IjY0Y2U5YTIyZmEyN2Y0MDBjNTBhZWZjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bytCeBJKbopp54LvfuTy5PsSHrvAGBKcSvuZfUDTqSo',
        },
        body: body,
      );
    } else {
      return await http.get(Uri.parse(ServiceConfigurations.baseUrl + url),
          headers: <String, String>{
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMTI4YzljNmYyZjcwM2E3Njc5ZTlmYTQxMWY0M2QwNSIsInN1YiI6IjY0Y2U5YTIyZmEyN2Y0MDBjNTBhZWZjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bytCeBJKbopp54LvfuTy5PsSHrvAGBKcSvuZfUDTqSo',
          });
    }
  }

  static Future<String> getResponse(
      {required String url,
      required Method method,
      String? body,
      bool isSignUp = false}) async {
    try {
      var response = await getData(url: url, method: method, body: body);
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401 || response.statusCode == 400) {
        debugPrint('Token Expire');
        return '';
      } else {
        return '';
      }
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  }

  static Future<PopularMovieResponseModel> popularMovies() async {
    try {
      var response = await getResponse(
        url: '/3/movie/popular',
        method: Method.get,
      );
      var result = PopularMovieResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return PopularMovieResponseModel();
    }
  }

  static Future<PopularTvShowsResponseModel> popularTVShows() async {
    try {
      var response = await getResponse(
        url: '/3/tv/popular',
        method: Method.get,
      );
      var result = PopularTvShowsResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return PopularTvShowsResponseModel();
    }
  }

  static Future<PopularPeopleResponseModel> popularPeoples() async {
    try {
      var response = await getResponse(
        url: '/3/person/popular',
        method: Method.get,
      );
      var result = PopularPeopleResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return PopularPeopleResponseModel();
    }
  }

  static Future<PeopleInfoResponseModel> celebData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/person/$id',
        method: Method.get,
      );
      var result = PeopleInfoResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return PeopleInfoResponseModel();
    }
  }

  static Future<PeopleCreditsResponseModel> celebCreditData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/person/$id/combined_credits',
        method: Method.get,
      );
      var result = PeopleCreditsResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return PeopleCreditsResponseModel();
    }
  }

  static Future<PeopleCreditsResponseModel> celebTVseriesCreditData(
      int id) async {
    try {
      var response = await getResponse(
        url: '/3/person/$id//tv_credits',
        method: Method.get,
      );
      var result = PeopleCreditsResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return PeopleCreditsResponseModel();
    }
  }

  static Future<PeopleCreditsResponseModel> celebMoviesCreditData(
      int id) async {
    try {
      var response = await getResponse(
        url: '/3/person/$id//movie_credits',
        method: Method.get,
      );
      var result = PeopleCreditsResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return PeopleCreditsResponseModel();
    }
  }

  static Future<CelebsMediaResponseModel> peoplesMediaData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/person/$id/images',
        method: Method.get,
      );
      var result = CelebsMediaResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return CelebsMediaResponseModel();
    }
  }

  static Future<MoviesDetailResponseModel> moviesDetailsData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/movie/$id',
        method: Method.get,
      );
      var result = MoviesDetailResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return MoviesDetailResponseModel();
    }
  }

  static Future<MoviesGenreResponseModel> moviesGenresList() async {
    try {
      var response = await getResponse(
        url: '/3/genre/movie/list',
        method: Method.get,
      );
      var result = MoviesGenreResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return MoviesGenreResponseModel();
    }
  }

  static Future<TvSeriesGenresResponseModel> tvseriesGenresList() async {
    try {
      var response = await getResponse(
        url: '/3/genre/tv/list',
        method: Method.get,
      );
      var result = TvSeriesGenresResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return TvSeriesGenresResponseModel();
    }
  }

  static Future<MoviesCreditResponseModel> moviesCreditData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/movie/$id/credits',
        method: Method.get,
      );
      var result = MoviesCreditResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return MoviesCreditResponseModel();
    }
  }

  static Future<MoviesRecommendationsResponseModel> moviesRecommendationData(
      int id) async {
    try {
      var response = await getResponse(
        url: '/3/movie/$id/recommendations',
        method: Method.get,
      );
      var result =
          MoviesRecommendationsResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return MoviesRecommendationsResponseModel();
    }
  }

  static Future<MoviesSimilarResponseModel> moviesSimilarData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/movie/$id/similar',
        method: Method.get,
      );
      var result = MoviesSimilarResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return MoviesSimilarResponseModel();
    }
  }

  static Future<MoviesImageResponseModel> moviesImagesData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/movie/$id/images',
        method: Method.get,
      );
      var result = MoviesImageResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return MoviesImageResponseModel();
    }
  }

  static Future<MoviesTrendingResponseModel> moviesTrendingData() async {
    try {
      var response = await getResponse(
        url: '/3/trending/movie/day',
        method: Method.get,
      );
      var result = MoviesTrendingResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return MoviesTrendingResponseModel();
    }
  }

  static Future<TvSeriesDetailsResponseModel> tvSeriesDetailsData(
      int id) async {
    try {
      var response = await getResponse(
        url: '/3/tv/$id',
        method: Method.get,
      );
      var result = TvSeriesDetailsResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return TvSeriesDetailsResponseModel();
    }
  }

  static Future<TvSeriesAggregateCreditsResponseModel>
      tvSeriesAggregateCreditData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/tv/$id/aggregate_credits',
        method: Method.get,
      );
      var result =
          TvSeriesAggregateCreditsResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return TvSeriesAggregateCreditsResponseModel();
    }
  }

  static Future<TvSeriesRecommendationsResponseModel>
      tvSeriesRecommendationsData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/tv/$id/recommendations',
        method: Method.get,
      );
      var result =
          TvSeriesRecommendationsResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return TvSeriesRecommendationsResponseModel();
    }
  }

  static Future<TvSeriesSimilarResponseModel> tvSeriesSimilarData(
      int id) async {
    try {
      var response = await getResponse(
        url: '/3/tv/$id/similar',
        method: Method.get,
      );
      var result = TvSeriesSimilarResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return TvSeriesSimilarResponseModel();
    }
  }

  static Future<TvSeriesImagesResponseModel> tvSeriesImagessData(int id) async {
    try {
      var response = await getResponse(
        url: '/3/tv/$id/images',
        method: Method.get,
      );
      var result = TvSeriesImagesResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return TvSeriesImagesResponseModel();
    }
  }

  static Future<RecentResponseModel> recentAnime() async {
    try {
      var response = await getResponse(
        url: '/meta/anilist/recent-episodes',
        method: Method.get,
      );
      var result = RecentResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return RecentResponseModel();
    }
  }

  static Future<YouMigthLikeResponseModel> youMigthLike() async {
    try {
      var response = await getResponse(
          url: '/meta/anilist/random-anime', method: Method.get);
      var result = YouMigthLikeResponseModel.fromJson(json.decode(response));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return YouMigthLikeResponseModel();
    }
  }

  static Future<AnimePopularResponseModel> animePopular() async {
    try {
      try {
        var response = await http.get(
          Uri.parse('https://animetrix-api.vercel.app/meta/anilist/popular?perPage=24'),
        );
        if (response.statusCode == 200) {
          var result =
              AnimePopularResponseModel.fromJson(json.decode(response.body));
          return result;
        } else if (response.statusCode == 401 || response.statusCode == 400) {
          debugPrint('Token Expire');
          return AnimePopularResponseModel();
        } else {
          return AnimePopularResponseModel();
        }
      } catch (e) {
        debugPrint(e.toString());
        return AnimePopularResponseModel();
      }
    } catch (e) {
      debugPrint(e.toString());
      return AnimePopularResponseModel();
    }
  }

   static Future<AnimeDetailsResponseModel> animeDetails(String id) async {
    try {
      try {
        var response = await http.get(
          Uri.parse(
              'https://animetrix-api.vercel.app/meta/anilist/info/$id'),
        );
        if (response.statusCode == 200) {
          var result =
              AnimeDetailsResponseModel.fromJson(json.decode(response.body));
          return result;
        } else if (response.statusCode == 401 || response.statusCode == 400) {
          debugPrint('Token Expire');
          return AnimeDetailsResponseModel();
        } else {
          return AnimeDetailsResponseModel();
        }
      } catch (e) {
        debugPrint(e.toString());
        return AnimeDetailsResponseModel();
      }
    } catch (e) {
      debugPrint(e.toString());
      return AnimeDetailsResponseModel();
    }
  }
}
