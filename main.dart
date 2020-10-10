import 'dart:io';

void main() {
    print("Welcome to the Solar System");
    print("There are 9 planets to explore.");
    print("What is your name?");
    String name = stdin.readLineSync();
    print("Nice to meet you, ${name}.");
    print("Let's go on an adventure.");
    print("Shall I randomly choose a planet for you? (Y / N)");
    String randomChoice = getValidInput(['Y', 'N']);
    switch (randomChoice) {
        case 'Y':
            print("Traveling..");
            break;
        case 'N':
            print("Name the planet you would like to visit");
            break;
    }
    print("Traveling to Earth");
    print("The shattered remains of this former planet can be found drifting through space, or in souvenir shops around the galaxy.");
}

String getValidInput(List<String> validInputs) {
    String input = stdin.readLineSync();
    if (validInputs.contains(input)) return input;
    
    print("I'm sorry, I don't understand.");
    return getValidInput(validInputs);
}