//
//  HTTPService.m
//  DevslopesTutorials
//
//  Created by Arpita Bhatia on 4/13/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService

+ (id) instance {
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}



@end
