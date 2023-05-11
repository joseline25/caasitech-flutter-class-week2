
import 'dart:io';

List sizeChoices = ["bucket", "trashbag", "wheelbarrow"];
dynamic sizeValues = {"bucket": 10, "trashbag": 20, "wheelbarrow": 50};
dynamic sizePrice = {"bucket": 100, "trashbag": 200, "wheelbarrow": 500};

double threshold = 600;

class Trash {
  String? size;
  int quantity = 0;

  Trash();

  // set size of the trash

  sizeSet() {
    final range = <int>[0, 1, 2];

    try {
      print(
          "Enter an integer value between 0 and 2 with 0 for \" Bucket \", 1 for \" Trashbag \" and 2 for \" Wheelbarrow \" ");
      String? value = stdin.readLineSync();
      if (value != null) {
        int n = int.parse(value);
        if (range.contains(n)) {
          size = sizeChoices[n];
        } else {
          print("value different from 0, 1 or 2!!!!");
          sizeSet();
        }
      }
    } catch (e) {
      sizeSet();
    }
  }

  // set quantity to be at least 1

  quantitySet() {
    // make sure the size is set

    if (size == "") {
      sizeSet();
    }

    // set the quantity to be an integer (at least 1)

    try {
      print("Enter the quantity of $size ");
      String? value = stdin.readLineSync();
      if (value != null) {
        int n = int.parse(value);
        if (n > 0) {
          quantity = n;
        } else {
          print("The quantity should be at least 1");
          quantitySet();
        }
      }
    } catch (e) {
      quantitySet();
    }
  }

  // compute the price

  price() {
    if (size == "") {
      sizeSet();
    }
    if (quantity == 0) {
      quantitySet();
    }
    return quantity * sizePrice[size];
  }

  // check the threshold

  thresholdCheck() {
    var p = price();
    var totalvolume = quantity * sizeValues[size];

    if (totalvolume  >= threshold ) {
      return "$totalvolume liters is above the threshold! report to the admin.";
    }else{
      return "$totalvolume liters is below the threshold and the price is $p XAF";
    }
  }
}
