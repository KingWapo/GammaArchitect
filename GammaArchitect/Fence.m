//
//  Fence.m
//  GammaArchitect
//
//  Created by Holcombe on 4/13/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import "Fence.h"

@interface Fence()

@property NSDate *previousUpdateTime;

@property CGFloat durability;

@end

@implementation Fence

- (id)init
{
    self = [super init];
    if (self) {
        self.fence = [[SKSpriteNode alloc]initWithImageNamed:@"bushfence.png"];
        self.durability = 100;
        self.radDampening = 100;
        self.previousUpdateTime = [NSDate date];
    }
    return self;
}

-(id)initWithPosition:(CGPoint)location
{
    self = [self init];
    if (self) {
        self.fence.position = location;
    }
    return self;
}

-(id)initWithReactor:(SKNode *)reactor
{
    self = [self initWithPosition:reactor.position];
    if (self) {
        
    }
    return self;
}
-(BOOL)updateFence
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
