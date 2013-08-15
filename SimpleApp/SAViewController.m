//
//  SAViewController.m
//  SimpleApp
//
//  Created by Sumaiya Hashmi on 6/20/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//

#import "SAViewController.h"

@interface SAViewController ()

@end

@implementation SAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.textField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)currentField
{
    if (currentField.text.length == 0)
    {
        return NO;
    }
    else
    {
        if (currentField == self.smallTextField) {
            
            [currentField resignFirstResponder];
            NSString *greet = [NSString stringWithFormat: @"hello %@ %@!", self.textField.text, currentField.text];
            self.nameLabel.text = greet;
            currentField.text = @"";
            self.textField.text = @"";
            
        }
        
        else {
            [self.smallTextField becomeFirstResponder];
        }
        
        return YES;
    }
}

@end
