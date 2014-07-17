//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Felipe Sinisterra on 7/8/14.
//  Copyright (c) 2014 Felipe Sinisterra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;


@end
