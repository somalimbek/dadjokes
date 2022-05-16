# Dad Jokes

This is a project I started to exercise iOS development and to try technologies I haven't used yet.

## Features
- Random joke
- Save and display favourite jokes

For detailed feature description, see Functional Specification.

## Functional Specification
- Home Screen
    - Two buttons (in any arrangement)
    - Ket gomb tetszőleges elrendezésben
        - Display a random joke on a new screen
        - Display favourites
- Random joke screen
  - Display random joke
    - Api call for random joke
    - Display the joke coming in response
      - Setup of joke is displayed when the screen is presented
      - Punchline is displayed after user interaction
  - Mark joke as favourite
    - Display a star representing whether the joke is favourite or not. Filled: favourite, empty not favourite.
    - Save additional data (on top of the ones coming in api response):
      - Name of the joke - ask for user input
      - Date when the joke is saved
    - If there is no space for adding more favourites:
      - Inform user that he/she cannot add new joke until deletin one
- Favourites screen
  - List favourites
    - Sorting: alphabetic - based on the name of joke
    - Storing: locally
    - Maximum number of favourites: 10

## Technical Documentation

### UI layer architecture
The aim is to exercise SwiftUI, so the plan is to implement the whole UI in SwiftUI. The architecture for UI codes are:
- MVVM when using SwiftUI
- MVP when using UIKit (if needed)

### Business Layer Architecture
The business logic classes are organized based on the [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

### Dependency Management
Swift Package Manager is used for dependency management. Let's find out what's it got.

### Dependency Injection
Decision needed! Also need to consider if the choice I make [fits SwiftUI](https://mokacoding.com/blog/swiftui-dependency-injection/)!
- [ ] [Swinject](https://github.com/Swinject/Swinject)
- [ ] [Resolver](https://github.com/hmlongco/Resolver)
- [ ] Writing [my own](https://www.avanderlee.com/swift/dependency-injection/) DI system

### Navigation
- [ ] Need to look into navigation with SwiftUI

### Network Calls
The API webpage can generate calls to the endpoints in Swift. I'm using (i.e. copying) those.

### Unit Tests
ViewModels are unit tested.
- Try the native unit testing framework and a 3rd party one as well.

### Persistent storage
- [ ] Needs looking into. Ideas are SQLite or some 3rd party framework.

### Error handling
Networking errors need to be handled always the same way:
1. Propagate the error description from the network call.
2. If there is an empty or no description, a common error message is displayed.

### Localization
- [ ] Pick some framework for localization.

### Mocking
Mock objects are needed for unit testing and easier development.
- [ ] Need to decide what layer needs to have a mock version (repository and/or datasource).
