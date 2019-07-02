//
//  main.m
//  FB6445288
//
//  Created by Macmade on 02.07.19.
//  Copyright © 2019 XS-Labs. All rights reserved.
//

@import AppKit;

#import <objc/runtime.h>
#import <objc/message.h>

@interface Foo: NSObject

@property( atomic, readwrite, assign ) BOOL test1;
@property( atomic, readwrite, assign ) BOOL test2;

@end

@implementation Foo

- ( instancetype )init
{
    if( ( self = [ super init ] ) )
    {
        [ self bind: @"test1" toObject: self withKeyPath: @"test2" options: nil ];
    }
    
    return self;
}

- ( void )dealloc
{
    NSLog( @"Dealloc %@", self );
}

@end

@interface Bar: Foo

@end

@implementation Bar: Foo

- ( nullable id )_autounbinder
{
    Class cls = objc_getClass( "NSAutounbinder" );
    id    obj = ( ( id ( * )( Class, SEL  ) )objc_msgSend )( cls, sel_registerName( "alloc" ) );
    obj       = ( ( id ( * )( id, SEL, id ) )objc_msgSend )( obj, sel_registerName( "initWithBindingTarget:" ), self );
    
    return obj;
}

@end

int main( void )
{
    @autoreleasepool
    {
        Foo * foo;
        Bar * bar;
        
        foo = [ Foo new ];
        bar = [ Bar new ];
    }
    
    return EXIT_SUCCESS;
}
