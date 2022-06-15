// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  Movies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null
            ? null
            : List<dynamic>.from(results?.map((x) => x.toJson()) ?? {}),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
      };
}

class Result {
  Result({
    required this.originalName,
    required this.originCountry,
    required this.backdropPath,
    required this.genreIds,
    required this.originalLanguage,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.overview,
    required this.id,
    required this.name,
    required this.popularity,
    required this.mediaType,
    required this.releaseDate,
    required this.adult,
    required this.originalTitle,
    required this.title,
    required this.video,
  });

  final String? originalName;
  final List<String>? originCountry;
  final String? backdropPath;
  final List<int>? genreIds;
  final OriginalLanguage? originalLanguage;
  final String? posterPath;
  final DateTime? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final String? overview;
  final int? id;
  final String? name;
  final double? popularity;
  final MediaType? mediaType;
  final DateTime? releaseDate;
  final bool? adult;
  final String? originalTitle;
  final String? title;
  final bool? video;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
        originalLanguage: json["original_language"] == null
            ? null
            : originalLanguageValues.map?[json["original_language"]],
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        overview: json["overview"] == null ? null : json["overview"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        mediaType: json["media_type"] == null
            ? null
            : mediaTypeValues.map?[json["media_type"]],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        adult: json["adult"] == null ? null : json["adult"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
      );

  Map<String, dynamic> toJson() => {
        "original_name": originalName == null ? null : originalName,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry?.map((x) => x) ?? {}),
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds?.map((x) => x) ?? {}),
        "original_language": originalLanguage == null
            ? null
            : originalLanguageValues.reverse[originalLanguage],
        "poster_path": posterPath == null ? null : posterPath,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate?.year.toString().padLeft(4, '0')}-${firstAirDate?.month.toString().padLeft(2, '0')}-${firstAirDate?.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
        "overview": overview == null ? null : overview,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "popularity": popularity == null ? null : popularity,
        "media_type":
            mediaType == null ? null : mediaTypeValues.reverse[mediaType],
        "release_date": releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "adult": adult == null ? null : adult,
        "original_title": originalTitle == null ? null : originalTitle,
        "title": title == null ? null : title,
        "video": video == null ? null : video,
      };
}

enum MediaType { TV, MOVIE }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, ES }

final originalLanguageValues =
    EnumValues({"en": OriginalLanguage.EN, "es": OriginalLanguage.ES});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap ?? {};
  }
}
