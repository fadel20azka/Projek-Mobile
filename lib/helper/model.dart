class ResultModel {
  List<Results>? results;
  ResultModel({this.results});
  ResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Result {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Results>? results;

  Result({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  Result.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        next = json['next'],
        previous = json['previous'],
        results = (json['results'] as List?)?.map((dynamic e) => Results.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'count' : count,
    'next' : next,
    'previous' : previous,
    'results' : results?.map((e) => e.toJson()).toList()
  };
}

class Results {
  final String? title;
  final int? episodeId;
  final String? openingCrawl;
  final String? director;
  final String? producer;
  final String? releaseDate;
  final List<String>? characters;
  final List<String>? planets;
  final List<String>? starships;
  final List<String>? vehicles;
  final List<String>? species;
  final String? created;
  final String? edited;
  final String? url;

  Results({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.created,
    this.edited,
    this.url,
  });

  Results.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        episodeId = json['episode_id'] as int?,
        openingCrawl = json['opening_crawl'] as String?,
        director = json['director'] as String?,
        producer = json['producer'] as String?,
        releaseDate = json['release_date'] as String?,
        characters = (json['characters'] as List?)?.map((dynamic e) => e as String).toList(),
        planets = (json['planets'] as List?)?.map((dynamic e) => e as String).toList(),
        starships = (json['starships'] as List?)?.map((dynamic e) => e as String).toList(),
        vehicles = (json['vehicles'] as List?)?.map((dynamic e) => e as String).toList(),
        species = (json['species'] as List?)?.map((dynamic e) => e as String).toList(),
        created = json['created'] as String?,
        edited = json['edited'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'title' : title,
    'episode_id' : episodeId,
    'opening_crawl' : openingCrawl,
    'director' : director,
    'producer' : producer,
    'release_date' : releaseDate,
    'characters' : characters,
    'planets' : planets,
    'starships' : starships,
    'vehicles' : vehicles,
    'species' : species,
    'created' : created,
    'edited' : edited,
    'url' : url
  };
}