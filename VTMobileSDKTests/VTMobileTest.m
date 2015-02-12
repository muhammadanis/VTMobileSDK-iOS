//
//  VTMobileTest.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VTMobileConfig.h"
#import "VTMobile.h"
#import "VTProduct.h"

@interface VTMobileTest : XCTestCase

@end

@implementation VTMobileTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [VTMobileConfig setIsProduction:false];
    [VTMobileConfig setClientKey:@"VT-client-SimkwEjR3_fKj73D"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void) testGetTokenUrl{
    VTCardDetails* cardDetails = [self cardFactory:false];
    VTTokenRequest* request = [[VTTokenRequest alloc] init];
    request.cardDetails = cardDetails;
    NSLog(@"Token Url: %@",request.getTokenUrl);

}

-(void) testGetToken{
    __block BOOL waitingForBlock = YES;
    VTCardDetails* cardDetails = [self cardFactory:false];
    VTTokenRequest* request = [[VTTokenRequest alloc] init];
    request.cardDetails = cardDetails;
    [VTMobile getToken:^(VTTokenResponse *response, NSException *exception) {
        if(exception == nil){
            XCTAssertNotNil(response);
            XCTAssertNotNil(response.token_id);
            NSLog(@"Token Id: %@",response.token_id);
        }else{
            NSLog(@"Exception GetToken: %@",exception.description);
        }
        waitingForBlock = NO;
    } withRequest:request];
    
    while (waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}

-(void) testGetProductList{
    
    __block BOOL waitingForBlock = YES;
    
    [VTMobile getAllProducts:^(VTGetProductResponse *response, NSException *exception) {
        if(response != nil){
            NSLog(@"Merchant id: %@",response.merchantId);
            XCTAssertNotNil(response);
            //log products
            if(response.products != nil){
                for (VTProduct* s in response.products) {
                    NSLog(@"Isi Product: %@",s);
                }
            }
        }else{
            NSLog(@"Error: %@",exception.description);
            XCTAssertFalse(true);
        }
        waitingForBlock = NO;
    }];
    
    while (waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}

-(void) testCharge{
    __block BOOL waitingForBlock = YES;
    VTCardDetails* cardDetails = [self cardFactory:false];
    VTTokenRequest* request = [[VTTokenRequest alloc] init];
    request.cardDetails = cardDetails;
    [VTMobile getToken:^(VTTokenResponse *response, NSException *exception) {
        if(exception == nil){
            XCTAssertNotNil(response);
            XCTAssertNotNil(response.token_id);
            NSLog(@"Token Id: %@",response.token_id);
            //create product
            VTProduct* product = [[VTProduct alloc]init];
            product.productId = @"23aa44";
            product.price = 42500;
            product.quantity = 12;
            
            //create token data
            VTTokenData* tokenData = [[VTTokenData alloc]init];
            tokenData.token_id = response.token_id;
            
            //create charge request
            VTChargeRequest* chargeRequest = [[VTChargeRequest alloc] init];
            //add product to item details
            [chargeRequest.item_details addObject:product];
            //set properties
            chargeRequest.email = @"dichi3@alfaridi.info";
            chargeRequest.payment_type = @"credit_card";
            chargeRequest.token_data = tokenData;
            
            [VTMobile charge:^(VTChargeResponse *response, NSException *exception) {
                if(exception == nil){
                    NSLog(@"Success Charging With trx Id: %@",response.transaction_id);
                }else{
                    NSLog(@"Error Charging: %@",exception.description);
                    XCTAssertFalse(true);

                }
                waitingForBlock = NO;
            } withChargeRequest:chargeRequest];
            
        }else{
            NSLog(@"Exception GetToken: %@",exception.description);
            XCTAssertFalse(true);
        }
    } withRequest:request];
    
    while (waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}

-(void) testConfirmTransaction{
    __block BOOL waitingForBlock = YES;
    
    VTConfirmTransactionRequest* request = [[VTConfirmTransactionRequest alloc] init];
    request.transaction_id = @"6f09c95d-75ff-4ecd-956c-c29095603bdd";
    
    [VTMobile confirmTransaction:^(VTConfirmTransactionResponse *response, NSException *exception) {
        if(exception == nil){
            XCTAssertNotNil(response);
            XCTAssertNotNil(response.result);
            //print result
            NSLog(@"Status: %@",response.result);
        }else{
            NSLog(@"Exception ConfirmTransaction: %@",exception.description);
            XCTAssertFalse(true);
        }
        waitingForBlock = NO;
    } withRequest:request];
    
    while (waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}



-(VTCardDetails*) cardFactory:(BOOL)secure{
    VTCardDetails* cardDetails = [[VTCardDetails alloc] init];
    cardDetails.card_number = @"4811111111111114";
    cardDetails.card_cvv = @"123";
    cardDetails.card_exp_month = 1;
    cardDetails.card_exp_year = 2020;
    cardDetails.secure = secure;
    cardDetails.gross_amount = @"100000";
    return cardDetails;
}

@end
