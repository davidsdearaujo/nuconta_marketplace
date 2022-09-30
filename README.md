# NuConta Marketplace

https://user-images.githubusercontent.com/16373553/137410341-936310d2-d876-4284-843d-7ff584ae6093.mp4

Layout based in [this drible project](https://dribbble.com/shots/15544535-Sneakers-Shopping-App)

## A Flutter project made using:
- **Clean Dart** that follows all the **Clean Architecture** guidelines [[doc]](https://github.com/Flutterando/Clean-Dart/blob/cce751ea0a22a796c3559ba458f50d9a0552c4ef/README_en.md)

- **Flutter Tiple** pattern for state management [[pub.dev]](https://pub.dev/packages/flutter_triple) [[doc]](https://triple.flutterando.com.br/docs/getting-started/using-flutter-triple/)

- **Flutter Modular** for dependency injection and routes [[pub.dev]](https://pub.dev/packages/flutter_modular) [[doc]](https://modular.flutterando.com.br/)

- **Hasura Connect** for GraphQL abstraction [[pub.dev]](https://pub.dev/packages/hasura_connect)

## About the modules
This project has been developed using module structure, to allow the separation of each module in packages, facilitating the maintenance end cohesion of each module and domain.

 - **CoreModule**: responsible by providing a basic resources to all modules;
 - **DesignSystemModule**: responsible by providing a common theme resources like colors, fonts and widgets to all modules;
 - **MarketplaceModule**: responsible by marketplace scope;

## To run te project:
```
flutter pub get
flutter run
```

## If it's your first Flutter Project

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
