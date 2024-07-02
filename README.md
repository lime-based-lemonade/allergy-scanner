Allergy Scanner
======================

Scan bar-codes on food to see whether it is safe for you to consume them. Define the list of ingredients you are allergic to and stay safe with this simple app!

## Content

- [Allergy Scanner](#allergy-scanner)
  - [Content](#content)
  - [How it Works](#how-it-works)
  - [Testing](#testing)
  - [Deploy and CI/CD](#deploy-and-cicd)
  - [Why did we develop this project?](#why-did-we-develop-this-project)
  - [TODO](#todo)
  - [The project team](#the-project-team)

[Project presentation](./presentation.pdf)

## How it Works

Just open the app and click on the edit icon. There you can select allergens that the app will be able to recognize in the products and warn you. Then just go back to the main menu and click on the "Scan" button. A screen with a barcode scanner will open. If an allergen is found in the scanned product, the app will let you know about it.

## Testing

Our project used the following tests: unit test, widget test and golden test for selector.
To run the unit test, run the command:
```dart
flutter test test/unit_test.dart
```
To run widget test:
```dart
flutter test test/widget_test.dart
```
To run golden test:
```dart
flutter test test/golden_test.dart
```

## Deploy and CI/CD

In order to deploy the application to the web, simply run these commands:
```
flutter pub get
flutter run web
```

## Why did we develop this project?

People with allergies often have difficulties. We wanted to help them and speed up the process of finding allergens in food. This way the user can simply scan and see if the product is safe for them.

## TODO

- [X] Update readme to include application description
- [X] Every team member should contribute
- [X] Read [Conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) for everything to be pretty
- [X] Readme gotta include team member's roles and contributions
- [X] Prepare a presentation

## The project team

* Lana Ermolaeva - home screen development, data saving, interaction between screens
* Dmitri Vizitei - created a context-independent API wrapper that can accept barcode as input, send an asynchronous request to the server, and return a Dart object containing the relevant information. Also did the tests for the application
* Valeriia Kolesnikova - created a screen for adding, removing and searching for allergens, and was engaged in localization of the application
* Dmitri Bargan - created a scanner that processes barcodes from food
* Dmitry Korletyanu - CI/CD for app
