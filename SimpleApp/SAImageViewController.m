//
//  SAImageViewController.m
//  SimpleApp
//
//  Created by Sumaiya Hashmi on 8/15/13.
//  Copyright (c) 2013 Sumaiya Hashmi. All rights reserved.
//
//  Modified from: ViewController.m, Square Code Camp
//  Created by Square on 1/9/13.
//  Copyright (c) 2013 Square. All rights reserved.
//

#import "SAImageViewController.h"

@interface SAImageViewController()

@end


@implementation SAImageViewController
#pragma mark - Initialize Gesture Recognizers


- (void)createGestureRecognizers {
    // Swipe Right Gesture
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc]
                                                   initWithTarget:self
                                                   action:@selector(handleRightSwipe:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRightGesture];
    
    
    // Swipe Left Gesture
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(handleLeftSwipe:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftGesture];
    
    
}


#pragma mark - Handlers for gesture recognizers


- (void)handleLeftSwipe:(UISwipeGestureRecognizer *)sender {
    [self showNextImage:nil];
}


- (void)handleRightSwipe:(UISwipeGestureRecognizer *)sender {
    [self showPrevImage:nil];
}



#pragma mark - Sample Browsing Interaction

/*
 Show the previous image (when Back button is pressed)
 */
- (IBAction) showPrevImage:(UIButton *)sender {
    if(self.imageCounter > 0)
        self.imageCounter--;
    else
        self.imageCounter = 11;
    
    [self updateItem];
}


/*
 Show the next image (when Next button is pressed)
 */
- (IBAction) showNextImage:(UIButton *)sender {
    if(self.imageCounter < self.items.count-1)
        self.imageCounter++;
    else
        self.imageCounter = 0;
    [self updateItem];
    
    
}


/*
 Show the current item
 */

- (void)updateItem{
    
    // Update dummy images
    
    NSInteger currentImage = self.imageCounter;
    NSInteger previousImage;
    NSInteger nextImage;
    if (self.imageCounter > 0)
        previousImage = self.imageCounter - 1;
    else
        previousImage = self.items.count - 1;
    
    if (self.imageCounter < self.items.count-1)
        nextImage = self.imageCounter + 1;
    else
        nextImage = 0;
    NSLog(@"%i,%i,%i",previousImage, currentImage, nextImage);
    
    NSString *imagePathCurrent = [[self.items allValues] objectAtIndex:currentImage];
    UIImage *imageCurrent = [UIImage imageNamed:imagePathCurrent];
    NSLog(@"%@",imagePathCurrent);
    self.current.image = imageCurrent;
    
    NSString *imagePathPrevious = [[self.items allValues] objectAtIndex:previousImage];
    UIImage *imagePrevious = [UIImage imageNamed:imagePathPrevious];
    self.previous.image = imagePrevious;
    
    NSString *imagePathNext = [[self.items allValues] objectAtIndex:nextImage];
    UIImage *imageNext = [UIImage imageNamed:imagePathNext];
    self.next.image = imageNext;
    
    // Update item title
    self.currentItemName = [[self.items allKeys] objectAtIndex:self.imageCounter];
    self.itemName.text = self.currentItemName;
    
    CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView animateWithDuration:1.0 animations:^{
        
        self.view.frame = newFrame;
        self.view.alpha = 0.2;
        self.view.alpha = 1.5;
    } completion:^(BOOL finished) {
        
        
    }];
 }


/*
 Delegate method called when user scrolls through images
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if(self.scrollView.contentOffset.x == self.scrollView.frame.origin.x + ((self.imageCounter-1) * self.view.frame.size.width)){
        
        // Scrolled backward
        [self showPrevImage:nil];
    }
    else if(self.scrollView.contentOffset.x == self.scrollView.frame.origin.x + ((self.imageCounter+1) * self.view.frame.size.width)){
        
        // Scrolled forward
        [self showNextImage:nil];
    }
}

#pragma mark - View Management

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    
    // Load sample item names and images
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"items" ofType:@"plist"];
    self.items = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    // UIColor *buttonColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:.8];
    UIColor *buttonColor = [UIColor clearColor];
    self.backButton.backgroundColor = buttonColor;
    self.nextButton.backgroundColor = buttonColor;
    
    [self updateItem];
    
    [self createGestureRecognizers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



