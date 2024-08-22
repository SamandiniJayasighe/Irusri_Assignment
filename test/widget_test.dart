import 'package:flutter_test/flutter_test.dart';
import 'package:irusri_se_assignment/homePage/models/country.dart';
import 'package:irusri_se_assignment/homePage/apiClient/client.dart';
import 'package:irusri_se_assignment/homePage/providers/country_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([ApiClient])
void main(){
  late ApiClient mockApiClient;
  late CountryProvider countryProvider;

  setUp((){
    mockApiClient = MockApiClient();
    countryProvider = CountryProvider();
  });

  test(
    'filter countries by name', 
    ()async{
    final countries = [
      Country(
        commonName: 'United Kingdom',
        officialName: 'United Kingdom of Great Britain and Northern Ireland',
        population: 67215293,
        capital: ['London'],
        flags: {'png': 'https://flagcdn.com/w320/gb.png', 'svg': 'https://flagcdn.com/gb.svg', 'alt': 'The flag of the United Kingdom — the Union Jack — has a blue field. It features the white-edged red cross of Saint George superimposed on the diagonal red cross of Saint Patrick which is superimposed on the diagonal white cross of Saint Andrew.'},
        languages: {'eng': 'English'},
        region: 'Europe'
      )
    ];
    when(mockApiClient.getCountries('europe')).thenAnswer((_) async => countries);
    await countryProvider.fetchCountries();
    countryProvider.filterCountries('United Kingdom');
    expect(countryProvider.filteredCountries[0].capital, countries[0].capital);
    expect(countryProvider.filteredCountries[0].commonName, countries[0].commonName);
    expect(countryProvider.filteredCountries[0].officialName, countries[0].officialName);
  });

  test('oder by name ASC', ()async{
    final countries = [
      Country(
        commonName: "Albania",
        officialName: "Republic of Albania",
        population: 2877797,
        capital: ["Tirana"],
        flags: {"png": "https://flagcdn.com/w320/al.png", "svg": "https://flagcdn.com/al.svg", "alt": "The flag of Albania has a red field with a black, two-headed eagle in the center."},
        languages: {"sqi": "Albanian"},
        region: "Europe"
      )
    ];
    when(mockApiClient.getCountries('europe')).thenAnswer((_) async => countries);
    await countryProvider.fetchCountries();
    countryProvider.orderByName();
    expect(countryProvider.filteredCountries[0].capital, countries[0].capital);
    expect(countryProvider.filteredCountries[0].commonName, countries[0].commonName);
    expect(countryProvider.filteredCountries[0].officialName, countries[0].officialName);
  });

    test('oder by name DESC', ()async{
    final countries = [
      Country(
        commonName: "Åland Islands",
        officialName: "Åland Islands",
        population: 28875,
        capital: ["Mariehamn"],
        flags: {"png": "https://flagcdn.com/w320/ax.png", "svg": "https://flagcdn.com/ax.svg", "alt": "The flag of Åland Islands has a red field with a golden cross."},
        languages: {"swe": "Swedish"},
        region: "Europe"
      )
    ];
    when(mockApiClient.getCountries('europe')).thenAnswer((_) async => countries);
    await countryProvider.fetchCountries();
    countryProvider.orderByName(ascending: false);
    expect(countryProvider.filteredCountries[0].capital, countries[0].capital);
    expect(countryProvider.filteredCountries[0].commonName, countries[0].commonName);
    expect(countryProvider.filteredCountries[0].officialName, countries[0].officialName);

  });

  test('oder by population ASC', ()async{
    final countries = [
      Country(
        commonName: "Vatican City",
        officialName: "Vatican City State",
        population: 825,
        capital: ["Vatican City"],
        flags: {"png": "https://flagcdn.com/w320/va.png", "svg": "https://flagcdn.com/va.svg", "alt": "The flag of Vatican City has two vertical bands, one gold or yellow (hoist side) and one white, with Saint Peter's crossed keys and the Papal Tiara centered in the white band."},
        languages: {"ita": "Italian"},
        region: "Europe"
      )
    ];
    when(mockApiClient.getCountries('europe')).thenAnswer((_) async => countries);
    await countryProvider.fetchCountries();
    countryProvider.orderByPopulation();
    expect(countryProvider.filteredCountries[0].capital, countries[0].capital);
    expect(countryProvider.filteredCountries[0].commonName, countries[0].commonName);
    expect(countryProvider.filteredCountries[0].officialName, countries[0].officialName);
  });

  test('oder by population DESC', ()async{
    final countries = [
      Country(
        commonName: "Russia",
        officialName: "Russian Federation",
        population: 146171015,
        capital: ["Moscow"],
        flags: {"png": "https://flagcdn.com/w320/ru.png", "svg": "https://flagcdn.com/ru.svg", "alt": "The flag of Russia has three horizontal bands of white, blue, and red."},
        languages: {"rus": "Russian"},
        region: "Europe"
      )
    ];
    when(mockApiClient.getCountries('europe')).thenAnswer((_) async => countries);
    await countryProvider.fetchCountries();
    countryProvider.orderByPopulation(ascending: false);
    expect(countryProvider.filteredCountries[0].capital, countries[0].capital);
    expect(countryProvider.filteredCountries[0].commonName, countries[0].commonName);
    expect(countryProvider.filteredCountries[0].officialName, countries[0].officialName);
  });

  test("order by capital ASC",()async{
    final countries = [
      Country(
        commonName: "Netherlands",
        officialName: "Kingdom of the Netherlands",
        population: 17125200,
        capital: ["Amsterdam"],
        flags: {"png": "https://flagcdn.com/w320/nl.png", "svg": "https://flagcdn.com/nl.svg", "alt": "The flag of the Netherlands has three horizontal bands of red, white, and blue."},
        languages: {"nld": "Dutch"},
        region: "Europe"
      )
    ];
    when(mockApiClient.getCountries('europe')).thenAnswer((_) async => countries);
    await countryProvider.fetchCountries();
    countryProvider.orderByCapital();
    expect(countryProvider.filteredCountries[0].capital, countries[0].capital);
    expect(countryProvider.filteredCountries[0].commonName, countries[0].commonName);
    expect(countryProvider.filteredCountries[0].officialName, countries[0].officialName);
  });

  test("order by capital DESC",()async{
    final countries = [
      Country(
        commonName: "Croatia",
        officialName: "Republic of Croatia",
        population: 4047200,
        capital: ["Zagreb"],
        flags: {"png": "https://flagcdn.com/w320/hr.png", "svg": "https://flagcdn.com/hr.svg", "alt": "The flag of Croatia has three horizontal bands of red, white, and blue."},
        languages: {"hrv": "Croatian"},
        region: "Europe"
      )
    ];
    when(mockApiClient.getCountries('europe')).thenAnswer((_) async => countries);
    await countryProvider.fetchCountries();
    countryProvider.orderByCapital(ascending: false);
    expect(countryProvider.filteredCountries[0].capital, countries[0].capital);
    expect(countryProvider.filteredCountries[0].commonName, countries[0].commonName);
    expect(countryProvider.filteredCountries[0].officialName, countries[0].officialName);
  });


}
