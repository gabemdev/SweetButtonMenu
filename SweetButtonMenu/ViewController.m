//
//  ViewController.m
//  SweetButtonMenu
//
//  Created by Rockstar. on 3/19/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIButton *mainButton;
@property UIButton *mainButtonOne;
@property UIButton *mainButtonTwo;
@property UIButton *mainButtonThree;
@property UIDynamicAnimator *dynamicAnimator;
@property BOOL areButtonsFanned;
@end

@implementation ViewController

//- (UIButton *)mainButton {
//    if (!_mainButton) {
//        _mainButton = [[UIButton alloc] init];
//
//    }
//    return _mainButton;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainButtonOne = [self createButtonWithTitle:@"1"];
    self.mainButtonTwo = [self createButtonWithTitle:@"2"];
    self.mainButtonThree = [self createButtonWithTitle:@"3"];
    self.mainButton = [self createButtonWithTitle:@"P"];

    [self.mainButton addTarget:self action:@selector(fanButtons:) forControlEvents:UIControlEventTouchUpInside];

    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    self.areButtonsFanned = NO;


}

- (UIButton *)createButtonWithTitle:(NSString *)title {

    CGRect frame = self.view.frame;

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - 50, frame.size.height - 50, 50, 50)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = button.bounds.size.width / 2;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = button.titleLabel.textColor.CGColor;
    [self.view addSubview:button];

    return button;

}

- (void)fanButtons:(id)sender {
    [self.dynamicAnimator removeAllBehaviors];

    if (self.areButtonsFanned) {
        [self fanIn];
    } else {
        [self fanOut];
    }
    self.areButtonsFanned = !self.areButtonsFanned;
}

- (void)fanOut {
    CGPoint point;
    UISnapBehavior *snapBehavior;
    point = CGPointMake(self.mainButton.frame.origin.x - 50, self.mainButton.frame.origin.y + 20);
    snapBehavior= [[UISnapBehavior alloc] initWithItem:self.mainButtonOne snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(self.mainButton.frame.origin.x - 45, self.mainButton.frame.origin.y - 45);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.mainButtonTwo snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(self.mainButton.frame.origin.x + 20, self.mainButton.frame.origin.y - 50);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.mainButtonThree snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];
}

- (void)fanIn {
    UISnapBehavior *snapBehavior;
    snapBehavior= [[UISnapBehavior alloc] initWithItem:self.mainButtonOne snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.mainButtonTwo snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.mainButtonThree snapToPoint:self.mainButton.center];
    [self.dynamicAnimator addBehavior:snapBehavior];
}

@end
