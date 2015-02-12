//
//  VTConfirmTransactionRequest.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/12/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTConfirmTransactionRequest.h"
#import "VTMobileConfig.h"

@implementation VTConfirmTransactionRequest

@synthesize transaction_id = _transaction_id;
@synthesize client_key = _client_key;

-(id)init{
    if(self = [super init]){
        _client_key = [VTMobileConfig ClientKey];
    }
    return self;
}

@end
