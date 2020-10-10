import 'dart:io';
import 'dart:convert';

class System {
    String name;
    Map planets = new Map();
}

void main() {
    final System system = parseJSON('planetarySystem.json');
    print("Welcome to the ${system.name}");
    print("There are ${system.planets.length} planets to explore.");
    print("What is your name?");
    print("Nice to meet you, ${stdin.readLineSync()}.");
    print("Let's go on an adventure.");
    print("Shall I randomly choose a planet for you? (Y / N)");
    switch (getValidInput(['Y', 'N'])) {
        case 'Y':
            print("Traveling..");
            break;
        case 'N':
            print("Name the planet you would like to visit:\n${system.planets.keys}");
            break;
    }
    visitPlanet(system, "Earth");
}

System parseJSON(final String filepath) {
    final Map<String, dynamic> data = jsonDecode(new File(filepath).readAsStringSync());
    final planets = data["planets"];

    System system = new System();
    system.name = data["name"];
    for (var i = 0; i < planets.length; ++i)
        system.planets[planets[i]["name"]] = planets[i]["description"];
    
    return system;
}

String getValidInput(List<String> validInputs) {
    final input = stdin.readLineSync();
    if (validInputs.contains(input)) return input;
    
    print("I'm sorry, I don't understand.");
    return getValidInput(validInputs);
}

void visitPlanet(System system, String planet) {
    print("Traveling to ${planet}..");
    print(system.planets[planet]);
}