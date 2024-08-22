import 'package:irusri_se_assignment/homePage/models/country.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'client.g.dart';


@RestApi(baseUrl: "https://restcountries.com/v3.1/region")
abstract class ApiClient{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/{region}?fields=name,capital,flags,region,languages,population")
  Future<List<Country>> getCountries(@Path("region") String region);
}

