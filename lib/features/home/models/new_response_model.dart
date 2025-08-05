import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class NewReleaseResponse {
  final Albums albums;

  NewReleaseResponse({required this.albums});

  factory NewReleaseResponse.fromJson(Map<String, dynamic> json) =>
      NewReleaseResponse(albums: Albums.fromJson(json['albums']));

  factory NewReleaseResponse.empty() =>
      NewReleaseResponse(albums: Albums.empty());
}

class Albums {
  final String href;
  final List<Items> items;
  final num limit;
  final String next;
  final num offset;
  final Null previous;
  final num total;

  Albums({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
    href: json['href'],
    items: json['items'] == null ? <Items>[] : List<Items>.from(json['items'].map((x) => Items.fromJson(x))),
    limit: json['limit'],
    next: json['next'],
    offset: json['offset'],
    previous: json['previous'],
    total: json['total'],
  );

  factory Albums.empty() => Albums(
    href: '',
    items: [],
    limit: 0,
    next: '',
    offset: 0,
    previous: null,
    total: 0,
  );
}

class Items {
  final String albumType;
  final List<Artists> artists;
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final List<Images> images;
  final String name;
  final String releaseDate;
  final String releaseDatePrecision;
  final num totalTracks;
  final String type;
  final String uri;

  Items({
    required this.albumType,
    required this.artists,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    albumType: json['album_type'],
    artists:
        json['artists'] != null
            ? new List<Artists>.from(
              json['artists'].map((x) => Artists.fromJson(x)),
            )
            : <Artists>[],
    externalUrls:
        json['external_urls'] != null
            ? new ExternalUrls.fromJson(json['external_urls'])
            : ExternalUrls.empty(),
    href: json['href'],
    id: json['id'],
    images:
        json['images'] != null
            ? new List<Images>.from(
              json['images'].map((x) => Images.fromJson(x)),
            )
            : <Images>[],
    name: json['name'],
    releaseDate: json['release_date'],
    releaseDatePrecision: json['release_date_precision'],
    totalTracks: json['total_tracks'],
    type: json['type'],
    uri: json['uri'],
  );

  factory Items.empty() => Items(
    albumType: '',
    artists: [],
    externalUrls: ExternalUrls.empty(),
    href: '',
    id: '',
    images: [],
    name: '',
    releaseDate: '',
    releaseDatePrecision: '',
    totalTracks: 0,
    type: '',
    uri: '',
  );
}

class Artists {
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;

  Artists({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
    externalUrls: ExternalUrls.fromJson(json['external_urls']),
    href: json['href'] ?? '',
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    type: json['type'] ?? '',
    uri: json['uri'] ?? '',
  );

  factory Artists.empty() => Artists(
    externalUrls: ExternalUrls.empty(),
    href: '',
    id: '',
    name: '',
    type: '',
    uri: '',
  );
}

class ExternalUrls {
  final String spotify;

  ExternalUrls({required this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) =>
      ExternalUrls(spotify: json['spotify'] ?? '');

  factory ExternalUrls.empty() => ExternalUrls(spotify: '');
}

class Images {
  final num height;
  final String url;
  final num width;

  Images({required this.height, required this.url, required this.width});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    height: json['height'] ?? 0,
    url: json['url'] ?? '',
    width: json['width'] ?? 0,
  );

  factory Images.empty() => Images(height: 0, url: '', width: 0);
}
