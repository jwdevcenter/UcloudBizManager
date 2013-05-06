//
//  DetailVMViewController.m
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailVMViewController.h"

@interface DetailVMViewController () <UIAlertViewDelegate>

@end

@implementation DetailVMViewController
@synthesize manageButton;
@synthesize destroyButton;

@synthesize delegate;
@synthesize vmInfo;
@synthesize serverName;
@synthesize imageName;
@synthesize cpuInfo;
@synthesize memInfo;
@synthesize createdDate;
@synthesize cpuUsage;
@synthesize currentState;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    

    
    NSLog(@"Current VM ID is ..%i",[vmInfo.vmID intValue]);
    //self.currentVMID = [vmInfo.vmID intValue];
    self.serverName.detailTextLabel.text = vmInfo.displayName;
    self.imageName.detailTextLabel.text = vmInfo.imageyName;
    self.cpuInfo.detailTextLabel.text = [vmInfo.cpuInfo stringByAppendingString:@" core"];
    self.memInfo.detailTextLabel.text = [[[[NSNumber alloc] initWithInt: [vmInfo.memInfo intValue]/1024] stringValue] stringByAppendingString:@" GB"];
    NSRange range, range2;
    range.location = 0;
    range.length = 10;
    range2.location = 12;
    range2.length = 7;
    self.createdDate.detailTextLabel.text = [[[vmInfo.createdDate substringWithRange:range] stringByAppendingString:@" "] stringByAppendingString:[vmInfo.createdDate substringWithRange:range2]];
    self.cpuUsage.detailTextLabel.text = vmInfo.cpuUsage;
    self.currentState.detailTextLabel.text = vmInfo.vmState;
    
   //self.currentState.detailTextLabel.text = vmInfo.vmState;
    //[self.tableView reloadData];
    //vmVC.vmInfo = [vmInfoArray objectAtIndex:self.currentRow];
    //[delegate.vmInfoArray objectAtIndex:delegate.currentRow] = self.vmInfo;
    /*
    NSMutableArray *vmInfoArray = [delegate.vmInfoArray mutableCopy];
    [vmInfoArray replaceObjectAtIndex:delegate.currentRow withObject:vmInfo];
    delegate.vmInfoArray = vmInfoArray;
    [delegate.tableView reloadData];
     */
    

    
    if ([vmInfo.vmState isEqualToString:@"Running"]) {
        self.manageButton.enabled = TRUE;
        self.manageButton.titleLabel.text = @"정지하기";
        self.destroyButton.enabled = false;
        self.destroyButton.titleLabel.text = @"정지된 서버만 삭제가능합니다";
        self.destroyButton.titleLabel.textAlignment = UITextAlignmentCenter;
    }else if ([vmInfo.vmState isEqualToString:@"Stopping"]) {
        self.manageButton.enabled = false;
        self.manageButton.titleLabel.text = @"정지중..";
        self.destroyButton.enabled = false;
        self.destroyButton.titleLabel.text = @"정지된 서버만 삭제가능합니다";
        self.destroyButton.titleLabel.textAlignment = UITextAlignmentCenter;
    }else if ([vmInfo.vmState isEqualToString:@"Starting"]) {
        self.manageButton.enabled = false;
        self.manageButton.titleLabel.text = @"시작중..";
        self.destroyButton.enabled = false;
        self.destroyButton.titleLabel.text = @"정지된 서버만 삭제가능합니다";
        self.destroyButton.titleLabel.textAlignment = UITextAlignmentCenter;
    }else if ([vmInfo.vmState isEqualToString:@"Stopped"]) {
        self.manageButton.enabled = TRUE;
        self.manageButton.titleLabel.text = @"시작하기";
        self.destroyButton.enabled = true;
        self.destroyButton.titleLabel.text = @"삭제하기";
        self.destroyButton.titleLabel.textAlignment = UITextAlignmentCenter;
        
    }else if ([vmInfo.vmState isEqualToString:@"Destroying"]) {
        self.manageButton.enabled = FALSE;
        self.manageButton.titleLabel.text = @"정지불가";
        self.destroyButton.enabled = FALSE;
        self.destroyButton.titleLabel.text = @"삭제중..";
        self.destroyButton.titleLabel.textAlignment = UITextAlignmentCenter;
        
    }

    
}

- (void)viewDidUnload
{
    [self setServerName:nil];
    [self setImageName:nil];
    [self setCpuInfo:nil];
    [self setMemInfo:nil];
    [self setCreatedDate:nil];
    [self setCpuUsage:nil];
    [self setCurrentState:nil];
    [self setManageButton:nil];
    [self setDestroyButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


- (IBAction)manageButtonTouched:(id)sender {
    if ([vmInfo.vmState isEqualToString:@"Running"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"주의" message:@"정말 정지하시겠습니까?." delegate:self cancelButtonTitle:@"아니오" otherButtonTitles:@"정지",nil] ;
        [alert show];
         }else if ([vmInfo.vmState isEqualToString:@"Stopped" ]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"주의" message:@"정말 시작하시겠습니까?." delegate:self cancelButtonTitle:@"아니오" otherButtonTitles:@"시작",nil] ;
        [alert show];
        
    }
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonPressedName = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonPressedName isEqualToString:@"정지"]) {
        [delegate stopVM:[vmInfo.vmID intValue]];
        self.currentState.detailTextLabel.text = @"Stopping";
        self.manageButton.enabled = false;
        self.manageButton.titleLabel.text = @"정지중..";
        self.destroyButton.enabled = false;
        self.destroyButton.titleLabel.text = @"정지된 서버만 삭제가능합니다"; 
        self.destroyButton.titleLabel.textAlignment = UITextAlignmentCenter;
        vmInfo.vmState = @"Stopping";
        NSMutableArray *vmInfoArray = [delegate.vmInfoArray mutableCopy];
        [vmInfoArray replaceObjectAtIndex:delegate.currentRow withObject:vmInfo];
        delegate.vmInfoArray = vmInfoArray;
        [delegate.tableView reloadData];
    }else if ([buttonPressedName isEqualToString:@"시작"]) {
        [delegate startVM:[vmInfo.vmID intValue]];
        self.currentState.detailTextLabel.text = @"Starting";
        self.manageButton.enabled = false;
        self.manageButton.titleLabel.text = @"시작중..";
        self.destroyButton.enabled = false;
        self.destroyButton.titleLabel.text = @"정지된 서버만 삭제가능합니다"; 
        self.destroyButton.titleLabel.textAlignment = UITextAlignmentCenter;        
        vmInfo.vmState = @"Starting";
        NSMutableArray *vmInfoArray = [delegate.vmInfoArray mutableCopy];
        [vmInfoArray replaceObjectAtIndex:delegate.currentRow withObject:vmInfo];
        delegate.vmInfoArray = vmInfoArray;
        [delegate.tableView reloadData];
    }else if ([buttonPressedName isEqualToString:@"삭제"]) {
        [delegate destoryVM:[vmInfo.vmID intValue]];
        self.currentState.detailTextLabel.text = @"Destroying";
        self.manageButton.enabled = false;
        self.manageButton.titleLabel.text = @"정지불가";
        self.destroyButton.enabled = false;
        self.destroyButton.titleLabel.text = @"삭제중.."; 
        self.destroyButton.titleLabel.textAlignment = UITextAlignmentCenter;
        vmInfo.vmState = @"Destroying";
        NSMutableArray *vmInfoArray = [delegate.vmInfoArray mutableCopy];
        [vmInfoArray replaceObjectAtIndex:delegate.currentRow withObject:vmInfo];
        delegate.vmInfoArray = vmInfoArray;
        [delegate.tableView reloadData];
    }
  
}
- (IBAction)destoryButtonTouched:(id)sender {
    if ([vmInfo.vmState isEqualToString:@"Stopped" ]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"주의" message:@"정말 삭제하시겠습니까?VM의 추가디스크는 유지됩니다." delegate:self cancelButtonTitle:@"아니오" otherButtonTitles:@"삭제",nil] ;
        [alert show];
        
    }
}
@end
