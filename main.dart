import 'dart:io';
import 'dart:convert';

class Planet {
    String name;
    String description;
}

class System {
    String name;
    List<Planet> planets = new List<Planet>();
}

void main() {
    final System system = parseJSON('planetarySystem.json');
    print("Welcome to the ${system.name}");
    print("There are ${system.planets.length} planets to explore.");
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

System parseJSON(final String filepath) {
    final Map<String, dynamic> data = jsonDecode(new File(filepath).readAsStringSync());
    final planets = data["planets"];

    System system = new System();
    system.name = data["name"];
    for (var i = 0; i < planets.length; ++i) {
        Planet planet = new Planet();
        planet.name = planets[i]["name"];
        planet.description = planets[i]["description"];

        system.planets.add(planet);
    }
    
    return system;
}

String getValidInput(List<String> validInputs) {
    String input = stdin.readLineSync();
    if (validInputs.contains(input)) return input;
    
    print("I'm sorry, I don't understand.");
    return getValidInput(validInputs);
}