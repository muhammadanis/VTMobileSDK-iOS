//
//  VTMobileSDK.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/9/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import "VTMobile.h"
#import "VTConstants.h"
#import "VTMobileConfig.h"
#import "VTProduct.h"

@implementation VTMobile

+(void) getAllProducts:(void (^)(VTGetProductResponse *, NSException *))completionHandler{
    NSURL *url = [NSURL URLWithString:[VTConstants getProductsEndpoint]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //set http method
    request.HTTPMethod = @"POST";
    //set header
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //set body
    NSDictionary* jsonDict = [NSDictionary dictionaryWithObject:[VTMobileConfig ClientKey ] forKey:@"client_key"];
    NSError* jsonError;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:NSJSONWritingPrettyPrinted error:&jsonError];
    if(!jsonData){
        completionHandler(nil, [[NSException alloc] initWithName:@"JsonParsedException" reason:jsonError.localizedDescription userInfo:jsonError.userInfo]);
    }else{
        [request setHTTPBody:jsonData];
    }
    
    //start send asynchronously
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(data.length > 0 && connectionError == nil){
            NSLog(@"Data: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            NSError* error;
            NSDictionary* jsonParsed = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if(error == nil){
                NSArray* jsonMerchantProducts = [jsonParsed objectForKey:@"merchant_product"];
                NSMutableArray* merchantProducts = [NSMutableArray array];
                //iterate through merchant products
                for(NSDictionary* jsonProduct in jsonMerchantProducts){
                    VTProduct* product = [[VTProduct alloc]init];
                    product.productId = [jsonProduct objectForKey:@"id"];
                    product.name = [jsonProduct objectForKey:@"name"];
                    product.limitless = [[jsonProduct objectForKey:@"limitless"] boolValue];
                    product.price = [[jsonProduct objectForKey:@"price"] integerValue];
                    product.quantity = [[jsonProduct objectForKey:@"quantity"] integerValue];
                    [merchantProducts addObject:product];
                }
                VTGetProductResponse* response = [VTGetProductResponse responseWithMerchantIdAndProducts:[jsonParsed objectForKey:@"merchant_id"] products:merchantProducts];
                completionHandler(response,nil);
            }else{
                NSException* exception = [[NSException alloc] initWithName:@"JsonParsedException" reason:error.localizedDescription userInfo:error.userInfo];
                completionHandler(nil,exception);
            }
        }else{
            NSException* exception = [[NSException alloc] initWithName:@"ConnectionException" reason:connectionError.localizedDescription userInfo:connectionError.userInfo];
            NSLog(@"Exception: %@",connectionError.localizedDescription);
            completionHandler(nil,exception);
        }
    }];
}


@end