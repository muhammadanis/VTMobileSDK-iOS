//
//  VTConstants.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTConstants.h"
#import "VTMobileConfig.h"

@implementation VTConstants

static NSString* Port = @"8080";
static NSString* Version = @"/v1";
static NSString* Endpoint = @"http://10.255.255.25:";
static NSString* SandboxEndpoint = @"http://10.255.255.25:";
static NSString* TokenEndpoint = @"https://api.veritrans.co.id/v2/token";
static NSString* SandboxTokenEndpoint = @"https://api.sandbox.veritrans.co.id/v2/token";

+(NSString*) getEndpoint{
    return [VTMobileConfig isProduction] ? [NSString stringWithFormat:@"%@%@%@",Endpoint,Port,Version] : [NSString stringWithFormat:@"%@%@%@",SandboxEndpoint,Port,Version];
}

+(NSString*) getProductsEndpoint{
    return [NSString stringWithFormat:@"%@/merchant/product",[VTConstants getEndpoint]];
}

+(NSString*) getChargeEndpoint{
    return [NSString stringWithFormat:@"%@/charge",[VTConstants getEndpoint]];
}

+(NSString*) getConfirmEndpoint{
    return [NSString stringWithFormat:@"%@/merchant/payment/confirm",[VTConstants getEndpoint]];
}

+(NSString*) getTokenEndpoint{
    return [VTMobileConfig isProduction] ? TokenEndpoint : SandboxEndpoint;
}


@end
