import 'package:irusri_se_assignment/homePage/providers/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAndSortWidget extends StatefulWidget {
  const SearchAndSortWidget({super.key});

  @override
  SearchAndSortWidgetState createState() => SearchAndSortWidgetState();
}

class SearchAndSortWidgetState extends State<SearchAndSortWidget> {
  String dropdownValue = 'nameAZ';
  List <DropdownMenuItem<String>> items = [
    const DropdownMenuItem(value: 'nameAZ', child: Text('Name (A-Z)')),
    const DropdownMenuItem(value: 'nameZA', child: Text('Name (Z-A)')),
    const DropdownMenuItem(value: 'capitalAZ', child: Text('Capital (A-Z)')),
    const DropdownMenuItem(value: 'capitalZA', child: Text('Capital (Z-A)')),
    const DropdownMenuItem(value: 'populationHL', child: Text('Population (High-Low)')),
    const DropdownMenuItem(value: 'populationLH', child: Text('Population (Low-High)')),
  ];
  @override
  Widget build(BuildContext context) {
    var countries = Provider.of<CountryProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.15,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: TextField(
                    onChanged: (value) {
                      countries.filterCountries(value);
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search Countries',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                value: dropdownValue,
                disabledHint: const Text('Order by'),
                items: items,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                  if (value != null) {
                    switch (value) {
                      case 'nameAZ':
                        countries.orderByName();
                        break;
                      case 'nameZA':
                        countries.orderByName(ascending: false);
                        break;
                      case 'capitalAZ':
                        countries.orderByCapital();
                        break;
                      case 'capitalZA':
                        countries.orderByCapital(ascending: false);
                        break;
                      case 'populationHL':
                        countries.orderByPopulation(ascending: false);
                        break;
                      case 'populationLH':
                        countries.orderByPopulation();
                        break;
                      default:
                        break;
                    }
                  }
                },
              ),
            ),
            ],
          )
        ],
      ),
    );
  }
}
