# BestRead

* Xcode 17.0
* BestRead app displays best seller books from NY Times API.

## Rubric items
*The app does not use any third-party frameworks. -> No third-party added
*The app has a launch screen suitable for the app. -> App has launch screen with animation
*All features in the app should be completed. -> There aren't incomplete feature.
*The app has at least one screen with a list using a view of your choice (List, Grid, ScrollView etc). This list should appear in a tabview with at least two tabs. -> Best Seller tab of the app displays list and Book Shelves tab of the app displays scrollview
*Each item in the list should contain (at minimum) a name, a subtitle or description, and an image of the item, and any text should be styled appropriately. -> Book detail screen covers this requirement.
*The app has one or more network calls using URLSession to download/upload data related to the core tasks of the app. The app’s repo does not contain API keys or other authentication information. Don’t store API keys or other authentication information in your app’s repo. See this article to store them in a plist, add the plist to your .gitignore file, then attach the plist to your Google doc. -> App covers all of this expectations for URLSession , api key , .gitignore file
*If your API has a low request limit that your mentor might hit, highlight this in the README and explain how to use your freeze-dried data. -> No limit for api calls
*The app handles all typical errors related to network calls — including server error response codes and no network connection — and keeps the user informed. -> App covers all expectation and notifies users either alert view or ui view with a message
*The app uses at least one way to save data: user defaults, plist, file, or keychain. Specify your method in the README. -> App uses file manager to save book shelve books between app launches.
*The app uses Swift Modern Concurrency, async/await, and MainActor appropriately to keep slow-running tasks off the main thread and to update the UI on the main thread. No dispatch queues or completion handlers -> App covers this expectation.
*The app communicates to the user whenever data is missing or empty, the reason for that condition — for example, data cannot be loaded, or the user hasn’t created any — and the action the user should perform to move forward. The app should have no blank screens, and the user should never feel “lost”. -> There is an alert and ui view to handle this requirement. When app launches or there is an issue with api call user is informed.
*All included screens work successfully without crashes or UI issues. -> Covered.
*Views work for landscape and portrait orientations for the full range of iPhone sizes, including iPhone SE 2. -> Covered.
*Views work for both light and dark modes. -> Covered.
*There are no obvious UI issues, like UI components overlapping or running off the screen. -> Covered.
*The code should be organized and easily readable. -> Covered.
*Project source files are organized in folders such as Views, Models, Networking etc. -> Covered.
*View components are abstracted into separate Views and source files. -> Covered.
*The project uses MVVM architecture: The Model includes at least one ObservableObject with at least one Published value that at least one view subscribes to. Networking code is in a Service struct or class that can be instantiated by an ObservableObject. -> Covered.
*The project utilizes SwiftLint with Kodeco’s configuration file. Follow the instructions in the Kodeco Swift style guide to install it with Homebrew and the Build Run Script Phase. Don’t install it as a package. If you disable any rule for a line of code, explain why in a comment near the disable comment or, if it’s a general situation, explain in the README. -> Covered.
*The app builds without Warnings or Errors. (Move your TODO warnings to a different branch.) -> Covered.
*The project has a test plan including both UI and unit tests, with a minimum of 50% code coverage, and all tests succeed. Make sure your test plan is in your repo. -> Covered with %65 
*The app includes: A custom app icon. -> Covered. An onboarding screen. -> Covered. A custom display name. -> Covered. At least one SwiftUI animation. -> Covered. Styled text properties. SwiftUI modifiers are sufficient. -> Covered.










