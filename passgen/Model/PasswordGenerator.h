//
//  PasswordGenerator.h
//  passgen
//
//  Created by Radu Croitoru on 31/12/14.
//  Copyright (c) 2014 Radu Croitoru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordGenerator : NSObject

- (instancetype) initUsingOptions:(NSDictionary *)options;
- (NSString *)generateRandomPasswordWithLength:(int)len;

@end
