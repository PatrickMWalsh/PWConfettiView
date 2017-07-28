//
//  ViewController.m
//  PWConfetti
//
//  Created by Pat Walsh on 7/27/17.
//  Copyright © 2017 Pat Walsh. All rights reserved.
//

#import "ViewController.h"
#import "PWConfettiView.h"

@interface ViewController ()

@property (strong, nonatomic) PWConfettiView *confettiView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.confettiView = [[PWConfettiView alloc] initWithFrame:self.view.frame];
    //[self.view addSubview:self.confettiView];
    //[self.confettiView startConfetti];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    

        [self.view addSubview:self.confettiView];
        [self.confettiView startConfetti];

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Yolo"
                                                                   message:@"Hobo"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *endConfetti = [UIAlertAction actionWithTitle:@"End Confetti"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            [self.confettiView removeFromSuperview];
                                                            [self.confettiView stopConfetti];
                                                            
//                                                            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3.5
//                                                                                                              target:self
//                                                                                                            selector:@selector(removeConfettiFromView) userInfo:nil
//                                                                                                             repeats:NO];
//                                                            
//                                                            //[self.confettiView removeFromSuperview];
                                                            [self dismissViewControllerAnimated:alert completion:nil];
                                                        }];
    [alert addAction:endConfetti];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (void)removeConfettiFromView
{
    [self.confettiView removeFromSuperview];
}

@end
