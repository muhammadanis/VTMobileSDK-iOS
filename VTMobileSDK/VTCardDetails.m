//
//  VTCardDetails.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/9/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTCardDetails.h"
#import "VTMobileConfig.h"

@implementation VTCardDetails

@synthesize card_number = _card_number;
@synthesize card_cvv = _card_cvv;
@synthesize bank = _bank;
@synthesize gross_amount = _gross_amount;

@synthesize card_exp_month = _card_exp_month;
@synthesize card_exp_year = _card_exp_year;

@synthesize secure = _secure;

-(NSString*) getParamUrl{
    
    return [NSString stringWithFormat:@"?card_number=%@&card_exp_month=%ld&card_exp_year=%ld&card_cvv=%@&client_key=%@&secure=%@%@&gross_amount=%@",_card_number,_card_exp_month,_card_exp_year,_card_cvv,[VTMobileConfig ClientKey],_secure ? @"true" : @"false",[self getBankParam],_gross_amount];
}

-(NSString*) getBankParam{
    if(_bank != nil){
        return [NSString stringWithFormat:@"&bank=%@",_bank];
    }
    return @"";
}



@end
