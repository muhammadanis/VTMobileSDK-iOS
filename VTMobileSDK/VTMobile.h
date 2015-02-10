//
//  VTMobileSDK.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/9/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VTGetProductResponse.h"
#import "VTHttpContainer.h"

@interface VTMobile : NSObject

+(void) getAllProducts:(void(^)(VTGetProductResponse* response, NSException* exception)) completionHandler;


@end
