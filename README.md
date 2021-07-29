# CodeHub!


## Building and Running

You'll need a few things before we get started. 
Make sure you have Xcode installed from the App Store. 
Then run the following command to install Xcode's command line tools, if you don't have that yet
```sh
xcode-select --install
```

Install [`Bundler`](https://bundler.io) for managing Ruby gem dependencies
```sh
[sudo] gem install bundler
```

Install [Brew](https://github.com/Homebrew/brew) package manager for macOS:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Instructions

- `make setup` will install every dependency
- `make resources` will create generated resources files with SwiftGen (according to `swiftgen.yml`). Configuration folder contains templates for colors, images and translations, and specific json file for colors.
- `make format` will automatically apply formatting rules through SwiftFormat (check `.swiftformat` file for rules) and SwiftLint (check `.swiftlint.yml` for rules).
- `make git_setup` creates a pre-commit git hook that runs SwiftFormat and SwiftLint (with proper rules, see `make format`) on every file added or modified inside a commit.

## Tools
- [x] [Brew](https://github.com/Homebrew/brew) - The missing package manager for macOS
- [x] [Bundler](https://github.com/bundler/bundler) - Manage your Ruby application's gem dependencies
- [x] [Fastlane](https://github.com/fastlane/fastlane) - The easiest way to automate building and releasing your iOS and Android apps
- [x] [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions
- [x] [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) - SwiftFormat is a code library and command-line tool for reformatting Swift code on macOS or Linux.
- [x] [SwiftGen](https://github.com/SwiftGen/SwiftGen) - SwiftGen is a tool to automatically generate Swift code for resources of your projects (like images, localised strings, etc)
