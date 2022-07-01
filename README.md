# Dad Jokes

This is a project I started to exercise iOS development and to try new technologies I haven't used yet.

## Features
- Random joke
- Save and display favourite jokes

For detailed feature description, see Functional Specification.

## Functional Specification
- Home Screen
    - Two buttons (in any arrangement)
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
There is two sublayers in the business layer:
- Data layer
- Domain layer
Data layer consists of types that are responsible for api calls and persistency. Domain layer types are responsible for a single busniness use case.

Definition for use case types:
- There is one separate type for every separate business logic use case (the name of the type is also suffixed with 'UseCase'), meaning every use case type has exactly one well defined task.

### Dependency Management
Swift Package Manager is used for dependency management. Let's find out what's it got.

### Dependency Injection
I chose [Resolver](https://github.com/hmlongco/Resolver) for handling Dependency Injection. It looks far simpler than [Swinject](https://github.com/Swinject/Swinject) so far, especially when using its property wrappers for injection.

### Navigation
Every module has a navigation struct that's responsible for resolving the views that can be used by NavigationLinks. This layer of logic is separated from Views and ViewModels this way.

### Network Calls
The API webpage can generate the code of network calls to the endpoints in Swift. These are copied into the project.

### Unit/UI Tests
ViewModels are tested. Test them with unit tests, if there's any business logic, and write UI test if there's only UX logic. (E.g. in DashboardViewModel, there is no business logic, it just controls what features can the user navigate to. Therefore this functionality is tested with UI tests instead of Unit tests.)
- Try the native testing framework first.
- Then if there's time, refactor unit tests to a 3rd party framework.

### Persistent storage
- [ ] Needs looking into. Ideas are SQLite or some 3rd party framework.

### Error handling
Networking errors need to be handled always the same way:
1. Propagate the error description from the network call.
2. If there is an empty or no description, a common error message is displayed.

### Localization
- No localization so far.
- Using enums for holding string resources, therefore the view codes don't need to be changed when localization is implemented.

### Mocking
Mock objects are needed for unit testing and easier development.
- Every use case class will need to have a mock. It's needed mainly because of the unit tests.
- Some macros may be useful to be implemented, so that mock are automatically used for debug builds.
