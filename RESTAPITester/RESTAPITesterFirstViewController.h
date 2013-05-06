//
//  RESTAPITesterFirstViewController.h
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NSString+URLEncoding.h"
#import <RestKit/RestKit.h>



@interface RESTAPITesterFirstViewController : UIViewController <RKRequestDelegate>
@property (weak, nonatomic) IBOutlet UITextView *outputField;
@property (nonatomic) int jobID;


@end
