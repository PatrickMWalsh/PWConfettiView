//
//  PWConfettiView.h
//  PWConfetti
//
//  Created by Pat Walsh on 7/27/17.
//  Copyright © 2017 Pat Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PWConfettiView : UIView

typedef enum {
    Confetti,
    Triangle,
    Star,
    Diamond,
    CustomImage
    
} ConfettiType;

@property (nonatomic) float confettiIntensity;
@property (nonatomic) ConfettiType type;
@property (strong, nonatomic) NSArray *colors;
@property (strong, nonatomic) UIImage *customImage;


- (void)startConfetti;
- (void)stopConfetti;

- (BOOL)confettiIsActive;

@end
