//
//  VTJsonTest.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol ProductModel

@end

@interface ProductModel : JSONModel
@property (assign, nonatomic) int oid;
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float price;
@end


@interface VTJsonTest : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString* country;
@property (strong, nonatomic) NSString* dialCode;
@property (assign, nonatomic) BOOL isInEurope;
@property (retain, nonatomic) NSMutableArray<ProductModel> *data;

@end
