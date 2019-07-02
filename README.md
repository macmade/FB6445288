FB6445288
=========

![Status](https://img.shields.io/badge/status-open-brightgreen.svg?style=flat)
[![Contact](https://img.shields.io/badge/contact-@macmade-blue.svg?style=flat)](https://twitter.com/macmade)  
[![Donate-Patreon](https://img.shields.io/badge/donate-patreon-yellow.svg?style=flat)](https://patreon.com/macmade)
[![Donate-Gratipay](https://img.shields.io/badge/donate-gratipay-yellow.svg?style=flat)](https://www.gratipay.com/macmade)
[![Donate-Paypal](https://img.shields.io/badge/donate-paypal-yellow.svg?style=flat)](https://paypal.me/xslabs)

## Basic Information

### Please provide a descriptive title for your feedback:

NSAutounbinder causes a retain cycle when binding to self

### Which area are you seeing an issue with?

AppKit

### What type of issue are you reporting?

Incorrect/Unexpected Behavior

## Description

### Please describe the issue and what steps we can take to reproduce it:

The use of `NSAutounbinder` introduces a retain cycle when binding to `self`, using `-[NSObject bind:toObject:withKeyPath:options ]`:

    [ self bind: @"foo" toObject: self withKeyPath: @"bar" options: nil ];

Doing such a binding on a direct subclass of `NSObject` is fine - no retain cycle, everything working as expected.

But the same binding on a subclass of `NSViewController` will cause a leak.  
The `NSViewController` object will never get deallocated, unless manually unbinding, which shouldn't be necessary.

The only difference is that `NSViewController` returns an autobinder.

Attached is an Xcode project demonstrating the issue.

Repository Infos
----------------

    Owner:          Jean-David Gadina - XS-Labs
    Web:            www.xs-labs.com
    Blog:           www.noxeos.com
    Twitter:        @macmade
    GitHub:         github.com/macmade
    LinkedIn:       ch.linkedin.com/in/macmade/
    StackOverflow:  stackoverflow.com/users/182676/macmade
