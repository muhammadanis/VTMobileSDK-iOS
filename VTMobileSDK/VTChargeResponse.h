//
//  VTChargeResponse.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface VTChargeResponse : JSONModel

@property(nonatomic,copy) NSString* approval_code;
@property(nonatomic,copy) NSString* status_code;
@property(nonatomic,copy) NSString* transaction_time;
@property(nonatomic,copy) NSString* gross_amount;
@property(nonatomic,copy) NSString* transaction_status;
@property(nonatomic,copy) NSString* masked_card;
@property(nonatomic,copy) NSString* fraud_status;
@property(nonatomic,copy) NSString* status_message;
@property(nonatomic,copy) NSString* bank;
@property(nonatomic,copy) NSString* order_id;
@property(nonatomic,copy) NSString* payment_type;
@property(nonatomic,copy) NSString* transaction_id;


@end
