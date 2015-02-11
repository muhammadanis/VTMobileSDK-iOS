//
//  VTChargeResponse.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTChargeResponse.h"

@implementation VTChargeResponse

@synthesize approval_code = _approval_code;
@synthesize status_code = _status_code;
@synthesize transaction_time = _transaction_time;
@synthesize gross_amount = _gross_amount;
@synthesize transaction_status = _transaction_status;
@synthesize masked_card = _masked_card;
@synthesize fraud_status = _fraud_status;
@synthesize status_message = _status_message;
@synthesize bank = _bank;
@synthesize order_id = _order_id;
@synthesize payment_type = _payment_type;
@synthesize transaction_id = _transaction_id;

@end
