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

-(id)initWithPosition: (CGPoint) location;

-(void)updateFence;

@end
