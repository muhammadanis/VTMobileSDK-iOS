//
//  VTGetProductResponse.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTGetProductResponse.h"

@implementation VTGetProductResponse

@synthesize merchantId = _merchantId;
@synthesize products = _products;


-(id)initWithMerchantIdAndProducts:(NSString *)merchantId products:(NSMutableArray *)products{
    if(self = [super init]){
        _merchantId = merchantId;
        _products = products;
    }
    return self;
}

+(instancetype)responseWithMerchantIdAndProducts:(NSString *)merchantId products:(NSMutableArray *)products{
    return [[self alloc] initWithMerchantIdAndProducts:merchantId products:products];
}

@end
