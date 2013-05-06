//
//  RESTAPITesterSecondViewController.m
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RESTAPITesterSecondViewController.h"
#import <RestKit/RestKit.h>
#import "ListVM.h"

@interface RESTAPITesterSecondViewController () <RKObjectLoaderDelegate>

@end

@implementation RESTAPITesterSecondViewController
@synthesize testTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    RKObjectManager* manager = [RKObjectManager objectManagerWithBaseURL:[NSURL URLWithString:@"https://api.ucloudbiz.olleh.com"]];

    RKObjectMapping* vmMapping = [RKObjectMapping mappingForClass:[VM class]];
    [vmMapping mapKeyPath:@"id" toAttribute:@"vmID"];
    [vmMapping mapKeyPath:@"displayname" toAttribute:@"displayName"];
    [vmMapping mapKeyPath:@"state" toAttribute:@"state"];
    
    RKObjectMapping* listMapping = [RKObjectMapping mappingForClass:[ListVM class]];
    listMapping.rootKeyPath = @"virtualmachine";
    [listMapping mapKeyPath:@"virtualmachine" toRelationship:@"virtualMachines" withMapping:vmMapping];

     [[RKObjectManager sharedManager].mappingProvider setMapping:listMapping forKeyPath:@"listvirtualmachinesresponse"];
    
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/server/v1/client/api?apiKey=TV7K3ve-3wLvILLyJhvQnM_H2ZJ2p1uFo0kWmRyBfRABXazlQwmmO47AW9skbfN57Uk5kpnQJ-Dkg1LWxj-voA&state=Running&response=json&signature=YmCZ8DSIagzRzgobV8%2FL%2B8%2Bf2QE%3D&command=listVirtualMachines" delegate:self];
    
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects
{
    RKLogInfo(@"Load collection of Articles: %@", objects);
    NSLog(@"objects count: %d.", [objects count]);
    //ListVM *edition = [objects objectAtIndex:0];
    //NSLog(@"edition title: %@.", [ListVM virtualMachines]);
    
    for (ListVM *listVMObject in objects) {    
        NSArray *vmObjectArray = listVMObject.virtualMachines;
        for (VM *vmInfo in vmObjectArray) {
            NSLog(@"News minute = %@", [vmInfo vmID] );
               }
        
    }
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    NSLog(@"Oh my god: %@",error);
    /*
    NSError *parseError = nil;
    id response = [objectLoader.response parsedBody:&parseError];
    NSLog(@"response %@", response);    
    if (!parseError) {
        NSString *errorMessage = [[response valueForKey:@"error"] valueForKey:@"message"];     
        NSLog(@"Oh my god: %@",errorMessage);    
    }
     */
}

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {  
    if ([request isGET]) {  
        // Handling GET /foo.xml  
        
        if ([response isOK]) {  
            // Success! Let's take a look at the data  
            //NSLog(@"Retrieved : %@", [response bodyAsString]);
            if ([response isJSON]) {
                //NSLog(@"response : %@", [response bodyAsString]);            
            }
            
        }  
    }
}

- (void)viewDidUnload
{
    [self setTestTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
