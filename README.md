# SDSelectorView

[![CI Status](http://img.shields.io/travis/danieldias25/SDSelectorView.svg?style=flat)](https://travis-ci.org/danieldias25/SDSelectorView)
[![Version](https://img.shields.io/cocoapods/v/SDSelectorView.svg?style=flat)](http://cocoapods.org/pods/SDSelectorView)
[![License](https://img.shields.io/cocoapods/l/SDSelectorView.svg?style=flat)](http://cocoapods.org/pods/SDSelectorView)
[![Platform](https://img.shields.io/cocoapods/p/SDSelectorView.svg?style=flat)](http://cocoapods.org/pods/SDSelectorView)

## Description

SDSelectorView aims to improve applications aesthetics by providing a horizontal scroll and easy-to-implement image gallery.

## Installation

SDSelectorView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SDSelectorView'
```

or just copy and paste  **SDPresentationView.swift** and **SDSelectorView.swift** files.


## Usage

**SDSelectorView** just need a couple of lines to be used. Add a view in you storyboard and make it be a subclass of **SDSelectorView**

@IBOutlet weak var mySelectorView: SDSelectorView!


Add the line below to configure the selector gallery.

  self.mySelectorView.configSDSelectorWith(imageSize: <CGSize>, spacedBy: <CGFloat>, withImages: <[UIImage]>)


And you have delegate methods to help you when user interacts with your gallery.
Add **SDSelectorViewDelegate** to your class and the lines below.

  self.mySelectorView.SDdelegate = self

// MARK: Delegate methods

    func didCangedIndex(index: Int) {
    }
    
    func didSelectView(index: Int) {
    }



## Author

danieldias25, daniel.dias.e@gmail.com

## License

SDSelectorView is available under the MIT license. See the LICENSE file for more info.
