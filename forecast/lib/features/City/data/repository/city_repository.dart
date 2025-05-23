import 'package:forecast/features/City/data/datasource/local_data_source.dart';
import 'package:forecast/features/City/domain/repository/abstract_city_repository.dart';

class CityRepositoryImpl extends CityRepository {
  final LocalDataSource localDataSource;

  CityRepositoryImpl(this.localDataSource);
  @override
  Future<String> getCity() async {
    final String? city = await localDataSource.getCity();
    return city ?? 'Unknown City';
  }

  @override
  Future<void> saveCity(String city) async {
    await localDataSource.saveCity(city);
  }
}
