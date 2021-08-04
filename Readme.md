### NAB_Assigniment

a. Brief explanation for the software development principles, patterns & practices being applied
b. Brief explanation for the code folder structure and the key Objective-C/Swift libraries and frameworks being used
c. All the required steps in order to get the application run on local computer
d. Checklist of items the candidate has done

### Checklist of items has done:

- [x] 1. Programming language: Swift is required, Objective-C is optional.
- [x] 2. Design app's architecture (MVC or MVP, MVVM)
- [x] 3. UI should be looks like in attachment.
- [ ] 4. Write UnitTests (nice to have)
- [x] 5. Exception handling (optional)
- [x] 6. Readme file

### Structure Code 
 - Application: Manage started scene
 - Common: Include some class using common is ViewModel, ViewController
 - Config: Include some config for network is appId for request API, Base URL
 - Extension: Using to define some func using many place in project.
 - Model: Contain some model of project. For example: WeatherCondition, Weather, ...
 - Networking: Manage to request API, Network 
 - Resources: Assets, some file default when init project
 - Scenes: Screens of app, that contain View (has ViewController and ViewController.xib file), ViewModel for ViewController, ViewModelItem for TableViewCell
 - Third Party: ActivityIndicator to manage loading

### Third Party
 - RxSwift: Using to binding viewmodel to view in MVVM
 - Another way we can use Delegate Parten to binding betweeen ViewModel and View.
 - Class ActivityIndicator to manage LoadingIndicator

### The software development principles, patterns & practices being applied: 
* Singleton Design Parten:
* Application: to manage started scene
* Dependence Injection: WeatherAPI 
* MVVM Architecture using with RxSwift: To eazy to create binding between ViewModel and View
