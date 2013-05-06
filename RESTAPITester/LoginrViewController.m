//
//  LoginrViewController.m
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginrViewController.h"

#define LOGIN_KEY @"uCloudBizP.Keys"

@interface LoginrViewController ()

@end

@implementation LoginrViewController
@synthesize testButton;
@synthesize apiKey;
@synthesize secretKey;




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
    NSArray *loginKeys = [[NSUserDefaults standardUserDefaults] objectForKey:LOGIN_KEY];
    apiKey.text = [loginKeys objectAtIndex:0];
    secretKey.text = [loginKeys objectAtIndex:1];
    
    //테스트시 값 입력하기
    self.testButton.hidden = false;
    
    
}


- (IBAction)test:(id)sender {
    apiKey.text = @"bAnQEgCFjlpthPDi88V9p_Y2VXCG0Xle7q8xFb-MGAl939KxdVvs5Vd5pUtp3v7SE0dUaW2fxSdfBNss6bafbA";
    secretKey.text = @"6nOv4oykBGfRxKoFc1UHGSyqvmB3JrBRojnDy0bMzNZyN6tIokxGHEYpUTw_MBzpRdAqnQ7jSSZS7f6YvEHmLQ";

}

- (void)viewDidUnload
{
    [self setApiKey:nil];
    [self setSecretKey:nil];

    [self setTestButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTouched:(id)sender {
    [apiKey resignFirstResponder];
    [secretKey resignFirstResponder];
}


- (IBAction)saveButtonTouched:(id)sender {
    
    [apiKey resignFirstResponder];
    [secretKey resignFirstResponder];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *loginKeys =[NSMutableArray array];
    [loginKeys addObject:self.apiKey.text];
    [loginKeys addObject:self.secretKey.text];
    [defaults setObject:loginKeys forKey:LOGIN_KEY];
    [defaults synchronize];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"저장 완료" message:@"Key 정보 입력이 저장되었습니다." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] ;
    [alert show];

}
@end
