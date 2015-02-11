//
//  VTTokenRequest.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTTokenRequest.h"
#import "VTConstants.h"

@implementation VTTokenRequest

@synthesize cardDetails = _cardDetails;

-(NSString*) getTokenUrl{
    return [NSString stringWithFormat:@"%@%@",[VTConstants getTokenEndpoint], [self.cardDetails getParamUrl]];
}

@end