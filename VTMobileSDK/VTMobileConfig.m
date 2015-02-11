//
//  VTMobileConfig.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/9/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTMobileConfig.h"

@implementation VTMobileConfig

static NSString* _clientKey;
static BOOL _isProduction;

+(NSString*) ClientKey{
    return _clientKey;
}

+(void) setClientKey:(NSString *)val{
    _clientKey = val;
}

+(BOOL)isProduction{
    return _isProduction;
}

+(void)setIsProduction:(BOOL)val{
    _isProduction = val;
}

@end
