//
//  BNRWelcomeViewController.m
//  TestComp
//
//  Created by Hassan Kane on 7/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRWelcomeViewController.h"
#import "BNRViewController.h"
#import "BNRCalculatorViewController.h"

@interface BNRWelcomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *easyDifficulty;

@end

@implementation BNRWelcomeViewController

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
    
    // Do any additional setup after loading the view from its nib.
  
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)easyDifficulty:(id)sender {
    BNRViewController *computitionViewController = [[BNRViewController alloc]init];
    NSBundle *appBundle = [NSBundle mainBundle];
    //BNRCalculatorViewController *calculatorViewController = [[BNRCalculatorViewController alloc]initWithNibName:@"BNRCalculatorViewController" bundle:appBundle];
    BNRCalculatorViewController *calc = [[BNRCalculatorViewController alloc] initWithNibName:@"BNRCalculatorViewController"
                                                                                      bundle:appBundle];
    //BNRViewController *c = [[BNRViewController alloc]init];
    //UITabBarController *tab = [[UITabBarController alloc]init];
    //tab.viewControllers= @[computitionViewController,calc];
    computitionViewController.difficulty=1;
    
    [self.navigationController pushViewController:computitionViewController animated:YES];
                        
    
}
- (IBAction)mediumDifficulty:(id)sender {
    BNRViewController *computitionViewController = [[BNRViewController alloc]init];
    NSBundle *appBundle = [NSBundle mainBundle];
    //BNRCalculatorViewController *calculatorViewController = [[BNRCalculatorViewController alloc]initWithNibName:@"BNRCalculatorViewController" bundle:appBundle];
    BNRCalculatorViewController *calc = [[BNRCalculatorViewController alloc] initWithNibName:@"BNRCalculatorViewController"
                                                                                      bundle:appBundle];
    //BNRViewController *c = [[BNRViewController alloc]init];
    //UITabBarController *tab = [[UITabBarController alloc]init];
    //tab.viewControllers= @[computitionViewController,calc];
    computitionViewController.difficulty=2;
    [self.navigationController pushViewController:computitionViewController animated:YES];}


@end
