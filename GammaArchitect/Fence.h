//
//  Fence.h
//  GammaArchitect
//
//  Created by Holcombe on 4/13/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Fence : NSObject

@property SKSpriteNode *fence;

@property CGFloat radDampening;

@property CGFloat deterioration;

-(id)initWithPosition: (CGPoint) location;

-(id)initWithReactor: (SKNode *) reactor;

-(void)updateFence;

@end
