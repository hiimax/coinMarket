

import 'package:prodev/core/api/api_helper.dart';
import 'package:prodev/features/home/models/new_response_model.dart';

abstract class HomeRepository {
  Future<ApiResponse<NewReleaseResponse>> getRecentlyPlayed();
  Future<ApiResponse<NewReleaseResponse>> getFavoritePlaylist();

}
