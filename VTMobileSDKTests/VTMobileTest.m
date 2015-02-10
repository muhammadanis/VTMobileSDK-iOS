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

-(void) testGetProductList{
    
    __block BOOL waitingForBlock = YES;
    
    [VTMobile getAllProducts:^(VTGetProductResponse *response, NSException *exception) {
        waitingForBlock = NO;
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
    }];
    
    while (waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}

@end
