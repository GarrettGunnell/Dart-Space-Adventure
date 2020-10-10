import 'dart:io';

void main() {
    print("Welcome to the Solar System");
    print("There are 9 planets to explore.");
    print("What is your name?");
    String name = stdin.readLineSync();
    print("Nice to meet you, ${name}.");
    print("Let's go on an adventure.");
    print("Shall I randomly choose a planet for you? (Y / N)");
    print("Name the planet you would like to visit.");
    print("Traveling to Earth");
    print("The shattered remains of this former planet can be found drifting through space, or in souvenir shops around the galaxy.");
}