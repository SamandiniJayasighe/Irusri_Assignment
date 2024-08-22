import 'package:irusri_se_assignment/homePage/components/custom_tile.dart';
import 'package:irusri_se_assignment/homePage/components/search_and_sort.dart';
import 'package:irusri_se_assignment/homePage/providers/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'name';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CountryProvider>(context, listen: false).fetchCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 20;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<CountryProvider>(
          builder: (context, provider, child) {
            if (provider.loading) {
              return const Center(child:SpinKitWave(
                color: Colors.deepPurple,
                size: 50.0,
              ) );
            } else if (provider.error.isNotEmpty) {
              return Center(
                child: Text(provider.error,style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20.0
                ),),
              );
            } else {
              return SingleChildScrollView(
                child: SizedBox(
                height: height,
                width: width,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SearchAndSortWidget(),
                        Expanded(
                            child: ListView.builder(
                              itemCount: provider.filteredCountries.length,
                              itemBuilder: (context, index) {
                                return CountryListTile(
                                  country: provider.filteredCountries[index],
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              );
            }
          },
        ));
  }
}
