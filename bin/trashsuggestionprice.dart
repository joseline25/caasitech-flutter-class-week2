//import 'package:trashsuggestionprice/trashsuggestionprice.dart' as trashsuggestionprice;
import 'package:trashsuggestionprice/src/trash.dart';


void main(List<String> arguments) {
  //print('Hello world: ${trashsuggestionprice.calculate()}!');
  Trash t = Trash();

  print("=="*50);
  t.sizeSet();
  print("=="*50);
  print("The size of the object is :");
  print(t.size);

  print("=="*50);
  t.quantitySet();
  // print("=="*50);
  // print("The quantity of the object is ");
  // print(t.quantity);

  print("=="*50);
  print(t.thresholdCheck());

  
}
