//
//  VM.h
//  RESTAPITester
//
//  Created by Son Ju Wook on 6/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VM : NSObject
@property (nonatomic,strong) NSNumber *vmID;
@property (nonatomic,strong) NSString *displayName;
@property (nonatomic,strong) NSString *imageyName;
@property (nonatomic,strong) NSString *cpuInfo;
@property (nonatomic,strong) NSString *memInfo;
@property (nonatomic,strong) NSString *createdDate;
@property (nonatomic,strong) NSString *cpuUsage;
@property (nonatomic,strong) NSString *vmState;
@end
