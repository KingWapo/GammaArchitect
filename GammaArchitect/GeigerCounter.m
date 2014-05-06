//
//  GeigerCounter.m
//  GammaArchitect
//
//  Created by Holcombe on 4/13/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import "GeigerCounter.h"

@interface GeigerCounter()

@property int level;

@property NSDate *previousUpdateTime;

@property CGFloat updateValue;

@end

@implementation GeigerCounter

- (id)init
{
    self = [super init];
    if (self) {
        //self.geiger = [SKSpriteNode spriteNodeWithImageNamed:@"geigerCounter.jpeg"];
        self.price = 10000;
        self.level = 1;
        self.previousUpdateTime = [NSDate date];
        self.updateValue = 5;
    }
    return self;
}

-(id)initWithPosition:(CGPoint)location
{
    self = [self init];
    if (self)
    {
        self.geiger.position = location;
    }
    return self;
}

-(id)initWithReactor:(SKNode *)reactor
{
    CGPoint location = reactor.position;
    location.x -= 32;
    location.y -= 32;
    self = [self initWithPosition:location];
    return self;
}

-(BOOL)updateGeiger
{
    NSDate *currentDate = [NSDate date];
    
    NSTimeInterval passedTime = [currentDate timeIntervalSinceDate:self.previousUpdateTime];
    
    if (passedTime > 10)
    {
        self.previousUpdateTime = currentDate;
        return YES;
    }
    return NO;
}

@end
