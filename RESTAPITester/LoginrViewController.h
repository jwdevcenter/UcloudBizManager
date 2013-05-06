//
//  LoginrViewController.h
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginrViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *apiKey;
@property (weak, nonatomic) IBOutlet UITextField *secretKey;

- (IBAction)textFieldReturn:(id)sender;
- (IBAction)backgroundTouched:(id)sender;
- (IBAction)saveButtonTouched:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *testButton;


@end
