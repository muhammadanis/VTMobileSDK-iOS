//
//  JsonTest.m
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VTJsonTest.h"
#import "VTChargeRequest.h"

@interface JsonTest : XCTestCase

@end

@implementation JsonTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    VTJsonTest* test = [[VTJsonTest alloc] init];
    test.id = 1;
    test.country = @"negara";
    test.dialCode = @"dialcode";
    test.isInEurope = false;
    test.data = (NSMutableArray<ProductModel>*)[NSMutableArray array];
    for(int i=0;i<10;++i){
        ProductModel* model = [[ProductModel alloc]init];
        model.oid = i;
        model.name = [NSString stringWithFormat:@"name-%d",i ];
        model.price = 2000 * i;
        [test.data addObject:model];
    }
    
    NSString* json = [test toJSONString];
    NSLog(@"JSON: %@",json);
}

-(void)testChargeRequestJson{
    VTChargeRequest* request = [[VTChargeRequest alloc]init];
    request.payment_type = @"cc";
    for(int i=0;i<10;i++){
        VTProduct* product = [[VTProduct alloc]init];
        product.name = [NSString stringWithFormat:@"product-%d",i];
        [request.item_details addObject:product];
    }
    NSString* json = [request toJSONString];
    NSLog(@"JSON: %@",json);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
