//
//  PasswordGenerator.m
//  passgen
//
//  Created by Radu Croitoru on 31/12/14.
//  Copyright (c) 2014 Radu Croitoru. All rights reserved.
//

#import "PasswordGenerator.h"

@implementation PasswordGenerator

+ (NSString *)generateRandomPasswordWithLength:(int)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%*[];?()";
    NSMutableString *password = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i < len; i++) {
        [password appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return password;
}

@end
