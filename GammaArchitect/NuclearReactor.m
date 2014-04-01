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

@end

@implementation NuclearReactor

- (id)init
{
    self = [super init];
    if (self) {
        self.reactor = [SKSpriteNode spriteNodeWithImageNamed:@"nuclearReactor"];
        self.level = 1;
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

@end
