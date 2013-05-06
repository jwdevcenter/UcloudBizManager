//
//  DetailVMViewController.h
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListVM.h"
#import "VM.h"
#import "ListVMViewController.h"

@interface DetailVMViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UITableViewCell *serverName;
@property (weak, nonatomic) IBOutlet UITableViewCell *imageName;
@property (weak, nonatomic) IBOutlet UITableViewCell *cpuInfo;
@property (weak, nonatomic) IBOutlet UITableViewCell *memInfo;
@property (weak, nonatomic) IBOutlet UITableViewCell *createdDate;
@property (weak, nonatomic) IBOutlet UITableViewCell *cpuUsage;

@property (nonatomic, strong) ListVMViewController *delegate;
@property (nonatomic,strong) VM *vmInfo;



@property (weak, nonatomic) IBOutlet UITableViewCell *currentState;

- (IBAction)manageButtonTouched:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *manageButton;
@property (weak, nonatomic) IBOutlet UIButton *destroyButton;
- (IBAction)destoryButtonTouched:(id)sender;

@end
