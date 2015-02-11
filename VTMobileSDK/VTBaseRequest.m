//
//  VTBaseRequest.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTBaseRequest.h"
#import "VTMobileConfig.h"

@implementation VTBaseRequest

@synthesize client_key = _client_key;

-(id)init{
    if(self = [super init]){
        self.client_key = [VTMobileConfig ClientKey];
    }
    return self;
}

@end
