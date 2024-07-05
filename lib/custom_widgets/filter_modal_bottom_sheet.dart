import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/provider/app_provider.dart';

class FilterModalBottomSheet extends StatefulWidget {
  const FilterModalBottomSheet({super.key});

  @override
  State<FilterModalBottomSheet> createState() => _FilterModalBottomSheetState();
}

class _FilterModalBottomSheetState extends State<FilterModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                onTap: (){
                  context.pop();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.blueGrey[900],
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: appProvider.allFilter.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 9,
                mainAxisExtent: 35,
              ),
              itemBuilder: (context, index) {
                return Consumer<AppProvider>(
                  builder: (BuildContext context, AppProvider appProvider,
                      Widget? child) {
                    return FilterChip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor:
                          (!appProvider.allFilter[index].isSelected)
                              ? Colors.white
                              : Colors.blueGrey[900],
                      labelStyle: TextStyle(
                          color: (appProvider.allFilter[index].isSelected)
                              ? Colors.white
                              : Colors.blueGrey[900]),
                      label: Text(appProvider.allFilter[index].name),
                      onSelected: (value) {
                        appProvider
                            .addRemoveFilter(appProvider.allFilter[index]);
                      },
                    );
                  },
                );
              },
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.blueGrey[900],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'SORT BY',
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              FilterChip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.blueGrey[900],
                labelStyle: const TextStyle(color: Colors.white),
                label: const Text('open now'),
                onSelected: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterChip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.blueGrey[900]),
                  label: const Text('free delivery'),
                  onSelected: (value) {},
                ),
              ),
              FilterChip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.white,
                labelStyle: TextStyle(color: Colors.blueGrey[900]),
                label: const Text('5 Star'),
                onSelected: (value) {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
