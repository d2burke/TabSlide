//
//  ViewController.m
//  Tab Slide ObjC
//
//  Created by Daniel Burke on 3/12/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabLabel.layer.cornerRadius = 3.f;
}

/*
    After the view has rendered update the width constraints of your
    tab buttons and tab line to be equally wide accoring to the width
    of the view.
 
    Force the tab line to be the top-most view
 
    Manually set the contentSize of the scrollView to make sure
    it scrolls to all of the content inside it.  There should be an
    Autolayout-only fix for this, but I haven't found it for this
    exact instance.
 */
- (void)viewDidAppear:(BOOL)animated{
    self.button1WidthConstraint.constant = self.view.frame.size.width/3;
    self.button2WidthConstraint.constant = self.view.frame.size.width/3;
    self.button3WidthConstraint.constant = self.view.frame.size.width/3;
    self.lineWidthConstraint.constant = self.view.frame.size.width/3;
    [self.view setNeedsLayout];
    
    [self.view bringSubviewToFront:self.line];
    
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, _scrollView.frame.size.height);
}

#pragma mark - UIScrollViewDelegate Methods
/*
    Make sure you ctrl+drag and connect the scrollview
    to the ViewController and set the ViewController as 
    the delegate for the scrollview.
 
    As the scrollview is scrolled, this method fires. Use
    the contentOffset to reposition the tab line, as well
    as calculate which tab you're currently on.
 
    Set the current tab to 'selected' and update the text
    of the tab label
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.lineXConstraint.constant =  (scrollView.contentOffset.x/self.view.frame.size.width) * self.view.frame.size.width/3;
    
    int tabIndex = floor(scrollView.contentOffset.x/self.view.frame.size.width);
    
    self.tabLabel.text = [NSString stringWithFormat:@"Tab %i", tabIndex+1];
    
    switch (tabIndex) {
        case 0:
            self.button1.selected = YES;
            self.button2.selected = NO;
            self.button3.selected = NO;
            break;
        case 1:
            self.button1.selected = NO;
            self.button2.selected = YES;
            self.button3.selected = NO;
            break;
        case 2:
            self.button1.selected = NO;
            self.button2.selected = NO;
            self.button3.selected = YES;
            break;
            
        default:
            break;
    }
}

#pragma mark - Custom Actions

/*
    Each tab button should be attached to this method
    by ctrl-dragging from each button in Interace Builder
    to the method declaration in the .h file
 
    Ensure each button has a tag property from 1 - n.  Do
    not use 0 as a tag value as that will cause the app to
    crash.
 
    Using the tag, determine what position to scroll to. As
    scrolling takes place, scrollViewDidScroll: will be
    called as if the user was scrolling it.
 */
- (IBAction)switchTab:(id)sender {
    
    CGFloat viewWidth = self.view.frame.size.width;
    
    //Cast 'sender' to a UIButton
    UIButton *button = (UIButton*)sender;
    
    //Base on the button's tag (set in Attribute Inspector),
    //scroll to a calculated position in the scrollview
    CGFloat scrollViewOffsetX = (button.tag-1) * viewWidth;
    
    //Animate to the tab
    [UIView animateWithDuration:0.34 animations:^{
        self.scrollView.contentOffset = CGPointMake(scrollViewOffsetX, 0);
    }];
}
@end
