//
//  SAImageViewController.h
//  SimpleApp
//
//  Created by Sumaiya Hashmi on 8/15/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAImageViewController : UIViewController <UIGestureRecognizerDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) IBOutlet UILabel *itemName;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

@property (nonatomic, retain) IBOutlet UIImageView *current;
@property (nonatomic, retain) IBOutlet UIImageView *previous;
@property (nonatomic, retain) IBOutlet UIImageView *next;


@property (nonatomic, retain) NSDictionary *items;
@property (nonatomic, retain) NSString *currentItemName;
@property NSInteger imageCounter;

- (IBAction) showPrevImage:(UIButton *) sender;
- (IBAction) showNextImage:(UIButton *) sender;


@end
