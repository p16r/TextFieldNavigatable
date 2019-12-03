# TextFieldNavigatable

A protocol with a default implementation that adds a toolbar above the
keyboard with Previous, Next, and Done buttons.

## Usage

Simply make your `UIViewController` subclass conform to 
`TextFieldNavigatable` like so:

```

class ViewController: UIViewController {
	⋮
}

extension ViewController: TextFieldNavigatable {}

```

## The Protocol

`TextFieldNavigatable` exposes just one method:

```swift

func addToolbar(
    to textFields: UITextField?...,
    isNavigatable: Bool,
    isDismissable: Bool,
    nextButtonText: String,
    previousButtonText: String
)

```

## The Extension

`TextFieldNavigatable` comes with a default implementation that takes an
ordered list of `UITextField`s and adds a toolbar with navigation
buttons to each of them. Tapping Next or Previous will shift the input
focus to the next or previous text field in the argument list.

## Installation

###Swift Package Manager (SPM)

[SPM](https://swift.org/package-manager/) is the only dependency manager
system currently supported by this project. Add the following as a 
dependency to your Package.swift:

```

dependencies: [
    .package(
    	url: "https://github.com/prtmshk/TextFieldNavigatable",
    	.upToNextMajor(from: "0.1.2")
    )
]

```

## Feedback and Contributing

I'm open to any feedback and contributions. Reach out on
[Twitter](https://twitter.com/prtmshk) to get in touch with your 
feedback. Raise a PR with your changes.
