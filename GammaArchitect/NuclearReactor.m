//
//  NuclearReactor.m
//  GammaArchitect
//
//  Created by Holcombe on 3/26/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import "NuclearReactor.h"


// Private variables
@interface NuclearReactor()

@property int level;

@property NSDate *previousUpdateTime;

@property CGFloat updateValue;

@end

@implementation NuclearReactor

- (id)init
{
    self = [super init];
    if (self) {
        self.reactor = [SKSpriteNode spriteNodeWithImageNamed:@"nuclearReactor"];
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
        self.reactor.position = location;
    }
    return self;
}

-(CGFloat)updateReactor
{
    NSDate *currentDate = [NSDate date];
    
    NSTimeInterval passedTime = [currentDate timeIntervalSinceDate:self.previousUpdateTime];
    
    self.previousUpdateTime = currentDate;
    return self.updateValue * self.level * passedTime;
}

@end
