//
//  PWConfettiView.m
//  PWConfetti
//
//  Created by Pat Walsh on 7/27/17.
//  Copyright © 2017 Pat Walsh. All rights reserved.
//

#import "PWConfettiView.h"
#import <QuartzCore/QuartzCore.h>

@interface PWConfettiView ()

@property (nonatomic) BOOL active;
@property (strong, nonatomic) CAEmitterLayer *emitter;

@end

@implementation PWConfettiView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self setup];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

- (void)setup
{
    //self.backgroundColor = [UIColor clearColor];
    self.colors = @[[UIColor colorWithRed:0.95 green:0.40 blue:0.27 alpha:1.0],
                    [UIColor colorWithRed:1.00 green:0.78 blue:0.36 alpha:1.0],
                    [UIColor colorWithRed:0.48 green:0.78 blue:0.64 alpha:1.0],
                    [UIColor colorWithRed:0.30 green:0.76 blue:0.85 alpha:1.0],
                    [UIColor colorWithRed:0.58 green:0.39 blue:0.55 alpha:1.0]];
    self.confettiIntensity = 0.5;
    self.type = Confetti;
    self.active = NO;
}

- (void)startConfetti
{
    self.emitter = [[CAEmitterLayer alloc] init];
    self.emitter.emitterPosition = CGPointMake(self.frame.size.width / 2.0, 0);
    self.emitter.emitterShape = kCAEmitterLayerLine;
    self.emitter.emitterSize = CGSizeMake(self.frame.size.width, 1);
    
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    for (UIColor *color in self.colors)
    {
        CAEmitterCell *cell = [self confettiWithColor:color];
        [cells addObject:cell];
    }
    
    self.emitter.emitterCells = cells;
    
    [self.layer addSublayer:self.emitter];
    self.active = YES;
}

- (void)stopConfetti
{
    self.emitter.birthRate = 0;
    self.active = NO;
}

- (CAEmitterCell *)confettiWithColor:(UIColor *)color
{
    CAEmitterCell *confetti = [[CAEmitterCell alloc] init];
    confetti.birthRate = 6.0 * self.confettiIntensity;
    confetti.lifetime = 14.0 * self.confettiIntensity;
    confetti.lifetimeRange = 0;
    confetti.color = color.CGColor;
    confetti.velocity = (CGFloat)(350.0 * self.confettiIntensity);
    confetti.velocityRange = (CGFloat)(80.0 * self.confettiIntensity);
    confetti.emissionLongitude = (CGFloat)(M_PI);
    confetti.emissionRange = (CGFloat)(M_PI_4);
    confetti.spin = (CGFloat)(3.5 * self.confettiIntensity);
    confetti.spinRange = (CGFloat)(4.0 * self.confettiIntensity);
    confetti.scaleRange = (CGFloat)(self.confettiIntensity);
    confetti.scaleSpeed = (CGFloat)(-0.1 * self.confettiIntensity);
    confetti.contents = (__bridge id _Nullable)([self imageForType:self.type].CGImage);
    return confetti;
    
}

- (UIImage *)imageForType:(ConfettiType)imageType
{
    NSString *fileName = @"";
    
    switch(imageType) {
        case Confetti:
            fileName = @"confetti";
            break;
        case Triangle:
            fileName = @"triangle";
            break;
        case Star:
            fileName = @"star";
            break;
        case Diamond:
            fileName = @"diamond";
            break;
        case CustomImage:
            fileName = @"customImage";
            break;
    }
    
    UIImage *image = [UIImage imageNamed:fileName];
    
    return image;
}

- (BOOL)confettiIsActive
{
    return self.active;
}

@end
