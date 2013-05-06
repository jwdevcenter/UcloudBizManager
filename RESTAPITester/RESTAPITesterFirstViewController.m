//
//  RESTAPITesterFirstViewController.m
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RESTAPITesterFirstViewController.h"
#import "JWRESTGlobal.h"




@interface RESTAPITesterFirstViewController ()

@end

@implementation RESTAPITesterFirstViewController

@synthesize outputField;
@synthesize jobID;

- (IBAction)test:(id)sender {
    NSURL *url = [NSURL URLWithString:
                  @"https://api.ucloudbiz.olleh.com/server/v1/client/api?command=listVirtualMachines&state=Running&response=xml&apiKey=DG83ZkhQwNHyHdtSYTNI2CO0CmXT5a5hlBbtznowqwy1fzbCoZuPypdgn7Me-6p7VWJpvyI0W9KzaIUs_hzovA&signature=WvSNZ/xc9oCrYkFx7adGHN7zbo8="];
    
    NSLog(@"Scheme: %@", [url scheme]); 
    NSLog(@"Host: %@", [url host]); 
    NSLog(@"Port: %@", [url port]);     
    NSLog(@"Path: %@", [url path]);     
    NSLog(@"Relative path: %@", [url relativePath]);
    NSLog(@"Path components as array: %@", [url pathComponents]);        
    NSLog(@"Parameter string: %@", [url parameterString]);   
    NSLog(@"Query: %@", [url query]);       
    NSLog(@"Fragment: %@", [url fragment]);
}



- (IBAction)listAvaiableVM:(id)sender {
    NSString *apiNameText = @"command=listAvailableProductTypes";
    NSString *apiResponseFormatText = @"response=xml";
    NSString *apiKey = [@"apiKey=" stringByAppendingString:KTuCloudBizAPIKey];
    NSString *apiSecretKey = KTuCloudBizSecretKey;
    
    //Preparing msg
    NSArray *commandStringArray = [NSArray arrayWithObjects: [apiNameText lowercaseString], [apiResponseFormatText lowercaseString], [apiKey lowercaseString], nil];
    //Lowercase
    NSArray *sortedCommandStringArray = [commandStringArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //Sorting msg parameter
    NSString *msgToSend= [NSString stringWithFormat:@"%@&%@&%@", [sortedCommandStringArray objectAtIndex:0],[sortedCommandStringArray objectAtIndex:1],[sortedCommandStringArray objectAtIndex:2]];    
    //Run HMAC_SHA1 converting, then store it to NSData with appropriate encoding
    msgToSend = [JWRESTGlobal hashedValue:apiSecretKey andData:msgToSend];
    NSData *msgData = [JWRESTGlobal hexStringToNSData:msgToSend];    
    //Base64encode
    NSString* base64EncodedSignature = [JWRESTGlobal base64EncodingWithLineLength:msgData :0];
    
    //UTF8 url encoding will be done automatically by RKClient
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init]; 
    [dic setObject:@"listAvailableProductTypes" forKey:@"command"];  
    [dic setObject:@"xml" forKey:@"response"];
    [dic setObject:KTuCloudBizAPIKey forKey:@"apiKey"]; 
    [dic setObject:base64EncodedSignature forKey:@"signature"];
    
    RKRequest *request = [[RKClient sharedClient] get:@"/server/v1/client/api" queryParameters:dic delegate:self];
    NSLog(@"RKRequest Query: %@", [request.URL query]);
}
- (IBAction)deployVM:(id)sender {
    NSString *apiNameText = @"command=deployVirtualMachine";
    NSString *apiParameterText = @"serviceofferingid=107";
    NSString *apiParameterText2 = @"templateid=829";
    NSString *apiParameterText3 = @"diskofferingid=41";
    NSString *apiParameterText4 = @"zoneid=2";
    NSString *apiResponseFormatText = @"response=json";
    NSString *apiKey = [@"apiKey=" stringByAppendingString:KTuCloudBizAPIKey];
    NSString *apiSecretKey = KTuCloudBizSecretKey;
    
    //Preparing msg
    NSArray *commandStringArray = [NSArray arrayWithObjects: [apiNameText lowercaseString], [apiParameterText lowercaseString], [apiParameterText2 lowercaseString],[apiParameterText3 lowercaseString],[apiParameterText4 lowercaseString],[apiResponseFormatText lowercaseString], [apiKey lowercaseString], nil];
    //Lowercase
    NSArray *sortedCommandStringArray = [commandStringArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //Sorting msg parameter
    NSString *msgToSend= [NSString stringWithFormat:@"%@&%@&%@&%@&%@&%@&%@", [sortedCommandStringArray objectAtIndex:0],[sortedCommandStringArray objectAtIndex:1],[sortedCommandStringArray objectAtIndex:2],[sortedCommandStringArray objectAtIndex:3],[sortedCommandStringArray objectAtIndex:4],[sortedCommandStringArray objectAtIndex:5],[sortedCommandStringArray objectAtIndex:6]];    
    //Run HMAC_SHA1 converting, then store it to NSData with appropriate encoding
    msgToSend = [JWRESTGlobal hashedValue:apiSecretKey andData:msgToSend];
    NSData *msgData = [JWRESTGlobal hexStringToNSData:msgToSend];    
    //Base64encode
    NSString* base64EncodedSignature = [JWRESTGlobal base64EncodingWithLineLength:msgData :0];
    
    //UTF8 url encoding will be done automatically by RKClient
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init]; 
    [dic setObject:@"deployVirtualMachine" forKey:@"command"]; 
    [dic setObject:@"107" forKey:@"serviceofferingid"]; 
    [dic setObject:@"829" forKey:@"templateid"]; 
    [dic setObject:@"41" forKey:@"diskofferingid"]; 
    [dic setObject:@"2" forKey:@"zoneid"]; 
    [dic setObject:@"json" forKey:@"response"];
    [dic setObject:KTuCloudBizAPIKey forKey:@"apiKey"]; 
    [dic setObject:base64EncodedSignature forKey:@"signature"];
    
    RKRequest *request = [[RKClient sharedClient] get:@"/server/v1/client/api" queryParameters:dic delegate:self];
    NSLog(@"RKRequest Query: %@", [request.URL query]);  
}
- (IBAction)queryJob:(id)sender {
    NSString *apiNameText = @"command=queryAsyncJobResult";
    NSString *apiParameterText = @"jobid=204147";
    NSString *apiResponseFormatText = @"response=json";
    NSString *apiKey = [@"apiKey=" stringByAppendingString:KTuCloudBizAPIKey];
    NSString *apiSecretKey = KTuCloudBizSecretKey;
    
    //Preparing msg
    NSArray *commandStringArray = [NSArray arrayWithObjects: [apiNameText lowercaseString], [apiParameterText lowercaseString], [apiResponseFormatText lowercaseString], [apiKey lowercaseString], nil];
    //Lowercase
    NSArray *sortedCommandStringArray = [commandStringArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //Sorting msg parameter
    NSString *msgToSend= [NSString stringWithFormat:@"%@&%@&%@&%@", [sortedCommandStringArray objectAtIndex:0],[sortedCommandStringArray objectAtIndex:1],[sortedCommandStringArray objectAtIndex:2],[sortedCommandStringArray objectAtIndex:3]];    
    //Run HMAC_SHA1 converting, then store it to NSData with appropriate encoding
    msgToSend = [JWRESTGlobal hashedValue:apiSecretKey andData:msgToSend];
    NSData *msgData = [JWRESTGlobal hexStringToNSData:msgToSend];    
    //Base64encode
    NSString* base64EncodedSignature = [JWRESTGlobal base64EncodingWithLineLength:msgData :0];
    
    //UTF8 url encoding will be done automatically by RKClient
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init]; 
    [dic setObject:@"queryAsyncJobResult" forKey:@"command"]; 
    [dic setObject:@"204147" forKey:@"jobid"]; 
    [dic setObject:@"json" forKey:@"response"];
    [dic setObject:KTuCloudBizAPIKey forKey:@"apiKey"]; 
    [dic setObject:base64EncodedSignature forKey:@"signature"];
    
    RKRequest *request = [[RKClient sharedClient] get:@"/server/v1/client/api" queryParameters:dic delegate:self];
    NSLog(@"RKRequest Query: %@", [request.URL query]); 
}

- (IBAction)listVM:(id)sender {
    

    NSString *apiNameText = @"command=listVirtualMachines";
    NSString *apiParameterText = @"state=Running";
    NSString *apiResponseFormatText = @"response=json";
    NSString *apiKey = [@"apiKey=" stringByAppendingString:KTuCloudBizAPIKey];
    NSString *apiSecretKey = KTuCloudBizSecretKey;
   
    //Preparing msg
    NSArray *commandStringArray = [NSArray arrayWithObjects: [apiNameText lowercaseString], [apiParameterText lowercaseString], [apiResponseFormatText lowercaseString], [apiKey lowercaseString], nil];
    //Lowercase
    NSArray *sortedCommandStringArray = [commandStringArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //Sorting msg parameter
    NSString *msgToSend= [NSString stringWithFormat:@"%@&%@&%@&%@", [sortedCommandStringArray objectAtIndex:0],[sortedCommandStringArray objectAtIndex:1],[sortedCommandStringArray objectAtIndex:2],[sortedCommandStringArray objectAtIndex:3]];    
    //Run HMAC_SHA1 converting, then store it to NSData with appropriate encoding
    msgToSend = [JWRESTGlobal hashedValue:apiSecretKey andData:msgToSend];
    NSData *msgData = [JWRESTGlobal hexStringToNSData:msgToSend];    
    //Base64encode
    NSString* base64EncodedSignature = [JWRESTGlobal base64EncodingWithLineLength:msgData :0];

    //UTF8 url encoding will be done automatically by RKClient
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init]; 
    [dic setObject:@"listVirtualMachines" forKey:@"command"]; 
    [dic setObject:@"Running" forKey:@"state"]; 
    [dic setObject:@"json" forKey:@"response"];
    [dic setObject:KTuCloudBizAPIKey forKey:@"apiKey"]; 
    [dic setObject:base64EncodedSignature forKey:@"signature"];

    RKRequest *request = [[RKClient sharedClient] get:@"/server/v1/client/api" queryParameters:dic delegate:self];
    NSLog(@"RKRequest Query: %@", [request.URL query]);        
 
   
} 

 
- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {  
    if ([request isGET]) {  
        // Handling GET /foo.xml  
        
        if ([response isOK]) {  
            // Success! Let's take a look at the data  
            //NSLog(@"Retrieved : %@", [response bodyAsString]);
            if ([response isJSON]) {
                outputField.text = [response bodyAsString];            }
            
        }  
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
  

    
}

- (void)viewDidUnload
{
    [self setOutputField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
