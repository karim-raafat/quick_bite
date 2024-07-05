import 'package:quick_bite/models/filter.dart';
import 'package:quick_bite/models/food_type.dart';
import 'package:quick_bite/models/menu_item.dart';
import 'package:quick_bite/models/restaurant.dart';
import 'package:quick_bite/models/topping.dart';
import 'package:quick_bite/utils/helper_methods.dart';

MenuItem falafel = MenuItem(
    name: 'Sandwich Falafel',
    description: 'Falafel, Lettuce, Tomato, Tahena',
    imagePath: 'assets/images/Food/Falafel.jpg',
    price: 3.0,
    type: FoodType.SANDWICH,
    isPopular: true);

MenuItem foul = MenuItem(
    name: 'Sandwich Foul',
    description: 'Foul',
    imagePath: 'assets/images/Food/Foul.png',
    price: 2.5,
    type: FoodType.SANDWICH,
    isPopular: true);

MenuItem fries = MenuItem(
    name: 'Sandwich Fries',
    description: 'Fries, Salad, Tahena',
    imagePath: 'assets/images/Food/Fries.jpg',
    price: 2.5,
    type: FoodType.SANDWICH,
    isPopular: false);

MenuItem seaRanch = MenuItem(
    name: 'Pizza Sea Ranch',
    description: 'Shrimps, Crabs, Fish, Pepper, Ranch sauce',
    imagePath: 'assets/images/Food/Sea Ranch.jpeg',
    price: 20.0,
    type: FoodType.PIZZA,
    isPopular: true);

MenuItem smokeyBurger = MenuItem(
    name: 'Pizza Smokey Burger',
    description: 'Burger, Tomato, Pepper, Smokey Sauce',
    imagePath: 'assets/images/Food/Smokey Burger.jpeg',
    price: 30.0,
    type: FoodType.PIZZA,
    isPopular: false);

MenuItem steak = MenuItem(
    name: 'Steak',
    description: 'Steak served with Rice and Vegetables',
    imagePath: 'assets/images/Food/Steak.png',
    price: 80.0,
    type: FoodType.STEAK,
    isPopular: true);

MenuItem pasta = MenuItem(
    name: 'White Pasta',
    description: 'Pasta with white sauce',
    imagePath: 'assets/images/Food/White Pasta.png',
    price: 20.0,
    type: FoodType.PASTA,
    isPopular: false);

Restaurant arabiata = Restaurant(
    name: 'Arabiata',
    description: 'Breakfast, Sandwiches',
    imagePath: 'assets/images/restaurants/Arabiata.jpg',
    deliverPrice: 5.0,
    rating: 4,
    deliveryTime: '10-15 min',
    type: FoodType.SANDWICH,
    menu: [foul, falafel, fries]);

Restaurant Blaban = Restaurant(
    name: 'Blaban',
    description: 'Desserts',
    imagePath: 'assets/images/restaurants/Blaban.jpeg',
    deliverPrice: 0.0,
    rating: 3,
    deliveryTime: '20-25 min',
    type: FoodType.DESSERTS,
    menu: []);

Restaurant pizzaPrimos = Restaurant(
    name: 'Pizza Primos',
    description: 'Pizza',
    imagePath: 'assets/images/restaurants/Pizza Primos.jpeg',
    deliverPrice: 4.5,
    rating: 5,
    deliveryTime: '60-75 min',
    type: FoodType.PIZZA,
    menu: [seaRanch, smokeyBurger]);

Restaurant secondCup = Restaurant(
    name: 'Second Cup',
    description: 'Cafe',
    imagePath: 'assets/images/restaurants/Second Cup.jpeg',
    deliverPrice: 0.0,
    rating: 4,
    deliveryTime: '10-15 min',
    type: FoodType.CAFE,
    menu: []);

Restaurant sizzler = Restaurant(
    name: 'Sizzler',
    description: 'Steak,Lunch',
    imagePath: 'assets/images/restaurants/Sizzler.png',
    deliverPrice: 8.0,
    rating: 5,
    deliveryTime: '30-35 min',
    type: FoodType.STEAK,
    menu: [steak, pasta]);

Restaurant Sushimi = Restaurant(
    name: 'Sushimi by K',
    description: 'Sushi',
    imagePath: 'assets/images/restaurants/Sushimi.jpeg',
    deliverPrice: 6.5,
    rating: 4,
    deliveryTime: '40-45 min',
    type: FoodType.SUSHI,
    menu: []);


Topping tomato = Topping(name: 'Tomatoes', price: 0.5, type: FoodType.SANDWICH);

Topping pepper = Topping(name: 'Pepper', price: 0.5, type: FoodType.SANDWICH);

Topping ketchup = Topping(name: 'Ketchup', price: 0.25, type: FoodType.SANDWICH);

Topping mayo = Topping(name: 'Mayo', price: 0.25, type: FoodType.SANDWICH);

Topping bbq = Topping(name: 'BBQ sauce', price: 0.35, type: FoodType.PIZZA);

Topping cheese = Topping(name: 'Cheese', price: 0.25, type: FoodType.PIZZA);

Topping mushroom = Topping(name: 'Mushroom', price: 0.45, type: FoodType.PIZZA);

Topping seafood = Topping(name: 'Seafood', price: 1.25, type: FoodType.PASTA);

Topping chicken = Topping(name: 'Chicken', price: 1.0, type: FoodType.PASTA);

Topping sweetChili = Topping(name: 'Sweet Chili', price: 0.5, type: FoodType.STEAK);


Filter steakF = Filter(name: typeToString(FoodType.STEAK));

Filter pastaF = Filter(name: typeToString(FoodType.PASTA));

Filter pizzaF = Filter(name: typeToString(FoodType.PIZZA));

Filter sandwichF = Filter(name: typeToString(FoodType.SANDWICH));

Filter kebabF = Filter(name: typeToString(FoodType.KEBAB));

Filter japaneseF = Filter(name: typeToString(FoodType.JAPANESE));

Filter indianF = Filter(name: typeToString(FoodType.INDIAN));

Filter dessertF = Filter(name: typeToString(FoodType.DESSERTS));

Filter burgerF = Filter(name: typeToString(FoodType.BUREGER));

Filter cafeF = Filter(name: typeToString(FoodType.CAFE));

Filter sushiF = Filter(name: typeToString(FoodType.SUSHI));

Filter saladF = Filter(name: typeToString(FoodType.SALAD));

