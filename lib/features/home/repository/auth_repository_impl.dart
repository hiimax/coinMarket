import 'package:prodev/core/api/api_helper.dart';
import 'package:prodev/features/home/models/new_response_model.dart';
import 'package:prodev/features/home/repository/auth_repository.dart';

final class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._apiHandler);

  final ApiHandler _apiHandler;

  @override
  Future<ApiResponse<NewReleaseResponse>> getRecentlyPlayed() {
    return _apiHandler.request(
      path: 'browse/new-releases',
      method: MethodType.get,
      responseMapper: NewReleaseResponse.fromJson,
      queryParameters: {
        "limit" :'10'
      }
    );
  }

   @override
  Future<ApiResponse<NewReleaseResponse>> getFavoritePlaylist() {
    return _apiHandler.request(
      path: 'browse/featured-playlists',
      method: MethodType.get,
      responseMapper: NewReleaseResponse.fromJson,
      queryParameters: {
        "limit" :'10'
      }
    );
  }
}
