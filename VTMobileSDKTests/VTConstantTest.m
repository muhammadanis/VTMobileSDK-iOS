//
//  VTConstantTest.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VTMobileConfig.h"
#import "VTConstants.h"

@interface VTConstantTest : XCTestCase

@end

@implementation VTConstantTest

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

-(void)testConstants{
    NSLog(@"%@",[VTConstants getEndpoint]);
    XCTAssert([[VTConstants getEndpoint] isEqualToString:@"http://10.255.255.25:8080/v1"],@"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
