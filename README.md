## Conditional View Modifiers
This repo has an example app to explore the potential issues behind Conditional View Modifiers. For more details check the following articles: 

- [Blog article - Why Conditional View Modifiers are a Bad Idea](https://www.objc.io/blog/2021/08/24/conditional-view-modifiers/)
- [WWDC21 - Demystify SwiftUI](https://developer.apple.com/videos/play/wwdc2021/10022/)


## Notes

* Blog article notes - potential issues 
    * Losing animation
    * Losing @State or @StateObject of a view

* Demystify SwiftUI notes
    * SwiftUI sees three things in our code: **Identity**, **Lifetime**, and **Dependencies**
    * Identity
        * To recognizes elements as the same or distinct across multiple updates of your app.
        * Types of identity: **Explicit** identity and **structural** identity
        * Explicit identity like id in `foreach` or `.id()` modifier
        * Structural identity like conditional view body (`if-else` or `switch`)
        * The recommendation  is to modify a single view through available modifiers rather than using conditional view modifiers which means having 2 different views! 
        * Try to use `@ViewBuilder` and avoid using `AnyView` if possible
        * Conditional view modifiers (aka branches) create structural identities 
    * Lifetime
        * View value ≠ View identity 
        * `State` and `StateObject` are the persistent storage associated with your view's identity.
        * State lifetime = View lifetime
        * View lifetime is the duration of its identity 
    * Dependencies
        * It is just an input to the view like properties defined with `var`, `let`, `@Binding var` etc
        * Change of dependencies require the view to change its body
        * We are in control of view identifiers so we need to make sure we have **stable** identifiers 

