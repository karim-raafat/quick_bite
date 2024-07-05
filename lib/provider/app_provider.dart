import 'package:flutter/cupertino.dart';
import 'package:quick_bite/models/filter.dart';
import 'package:quick_bite/models/food_type.dart';
import 'package:quick_bite/models/menu_item.dart';
import 'package:quick_bite/models/restaurant.dart';
import 'package:quick_bite/models/topping.dart';
import 'package:quick_bite/utils/constants.dart';
import 'package:quick_bite/utils/helper_methods.dart';

class AppProvider extends ChangeNotifier {
  List<Restaurant> _allRestaurants = [
    arabiata,
    Blaban,
    pizzaPrimos,
    secondCup,
    sizzler,
    Sushimi,
  ];
  List<MenuItem> _allItems = [
    falafel,
    foul,
    fries,
    seaRanch,
    smokeyBurger,
    steak,
    pasta
  ];
  List<Topping> _allToppings = [
    tomato,
    pepper,
    bbq,
    ketchup,
    mayo,
    mushroom,
    seafood,
    cheese,
    sweetChili,
  ];
  List<Filter> _allFilter = [
    sandwichF,
    pastaF,
    steakF,
    cafeF,
    pizzaF,
    sushiF,
    burgerF,
    dessertF,
    indianF,
    japaneseF,
    kebabF,
  ];

  List<FoodType> _filters = [];
  Map<MenuItem,int> _shoppingCart = {};

  late Restaurant restaurant;
  late MenuItem menuItem;

  double _subtotal = 0;
  double _total = 0;
  int _quantity = 1;
  int selectedIndex = 0;


  int get quantity => _quantity;

  void changeState(value){
    selectedIndex = value;
    notifyListeners();
  }

  void returnHome(){
    total = 0;
    subtotal = 0;
    filters = [];
    shoppingCart = {};
    selectedIndex = 0;
    notifyListeners();
  }


  set shoppingCart(Map<MenuItem, int> value) {
    _shoppingCart = value;
  }

  set quantity(int value) {
    _quantity = value;
  }

  double get subtotal => _subtotal;

  set subtotal(double value) {
    _subtotal = value;
  }

  List<Restaurant> get allRestaurants => _allRestaurants;

  List<MenuItem> get allItems => _allItems;

  List<Topping> get allToppings => _allToppings;

  List<Filter> get allFilter => _allFilter;

  List<FoodType> get filters => _filters;

  Map<MenuItem,int> get shoppingCart => _shoppingCart;

  set filters(List<FoodType> value) {
    _filters = value;
  }

  void resetToppings(){
    for(int i = 0 ; i<allToppings.length; i++){
      allToppings[i].isSelected = false;
    }
  }




  void addToCart(MenuItem menuItem){
    if(shoppingCart.containsKey(menuItem)){
      shoppingCart.update(menuItem, (value) => value+quantity);
    }
    else{
      shoppingCart.addAll({menuItem : quantity});
    }
    total+=subtotal;
    notifyListeners();
  }

  void addQuantityCart(MenuItem menuItem){
    shoppingCart.update(menuItem, (value){return ++value;});
    total+=menuItem.price;
    notifyListeners();
  }
  void removeQuantityCart(MenuItem menuItem){
    if(shoppingCart[menuItem]!>0){
      shoppingCart.update(menuItem, (value){return --value;});
      total-=menuItem.price;
    }
    notifyListeners();
  }

  void addQuantity(double price){
    _quantity++;
    subtotal+=price;
    notifyListeners();
  }
  void removeQuantity(double price){
    if(quantity>1){
      subtotal-=price;
      _quantity--;
    }
    notifyListeners();
  }



  void addRemoveFilter(Filter filter){
    if(filter.isSelected){
      filters.remove(stringToType(filter.name));
      filter.isSelected = false;
    }
    else{
      filters.add(stringToType(filter.name));
      filter.isSelected = true;
    }
    notifyListeners();
  }

  void chooseRestaurant(Restaurant restaurant){
    this.restaurant = restaurant;
    notifyListeners();
  }

  void chooseMenuItem(MenuItem menuItem){
    this.menuItem = menuItem;
    notifyListeners();
  }

  List<Restaurant> freeDelivery(){
    List<Restaurant> freeDelivery = [];
    for(int i = 0 ; i<allRestaurants.length ; i++){
      if(allRestaurants[i].deliverPrice == 0){
        freeDelivery.add(allRestaurants[i]);
      }
    }
    return freeDelivery;
  }

  List<FoodType> foodTypes(Restaurant restaurant){
    List<FoodType> allTypes = [];
    for(int i = 0 ; i<restaurant.menu.length; i++){
      if(!allTypes.contains(restaurant.menu[i].type)){
        allTypes.add(restaurant.menu[i].type);
      }
    }
    return allTypes;
  }

  List<Restaurant> filterRestaurant() {
    List<Restaurant> results = [];
    for(int i = 0 ; i < filters.length ; i++){
      for(int j = 0 ; j < allRestaurants.length; j++){
        if(allRestaurants[j].type == filters[i]){
          results.add(allRestaurants[j]);
        }
      }
    }
    if(filters.isEmpty){
      for(int i = 0 ; i < allRestaurants.length ; i++){
        results.add(allRestaurants[i]);
      }
    }
    return results;
  }

  List<Restaurant> resultRestaurant(List<Restaurant> filterRestaurant, String search){
    List<Restaurant> results = [];
    for(int i = 0; i < filterRestaurant.length ; i++){
      if(filterRestaurant[i].name.toLowerCase().contains(search.toLowerCase())){
        results.add(filterRestaurant[i]);
      }
    }
    return results;
  }

  List<MenuItem> filterMenuItems() {
    List<MenuItem> results = [];
    for(int i = 0 ; i < filters.length ; i++){
      for(int j = 0 ; j < allItems.length; j++){
        if(allItems[j].type == filters[i]){
          results.add(allItems[j]);
        }
      }
    }
    if(filters.isEmpty){
      for(int i = 0 ; i < allItems.length ; i++){
        results.add(allItems[i]);
      }
    }
    return results;
  }

  List<MenuItem> resultMenuItems(List<MenuItem> filterMenuItems, String search){
    List<MenuItem> results = [];
    for(int i = 0; i < filterMenuItems.length ; i++){
      if(filterMenuItems[i].name.toLowerCase().contains(search.toLowerCase())){
        results.add(filterMenuItems[i]);
      }
    }
    return results;
  }

  void selectTopping(Topping topping){
    topping.isSelected = !topping.isSelected;
    if(topping.isSelected){
      subtotal+=topping.price;
    }
    else{
      subtotal-=topping.price;
    }
    notifyListeners();
  }

  double get total => _total;

  set total(double value) {
    _total = value;
  }
}


