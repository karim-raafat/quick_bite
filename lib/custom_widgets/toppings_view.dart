import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/provider/app_provider.dart';

class ToppingsView extends StatefulWidget {
  ToppingsView({super.key});

  @override
  State<ToppingsView> createState() => _ToppingsViewState();
}

class _ToppingsViewState extends State<ToppingsView> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: appProvider.allToppings.length,
        itemBuilder: (context, index) {
          return (appProvider.menuItem.type ==
                  appProvider.allToppings[index].type)
              ? Consumer<AppProvider>(builder: (BuildContext context, AppProvider appProvider, Widget? child) {
                return ListTile(
                  leading: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    checkColor: Colors.blueGrey[900],
                    activeColor: Colors.grey,

                    focusColor: Colors.white,
                    value: appProvider.allToppings[index].isSelected,
                    onChanged: (value) {
                      appProvider.selectTopping(appProvider.allToppings[index]);
                    },
                  ),
                  title: Text(
                    appProvider.allToppings[index].name,
                    style: TextStyle(color: Colors.blueGrey[900]),
                  ),
                  trailing:
                  Text('+ \$${appProvider.allToppings[index].price}',style: const TextStyle(fontSize: 14),),
                );
          },)
              : const SizedBox();
        });
  }
}
