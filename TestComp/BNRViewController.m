//
//  BNRViewController.m
//  TestComp
//
//  Created by Hassan Kane on 7/8/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRViewController.h"

@interface BNRViewController ()

@property (weak, nonatomic) IBOutlet UILabel *equationLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int *score;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *option;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;

@end

@implementation BNRViewController

int timeTick = 0;
NSTimer *timer;


- (IBAction)startTime:(id)sender {
    if(!timeTick){
    timeTick = 10;
    [timer invalidate];
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
        for(UIButton *op in self.option){if(!op.enabled){[op setEnabled:YES];}}}
    
}

-(void)tick{
    if(timeTick == 0){
        [timer invalidate];
        for (UIButton *op in self.option){
            [op setEnabled:NO];
        }
        [self.startButton setHidden:YES];
        [self.restartButton setEnabled:YES];
        [self.restartButton setHidden:NO];
        [self.timeLabel setHidden:YES];
    }
    else{
        [self.restartButton setHidden:YES];
        [self.restartButton setEnabled:NO];
        timeTick-=1;
    }
    NSString *timeString = [[NSString alloc]initWithFormat:@"%d",timeTick];
    self.timeLabel.text=timeString;
}

int correctAnswer;

- (void)updateQuestion
{
    if(_difficulty ==1){
    NSArray *operationList = @[@"+", @"-", @"*"];
    int op = arc4random()%3;
    NSString *operation = operationList[op];
    NSString *question = @"";
    int operand1 = arc4random() % 20;
    int operand2 = arc4random() % 20;
    question = [question stringByAppendingFormat:@"%d %@ %d", operand1, operation, operand2];
    self.equationLabel.text = question;
    if([operation isEqualToString:@"+"]){correctAnswer = operand2+operand1;}
    else if([operation isEqualToString:@"-"]){correctAnswer=operand1-operand2;}
        else if([operation isEqualToString:@"*"]){correctAnswer=operand1*operand2;}}
    else if(_difficulty==2){
        NSArray *operationList = @[@"+", @"-", @"*"];
        int op = arc4random()%3;
        NSString *operation = operationList[op];
        int op2=arc4random()%3;
        NSString *operation2= operationList[op2];
        NSString *question = @"";
        int operand1 = arc4random() % 40;
        int operand2 = arc4random() % 40;
        int operand3 = arc4random() % 40;
        question = [question stringByAppendingFormat:@"%d %@ %d %@ %d", operand1, operation, operand2,operation2,operand3];
        self.equationLabel.text = question;
        if([operation isEqualToString:@"+"] && [operation2 isEqualToString:@"+"]){correctAnswer = operand1+operand2+operand3;}
        if([operation isEqualToString:@"+"] && [operation2 isEqualToString:@"-"]){correctAnswer = operand1+operand2-operand3;}
        if([operation isEqualToString:@"+"] && [operation2 isEqualToString:@"*"]){correctAnswer = operand1+operand2*operand3;}
        
        if([operation isEqualToString:@"*"] && [operation2 isEqualToString:@"+"]){correctAnswer = operand1*operand2+operand3;}
        if([operation isEqualToString:@"*"] && [operation2 isEqualToString:@"-"]){correctAnswer = operand1*operand2-operand3;}
        if([operation isEqualToString:@"*"] && [operation2 isEqualToString:@"*"]){correctAnswer = operand1*operand2*operand3;}
        
        if([operation isEqualToString:@"-"] && [operation2 isEqualToString:@"+"]){correctAnswer = operand1-operand2+operand3;}
        if([operation isEqualToString:@"-"] && [operation2 isEqualToString:@"-"]){correctAnswer = operand1-operand2-operand3;}
        if([operation isEqualToString:@"-"] && [operation2 isEqualToString:@"*"]){correctAnswer = operand1-operand2*operand3;}
    
        
    }
}


/*
 - (BOOL)isCorrect
 {
 int correctAnswer = (int)self.equationLabel.text;
 //UIButton *userOption = [[]];
 //if (userOption = correctAnswer){
 self.equationLabel.text = @"Correct!";
 return YES;
 //}else{
 self.equationLabel.text = @"False!";
 return NO;
 }
 
 //}
 */

/*
 - (IBAction)optionA:(UIButton *)sender {
 NSString *trueAnswer = [NSString stringWithFormat:@"%d",correctAnswer];
 NSString *buttonAnswer = [sender currentTitle];//[self.optionA titleForState:UIControlStateNormal]];
 if([trueAnswer isEqualToString:buttonAnswer]){
 self.score+=1;
 }else{
 self.score-=1;
 }
 [self updateQuestion];
 [self presentOptions];
 [self updateScoreLabel];
 }
 */
- (IBAction)restartButton:(id)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self tick];
    [self.restartButton setHidden:YES];
    [self.restartButton setEnabled:NO];
    [self tick];
    [self.restartButton setHidden:YES];
    [self.timeLabel setHidden:NO];
    [self startTime:timer];
    [self updateQuestion];
    [self presentOptions];
    for (UIButton *op in self.option){
        [op setEnabled:YES];
    }
}
- (IBAction)option:(id)sender {
    NSString *trueAnswer = [NSString stringWithFormat:@"%d",correctAnswer];
    NSString *buttonAnswer = [sender currentTitle];//[self.optionA titleForState:UIControlStateNormal]];
    if([trueAnswer isEqualToString:buttonAnswer]){self.score+=25;}
    else{self.score-=5;}
    [self updateQuestion];
    [self presentOptions];
    [self updateScoreLabel];}


- (void)updateScoreLabel{
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d",self.score]];
}

- (void)presentOptions
{
    NSMutableArray *answerOptions =[[NSMutableArray alloc]init];
    
    
    //NSNumber *correctAnswer = [NSNumber numberWithInt:(int)self.equationLabel.text];
    NSNumber *correct = [NSNumber numberWithInt:correctAnswer];
    
    if (1 < correctAnswer && correctAnswer < 10){
        NSNumber *firstAnswer = [NSNumber numberWithInt:arc4random() % 10];
        NSNumber *secondAnswer = [NSNumber numberWithInt:arc4random() % 10];
        NSNumber *thirdAnswer = [NSNumber numberWithInt:arc4random() % 10];
        [answerOptions addObject:firstAnswer];
        [answerOptions addObject:secondAnswer];
        [answerOptions addObject:thirdAnswer];
        [answerOptions addObject:correct];
        
    }else{
        NSNumber *firstAnswer = [NSNumber numberWithInt:correctAnswer + 5];
        NSNumber *secondAnswer = [NSNumber numberWithInt: correctAnswer+ (int)(arc4random()%19) ];//(int)arc4random() % correctAnswer];
        NSNumber *thirdAnswer = [NSNumber numberWithInt:correctAnswer - (int)(arc4random()%32)];//(int)arc4random() % correctAnswer]; // We create 4 answers close to the real one
        // @secondAnswer, @thirdAnswer, @correctAnswer];
        //Building an array to randomly allocate an answer to a button
        [answerOptions addObject:firstAnswer];
        [answerOptions addObject:secondAnswer];
        [answerOptions addObject:thirdAnswer];
        [answerOptions addObject:correct];
    }
    
    //[self.optionAView addSubview:self.optionA];
    
    for (NSInteger i = 0; i <= 3; i++){
        UIButton *temp = self.option[i];
        int randomIndex = arc4random() % (4-i);
        NSString *title = [NSString stringWithFormat:@"%@", answerOptions[randomIndex]];
        [temp setTitle:title forState:UIControlStateNormal];
        //int *tempvalue = [answerOptions objectAtIndex:randomIndex];
        //[temp setTitle:[NSString stringWithFormat:@"%d",tempvalue];
        //temp.titleLabel.text = answerOptions[randomIndex];
        [answerOptions removeObjectAtIndex:randomIndex];
    }
    //NSArray *answerButtons = [opA, opB, opC, opD];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.restartButton setHidden:YES];
    //self.scoreLabel.text = 0.0;
    if (self.equationLabel){
        [self updateQuestion]; // Change the text of the label
        // Do any additional setup after loading the view, typically from a nib.
        [self.scoreLabel setText:@""];
        [self presentOptions];}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

/*
 if (1 < correctAnswer && correctAnswer < 10){
 int firstAnswer = arc4random() % 10;
 int secondAnswer = arc4random() % 10;
 int thirdAnswer = arc4random() % 10;
 int randomIndex = arc4random() % (4-i);
 */
//UIButton *temp = [options objectAtIndex:i];

