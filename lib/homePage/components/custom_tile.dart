import 'package:flutter/material.dart';
import 'package:irusri_se_assignment/countryPage/country_page.dart';
import 'package:irusri_se_assignment/homePage/models/country.dart';


class CountryListTile extends StatelessWidget {
  final Country country;

  const CountryListTile({super.key, 
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage.assetNetwork(
        placeholder: "assets/placeholder.png",
        image: country.flags["png"]!,
        width: 30,
        height: 30,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, size: 30);
        },
      ),
      title: Text(country.commonName),
      subtitle: Text(country.capital[0]),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CountryPage(country: country);
          }));
        },
      ),
    );
  }
}
