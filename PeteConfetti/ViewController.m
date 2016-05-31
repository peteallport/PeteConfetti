//
//  ViewController.m
//  PeteConfetti
//
//  Created by Pete Allport on 5/30/16.
//  Copyright © 2016 Pete Allport. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // How many pieces to generate
    int confettiCount = 200;
    
    // What colors should the pieces be?
    NSArray *confettiColors = @[[UIColor redColor], [UIColor greenColor], [UIColor yellowColor], [UIColor blueColor]];
    
    
    // Everything else that you can configure
    int screenWidth = self.view.frame.size.width;
    int screenHeight = self.view.frame.size.height;
    int randomStartPoint;
    int randomStartConfettiLength;
    int randomEndConfettiLength;
    int randomEndPoint;
    int randomDelayTime;
    int randomFallTime;
    int randomRotation;
    
    for (int i = 0; i < confettiCount; i++){
        randomStartPoint = arc4random_uniform(screenWidth);
        randomEndPoint = arc4random_uniform(screenWidth);
        randomDelayTime = arc4random_uniform(100);
        randomFallTime = arc4random_uniform(3);
        randomRotation = arc4random_uniform(360);
        randomStartConfettiLength = arc4random_uniform(15);
        randomEndConfettiLength = arc4random_uniform(15);
        NSUInteger randomColor = arc4random() % [confettiColors count];
        
        UIView *confetti=[[UIView alloc]initWithFrame:CGRectMake(randomStartPoint, -10, randomStartConfettiLength, 8)];
        [confetti setBackgroundColor:confettiColors[randomColor]];
        confetti.alpha = .4;
        [self.view addSubview:confetti];
        
        [UIView animateWithDuration:randomFallTime+5 delay:randomDelayTime*.1 options:UIViewAnimationOptionRepeat animations:^{
                [confetti setFrame:CGRectMake(randomEndPoint, screenHeight+30, randomEndConfettiLength, 8)];
                confetti.transform = CGAffineTransformMakeRotation(randomRotation);
        } completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
