//
//  BNRCalculatorViewController.m
//  TestComp
//
//  Created by Hassan Kane on 7/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRCalculatorViewController.h"
#import "CalculatorBrain.h"
#import "BNRWelcomeViewController.h"

@interface BNRCalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;


@end

@implementation BNRCalculatorViewController

@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

// refer to 70 -79 if you have a mistake

- (void)viewDidLoad
{
    BNRWelcomeViewController *welcome = [[BNRWelcomeViewController alloc]init];
    UINavigationController *computititonNavigation = [[UINavigationController alloc]initWithRootViewController: welcome];
    
}

- (CalculatorBrain *)brain {
    if (!_brain)_brain = [[CalculatorBrain alloc]init];
        return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
    
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    
}

- (IBAction)operationPressed:(UIButton *)sender {
    
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
        
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
    
}
@end
