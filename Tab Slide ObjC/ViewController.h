//
//  ViewController.h
//  Tab Slide ObjC
//
//  Created by Daniel Burke on 3/12/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *button1WidthConstraint;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *button2WidthConstraint;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *button3WidthConstraint;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineXConstraint;
@property (weak, nonatomic) IBOutlet UILabel *tabLabel;

- (IBAction)switchTab:(id)sender;
@end

