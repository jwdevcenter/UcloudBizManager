//
//  ListVMViewController.m
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListVMViewController.h"
#import "JWRESTGlobal.h"
#import "ListVM.h"
#import "DetailVMViewController.h"

#define LOGIN_KEY @"uCloudBizP.Keys"

@interface ListVMViewController ()

@end

@implementation ListVMViewController
@synthesize vmInfoArray;
@synthesize currentRow;
@synthesize originalBarButtonItem;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)fillTableViewWithData
{
    NSArray *loginKeys = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_KEY];
    NSString *apiDefaultKey = [loginKeys objectAtIndex:0];
    NSString *apiDefaultSecretKey = [loginKeys objectAtIndex:1];
    
RKObjectMapping* vmMapping = [RKObjectMapping mappingForClass:[VM class]];
[vmMapping mapKeyPath:@"id" toAttribute:@"vmID"];
[vmMapping mapKeyPath:@"displayname" toAttribute:@"displayName"];
[vmMapping mapKeyPath:@"state" toAttribute:@"vmState"];
[vmMapping mapKeyPath:@"templatedisplaytext" toAttribute:@"imageyName"];
[vmMapping mapKeyPath:@"cpunumber" toAttribute:@"cpuInfo"];
[vmMapping mapKeyPath:@"memory" toAttribute:@"memInfo"];
[vmMapping mapKeyPath:@"created" toAttribute:@"createdDate"];
[vmMapping mapKeyPath:@"cpuused" toAttribute:@"cpuUsage"];



RKObjectMapping* listMapping = [RKObjectMapping mappingForClass:[ListVM class]];
listMapping.rootKeyPath = @"virtualmachine";
[listMapping mapKeyPath:@"virtualmachine" toRelationship:@"virtualMachines" withMapping:vmMapping];

[[RKObjectManager sharedManager].mappingProvider setMapping:listMapping forKeyPath:@"listvirtualmachinesresponse"];


NSString *apiNameText = @"command=listVirtualMachines";
//NSString *apiParameter1 = @"state=running";
NSString *apiResponseFormatText = @"response=json";
NSString *apiKey = [@"apiKey=" stringByAppendingString:apiDefaultKey];
NSString *apiSecretKey = apiDefaultSecretKey;

//Preparing msg
NSArray *commandStringArray = [NSArray arrayWithObjects: [apiNameText lowercaseString],[apiResponseFormatText lowercaseString], [apiKey lowercaseString], nil];
//Lowercase
NSArray *sortedCommandStringArray = [commandStringArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//Sorting msg parameter
NSString *msgToSend= [NSString stringWithFormat:@"%@&%@&%@", [sortedCommandStringArray objectAtIndex:0],[sortedCommandStringArray objectAtIndex:1],[sortedCommandStringArray objectAtIndex:2]];    
//Run HMAC_SHA1 converting, then store it to NSData with appropriate encoding
msgToSend = [JWRESTGlobal hashedValue:apiSecretKey andData:msgToSend];
NSData *msgData = [JWRESTGlobal hexStringToNSData:msgToSend];    
//Base64encode
NSString* base64EncodedSignature = [JWRESTGlobal base64EncodingWithLineLength:msgData :0];
  
NSString *resourcePath= [NSString stringWithFormat:@"/server/v1/client/api?command=listVirtualMachines&response=json&apiKey=%@&signature=%@",[apiDefaultKey stringByAddingURLEncoding],[base64EncodedSignature stringByAddingURLEncoding]];
NSLog(@"Querey is %@",resourcePath);
[[RKObjectManager sharedManager] loadObjectsAtResourcePath:resourcePath delegate:self];


}


- (void)destoryVM:(int)vmID
{
    NSArray *loginKeys = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_KEY];
    NSString *apiDefaultKey = [loginKeys objectAtIndex:0];
    NSString *apiDefaultSecretKey = [loginKeys objectAtIndex:1];
    
    NSLog(@"Destroy VM ID :%i",vmID);
    NSString *apiNameText = @"command=destroyVirtualMachine";
    NSString *apiParameter1 = [@"id=" stringByAppendingString:[[[NSNumber alloc] initWithInt:vmID] stringValue]];
    NSString *apiResponseFormatText = @"response=json";
    NSString *apiKey = [@"apiKey=" stringByAppendingString:apiDefaultKey];
    NSString *apiSecretKey = apiDefaultSecretKey;
    
    //Preparing msg
    NSArray *commandStringArray = [NSArray arrayWithObjects: [apiNameText lowercaseString], [apiParameter1 lowercaseString],[apiResponseFormatText lowercaseString], [apiKey lowercaseString], nil];
    //Lowercase
    NSArray *sortedCommandStringArray = [commandStringArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //Sorting msg parameter
    NSString *msgToSend= [NSString stringWithFormat:@"%@&%@&%@&%@", [sortedCommandStringArray objectAtIndex:0],[sortedCommandStringArray objectAtIndex:1],[sortedCommandStringArray objectAtIndex:2],[sortedCommandStringArray objectAtIndex:3]];    
    //Run HMAC_SHA1 converting, then store it to NSData with appropriate encoding
    msgToSend = [JWRESTGlobal hashedValue:apiSecretKey andData:msgToSend];
    NSData *msgData = [JWRESTGlobal hexStringToNSData:msgToSend];    
    //Base64encode
    NSString* base64EncodedSignature = [JWRESTGlobal base64EncodingWithLineLength:msgData :0];
    
    NSString *resourcePath= [NSString stringWithFormat:@"/server/v1/client/api?command=destroyVirtualMachine&id=%@&response=json&apiKey=%@&signature=%@",[[[NSNumber alloc] initWithInt:vmID] stringValue],[apiDefaultKey stringByAddingURLEncoding],[base64EncodedSignature stringByAddingURLEncoding]];
    NSLog(@"Querey is %@",resourcePath);
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:resourcePath delegate:self];
}

- (void)startVM:(int)vmID
{
    NSArray *loginKeys = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_KEY];
    NSString *apiDefaultKey = [loginKeys objectAtIndex:0];
    NSString *apiDefaultSecretKey = [loginKeys objectAtIndex:1];
    
    NSLog(@"Start VM ID :%i",vmID);
    NSString *apiNameText = @"command=startVirtualMachine";
    NSString *apiParameter1 = [@"id=" stringByAppendingString:[[[NSNumber alloc] initWithInt:vmID] stringValue]];
    NSString *apiResponseFormatText = @"response=json";
    NSString *apiKey = [@"apiKey=" stringByAppendingString:apiDefaultKey];
    NSString *apiSecretKey = apiDefaultSecretKey;
    
    //Preparing msg
    NSArray *commandStringArray = [NSArray arrayWithObjects: [apiNameText lowercaseString], [apiParameter1 lowercaseString],[apiResponseFormatText lowercaseString], [apiKey lowercaseString], nil];
    //Lowercase
    NSArray *sortedCommandStringArray = [commandStringArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //Sorting msg parameter
    NSString *msgToSend= [NSString stringWithFormat:@"%@&%@&%@&%@", [sortedCommandStringArray objectAtIndex:0],[sortedCommandStringArray objectAtIndex:1],[sortedCommandStringArray objectAtIndex:2],[sortedCommandStringArray objectAtIndex:3]];    
    //Run HMAC_SHA1 converting, then store it to NSData with appropriate encoding
    msgToSend = [JWRESTGlobal hashedValue:apiSecretKey andData:msgToSend];
    NSData *msgData = [JWRESTGlobal hexStringToNSData:msgToSend];    
    //Base64encode
    NSString* base64EncodedSignature = [JWRESTGlobal base64EncodingWithLineLength:msgData :0];
    
    NSString *resourcePath= [NSString stringWithFormat:@"/server/v1/client/api?command=startVirtualMachine&id=%@&response=json&apiKey=%@&signature=%@",[[[NSNumber alloc] initWithInt:vmID] stringValue],[apiDefaultKey stringByAddingURLEncoding],[base64EncodedSignature stringByAddingURLEncoding]];
    NSLog(@"Querey is %@",resourcePath);
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:resourcePath delegate:self];
}

- (void)stopVM:(int)vmID
{
    NSArray *loginKeys = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_KEY];
    NSString *apiDefaultKey = [loginKeys objectAtIndex:0];
    NSString *apiDefaultSecretKey = [loginKeys objectAtIndex:1];
    
    NSLog(@"Stop VM ID :%i",vmID);
    NSString *apiNameText = @"command=stopVirtualMachine";
    NSString *apiParameter1 = [@"id=" stringByAppendingString:[[[NSNumber alloc] initWithInt:vmID] stringValue]];
    NSString *apiResponseFormatText = @"response=json";
    NSString *apiKey = [@"apiKey=" stringByAppendingString:apiDefaultKey];
    NSString *apiSecretKey = apiDefaultSecretKey;
    
    //Preparing msg
    NSArray *commandStringArray = [NSArray arrayWithObjects: [apiNameText lowercaseString], [apiParameter1 lowercaseString],[apiResponseFormatText lowercaseString], [apiKey lowercaseString], nil];
    //Lowercase
    NSArray *sortedCommandStringArray = [commandStringArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //Sorting msg parameter
    NSString *msgToSend= [NSString stringWithFormat:@"%@&%@&%@&%@", [sortedCommandStringArray objectAtIndex:0],[sortedCommandStringArray objectAtIndex:1],[sortedCommandStringArray objectAtIndex:2],[sortedCommandStringArray objectAtIndex:3]];    
    //Run HMAC_SHA1 converting, then store it to NSData with appropriate encoding
    msgToSend = [JWRESTGlobal hashedValue:apiSecretKey andData:msgToSend];
    NSData *msgData = [JWRESTGlobal hexStringToNSData:msgToSend];    
    //Base64encode
    NSString* base64EncodedSignature = [JWRESTGlobal base64EncodingWithLineLength:msgData :0];
    
    NSString *resourcePath= [NSString stringWithFormat:@"/server/v1/client/api?command=stopVirtualMachine&id=%@&response=json&apiKey=%@&signature=%@",[[[NSNumber alloc] initWithInt:vmID] stringValue],[apiDefaultKey stringByAddingURLEncoding],[base64EncodedSignature stringByAddingURLEncoding]];
    NSLog(@"Querey is %@",resourcePath);
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:resourcePath delegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 왜 이거 두번이지??
    // [super viewDidLoad];
	    
    // Do any additional setup after loading the view, typically from a nib.
    /*
     self.navigationItem.backBarButtonItem = nil;//[[UIBarButtonItem alloc] initWithTitle:@"The Title" style:UIBarButtonItemStyleBordered target:nil action:nil];
     
     UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
     style:UIBarButtonItemStylePlain target:nil action:nil];
     self.navigationItem.backBarButtonItem = backButton;
     
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
     
     UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
     backButton.title = @"go back - now!";
     backButton.tintColor = [UIColor colorWithRed:0.1 green:0.5 blue:0.7 alpha:1.0];
     self.navigationItem.backBarButtonItem = backButton;
     */
    
    //실제로는 사용한다(처음 만든 녀석이 자동으로 shared가 됨)
    //공유자원이므로 위치를 옮기는 것도 공유해야 할듯
    RKObjectManager* manager = [RKObjectManager objectManagerWithBaseURL:[NSURL URLWithString:@"https://api.ucloudbiz.olleh.com"]];
    
    
    //Only cell accessory can receive touch event
    //self.tableView.allowsSelection = FALSE;
    
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    
    NSArray *loginKeys = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_KEY];
    if (!loginKeys) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"로그인 하세요" message:@"로그인 정보 입력이 필요합니다." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
        [alert show];
        self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:1];
        return;
    }
    else {
        [self fillTableViewWithData];
    }

    
    
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects
{
    RKLogInfo(@"Load collection of Articles: %@", objects);
    NSLog(@"objects count: %d.", [objects count]);
    
    for (ListVM *listVMObject in objects) {    
        vmInfoArray = listVMObject.virtualMachines;
    }
    [self.tableView reloadData];
    
    if (self.originalBarButtonItem) self.navigationItem.rightBarButtonItem = originalBarButtonItem;
    self.navigationItem.rightBarButtonItem.enabled = true;

}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    
    NSLog(@"objectLoader:didFailWithError received error : %@",error);
    /*
    if ([error code] == 1001) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"에러 발생" message:@"API Key가 정확하지 않습니다." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
        [alert show];
    }
    */
    
    if (self.originalBarButtonItem) self.navigationItem.rightBarButtonItem = originalBarButtonItem;
     
    self.navigationItem.rightBarButtonItem.enabled = true;
    

}


- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {  
    if ([request isGET]) {
        if ([response isJSON]) {  
            if ([response isJSON]) {
                //NSLog(@"response : %@", [response bodyAsString]);
                NSRange foundRange = [[response bodyAsString] rangeOfString:@"unable to verify user credentials and/or request signature"];
                if (foundRange.location!=NSNotFound) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"에러 발생" message:@"API Key가 정확하지 않습니다." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
                    [alert show];
                }
                //당일생성 Virtual machine 은 삭제할 수 없습니다.
                foundRange = [[response bodyAsString] rangeOfString:@"당일생성 Virtual machine 은 삭제할 수 없습니다."];
                if (foundRange.location!=NSNotFound) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"에러 발생" message:@"당일생성 Virtual machine 은 삭제할 수 없습니다." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
                    [alert show];
                }

                
            }
            
        }  
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return vmInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"VMList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    cell.textLabel.text = [[vmInfoArray objectAtIndex:indexPath.row] displayName];
    cell.detailTextLabel.text = [[vmInfoArray objectAtIndex:indexPath.row] vmState];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    self.currentRow = indexPath.row;
    NSLog(@"Current row number is %i",self.currentRow);
    [self performSegueWithIdentifier:@"ShowVMDetailInfo" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"ShowVMDetailInfo"]){
        
        DetailVMViewController *vmVC = (DetailVMViewController *)[segue destinationViewController];
        vmVC.vmInfo = [vmInfoArray objectAtIndex:self.currentRow];
        vmVC.delegate = self;
         
                
    }
}
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

- (IBAction)refreshButtonClicked:(id)sender {
    
    NSArray *loginKeys = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_KEY];
    if (!loginKeys) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"로그인 하세요" message:@"API Key 정보 입력이 필요합니다." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
        [alert show];
        self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:1];
        return;
    }
    
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner startAnimating];
    self.navigationItem.rightBarButtonItem.enabled = false;
    self.originalBarButtonItem = self.navigationItem.rightBarButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
    
    
    //self.navigationItem.rightBarButtonItem = sender;
    
    
    
    dispatch_queue_t downloadqueue = dispatch_queue_create("List downloader", NULL);
    dispatch_async(downloadqueue, ^{
        
        sleep(8);
        [self fillTableViewWithData];
        //sleep(5);
        //self.navigationItem.rightBarButtonItem = sender;
       // self.navigationItem.rightBarButtonItem.enabled = true;


        
        //UI things should done in main queue
        
        //dispatch_async(dispatch_get_main_queue(), ^{
                        
        //});
        
    });
    dispatch_release(downloadqueue);
     
}
@end
