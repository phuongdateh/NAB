### NAB_Assignment 

Before open project: 

```
pod install 
```

### Checklist of items has done:

- [x] 1. Programming language: Swift is required, Objective-C is optional.
- [x] 2. Design app's architecture (MVC or MVP, MVVM)
- [x] 3. UI should be looks like in the attachment.
- [ ] 4. Write UnitTests (nice to have)
- [x] 5. Exception handling (optional)
- [x] 6. Readme file

### Structure Code 
 - Application: Manage started scene
 - Navigator: to manage navigation to another screen and manage Navigation Controller
 - Common: Include some class using common is ViewModel, ViewController
 - Config: Include some config for a network is appId for request API, Base URL
 - Extension: Using to define some func using many places in a project.
 - Model: Contain some model of a project. For example: WeatherCondition, Weather, ...
 - Networking: Manage to request API, Network 
 - Resources: Assets, some file default when init project
 - Scenes: Screens of an app, that contain View (has ViewController and ViewController.xib file), ViewModel for ViewController, ViewModelItem for TableViewCell
 - Third-Party: ActivityIndicator to manage loading

### Third Party
 - Kingfisher: Using to download image
 - RxSwift: Using to binding ViewModel to view in MVVM
 - Another way we can use Delegate Parten to binding between ViewModel and View.
 - Class ActivityIndicator to manage LoadingIndicator

### The software development principles, patterns & practices being applied
* Singleton Design Parten
* Application: to manage started scene
* Dependence Injection: WeatherAPI 
* MVVM Architecture using with RxSwift: To easy to create a binding between ViewModel and View


### Feedback

- [x] 1. No separation between data mode and viewModel 
=> I create new layer is UseCase to get data from server, so viewModel just call know usecase
- [x] 2. Used only UILabel
=> I add another UILabel to show each data realated
- [x] 3. There is no throttle or debounce operation to reduce the API call when typing. 
=> I used .debounce(DispatchTimeInterval.seconds(2))
- [x] 4. Lack of error handling in WeatherAPIService
=> I add handle error


