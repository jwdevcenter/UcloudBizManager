//
//  ListVMViewController.h
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>




@interface ListVMViewController : UITableViewController <RKObjectLoaderDelegate>
@property (nonatomic,strong) NSArray *vmInfoArray;
@property (nonatomic) int currentRow;
@property (nonatomic,strong) UIBarButtonItem *originalBarButtonItem;
- (IBAction)refreshButtonClicked:(id)sender;

- (void)fillTableViewWithData;
- (void)startVM:(int)vmID;
- (void)stopVM:(int)vmID;
- (void)destoryVM:(int)vmID;


@end
