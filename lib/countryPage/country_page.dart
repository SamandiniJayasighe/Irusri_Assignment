import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:irusri_se_assignment/homePage/models/country.dart';

class CountryPage extends StatelessWidget {
  final Country country;
  const CountryPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'Capital',
      'Region',
      'Population',
      'Languages'
    ];
    final List<String> values = [
      country.capital[0],
      country.region,
      NumberFormat('#,##0').format(country.population),
      country.languages.values.toList().join(', ')
    ];
    double height = MediaQuery.of(context).size.height - 35;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(child:Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          title: Text(country.commonName, style: const TextStyle(fontSize: 18.0, color: Colors.white)),
          backgroundColor: const Color(0xFF00004B),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: height * 0.9,
            width: width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.3,
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(country.flags["png"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              country.officialName,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '(${country.commonName})',
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Expanded(
                              child: GridView.builder(
                                itemCount: 4,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 0.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: (index == 1 || index == 3)
                                              ? Colors.transparent
                                              : Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          titles[index],
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          values[index],
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        )));
  }
}