FB6445288
=========

![Status](https://img.shields.io/badge/status-open-brightgreen.svg?style=flat)
[![Contact](https://img.shields.io/badge/contact-@macmade-blue.svg?style=flat)](https://twitter.com/macmade)  
[![Sponsor](https://img.shields.io/badge/sponsor-macmade-pink.svg?logo=github-sponsors&style=social)](https://github.com/sponsors/macmade)

NSAutounbinder causes a retain cycle when binding to self
---------------------------------------------------------

    Jean-David Gadina
    Jul 2, 2019 at 8:26 PM – FB6445288

## Basic Information

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
