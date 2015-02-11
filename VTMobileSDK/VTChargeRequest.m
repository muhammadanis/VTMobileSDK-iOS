//
//  VTChargeRequest.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTChargeRequest.h"
#import "VTMobileConfig.h"

@implementation VTChargeRequest

@synthesize payment_type;
@synthesize email;
@synthesize token_data;
@synthesize item_details;
@synthesize client_key;

-(id)init{
    if(self = [super init]){
        item_details = (NSMutableArray<VTProduct>*)[NSMutableArray array];
        client_key = [VTMobileConfig ClientKey];
    }
    return self;
}

+(JSONKeyMapper*) keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
            @"token_data" : @"credit_card"
    }];
}

@end
