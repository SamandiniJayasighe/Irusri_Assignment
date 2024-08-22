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
  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(value: 'nameAZ', child: Text('Name (A-Z)')),
    const DropdownMenuItem(value: 'nameZA', child: Text('Name (Z-A)')),
    const DropdownMenuItem(value: 'capitalAZ', child: Text('Capital (A-Z)')),
    const DropdownMenuItem(value: 'capitalZA', child: Text('Capital (Z-A)')),
    const DropdownMenuItem(
        value: 'populationHL', child: Text('Population (High-Low)')),
    const DropdownMenuItem(
        value: 'populationLH', child: Text('Population (Low-High)')),
  ];
  @override
  Widget build(BuildContext context) {
    var countries = Provider.of<CountryProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
        height: height * 0.25,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
                child: Container(
              height: height * 0.1,
              width: width,
              decoration: const BoxDecoration(
                color: Color(0xFF00004B),
              ),
            )),
            Column(
              children: [
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.language, color: Colors.white),
                    SizedBox(width: width * 0.02),
                    const Text(
                      'European Countries',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        onChanged: (value) {
                          countries.filterCountries(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search Countries',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )),
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
                    SizedBox(width: width * 0.10),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
