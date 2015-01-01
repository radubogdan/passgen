//
//  PasswordGenerator.m
//  passgen
//
//  Created by Radu Croitoru on 31/12/14.
//  Copyright (c) 2014 Radu Croitoru. All rights reserved.
//

#import "PasswordGenerator.h"

@interface PasswordGenerator()
@property (strong, nonatomic) NSString *letters;
@end

@implementation PasswordGenerator

- (instancetype) initUsingOptions:(NSDictionary *)options {
    
    // Hardcode all possible letters
    NSDictionary *allOptionsForLetters = @{ @"Capitals": @"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
                                            @"Numerals": @"0123456789",
                                            @"Symbols": @"!@#$%*[];?()" };
    
    // Create mutable letters string with a-z by default
    NSMutableString *letters = [NSMutableString stringWithString:@"abcdefghijklmnopqrstuvwxyz"];
    
    // Look in options params and append allOptionsForLetters value if is 1.
    for (NSString* key in options) {
        id value = [options valueForKey:key];
        if ([value isEqualTo:@"1"]) [letters appendString:[allOptionsForLetters valueForKey:key]];
    }
    
    self = [super init];
    
    if (self) {
        if (!_letters) _letters = [[NSString alloc] initWithString:letters];
    }
    
    return self;
    
}

- (NSString *)generateRandomPasswordWithLength:(int)len {
    NSMutableString *password = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i < len; i++) {
        [password appendFormat: @"%C", [self.letters characterAtIndex: arc4random_uniform([self.letters length])]];
    }

    return password;
}

@end
