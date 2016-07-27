//
//  ViewController.m
//  06 Restructure
//
//  Created by tomandhua on 16/6/3.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "ViewController.h"

static const CGFloat buttonHeight = 40;
static const CGFloat buttonWidth = 120;
static const CGFloat spacing = 20;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIApplication *app = [UIApplication sharedApplication];
    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
    [self doLayoutForOrientation:currentOrientation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self doLayoutForOrientation:toInterfaceOrientation];
}

- (void)doLayoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        [self layoutPortrait];
    } else {
        [self layoutLandscape];
    }
}

- (void)layoutPortrait {
    CGRect b = self.view.bounds;
    
    CGFloat contentWidth = CGRectGetWidth(b) - (2 * spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (4 * spacing) - (2 * buttonHeight);
    
    self.contentView.frame = CGRectMake(spacing, spacing, contentWidth, contentHeight);
    
    CGFloat buttonRow1y = contentHeight + (2 * spacing);
    
    CGFloat buttonRow2y = buttonRow1y + buttonHeight + spacing;
    
    CGFloat buttonCol1x = spacing;
    CGFloat buttonCol2x = CGRectGetWidth(b) - buttonWidth - spacing;
    
    self.actionButton1.frame = CGRectMake(buttonCol1x, buttonRow1y, buttonWidth, buttonHeight);
    
    self.actionButton2.frame = CGRectMake(buttonCol2x, buttonRow1y, buttonWidth, buttonHeight);
    
    self.actionButton3.frame = CGRectMake(buttonCol1x, buttonRow2y, buttonWidth, buttonHeight);
    
    self.actionButton4.frame = CGRectMake(buttonCol2x, buttonRow2y, buttonWidth, buttonHeight);
    
}

- (void)layoutLandscape {
    CGRect b = self.view.bounds;
    
    CGFloat contentWidth = CGRectGetWidth(b) - buttonWidth - (3 * spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (2 * spacing);
    
    self.contentView.frame = CGRectMake(spacing, spacing, contentWidth, contentHeight);
    
    CGFloat buttonX = CGRectGetWidth(b) - buttonWidth -spacing;
    
    CGFloat buttonRow1y = spacing;
    CGFloat buttonRow4y = CGRectGetHeight(b) - buttonHeight - spacing;

    CGFloat buttonRow2y = buttonRow1y + floor(buttonRow4y - buttonRow1y) * 0.333;
    
    CGFloat buttonRow3y = buttonRow1y + floor(buttonRow4y - buttonRow1y) * 0.667;
    
    self.actionButton1.frame = CGRectMake(buttonX, buttonRow1y, buttonWidth, buttonHeight);
    
    self.actionButton2.frame = CGRectMake(buttonX, buttonRow2y, buttonWidth, buttonHeight);
    
    self.actionButton3.frame = CGRectMake(buttonX, buttonRow3y, buttonWidth, buttonHeight);
    
    self.actionButton4.frame = CGRectMake(buttonX, buttonRow4y, buttonWidth, buttonHeight);
    
}

@end
