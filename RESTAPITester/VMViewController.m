//
//  VMViewController.m
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMViewController.h"


@interface VMViewController ()

@end

@implementation VMViewController
@synthesize delegate;
@synthesize vmInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
    NSLog(@"Current VM ID is ..%i",[vmInfo.vmID intValue]);
    vmInfo.vmState = @"stopped";
    //vmVC.vmInfo = [vmInfoArray objectAtIndex:self.currentRow];
    //[delegate.vmInfoArray objectAtIndex:delegate.currentRow] = self.vmInfo;
    
    NSMutableArray *vmInfoArray = [delegate.vmInfoArray mutableCopy];
    [vmInfoArray replaceObjectAtIndex:delegate.currentRow withObject:vmInfo];
    delegate.vmInfoArray = vmInfoArray;
    [delegate.tableView reloadData];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
