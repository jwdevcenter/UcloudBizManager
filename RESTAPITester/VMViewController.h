//
//  VMViewController.h
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListVM.h"
#import "ListVMViewController.h"

@class ListVMViewController;

@interface VMViewController : UIViewController

@property (nonatomic, strong) ListVMViewController *delegate;
@property (nonatomic,strong) VM *vmInfo;
@end
