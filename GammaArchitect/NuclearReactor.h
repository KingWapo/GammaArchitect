//
//  NuclearReactor.h
//  GammaArchitect
//
//  Created by Holcombe on 3/26/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface NuclearReactor : NSObject

@property SKSpriteNode *reactor;

@property CGFloat price;

-(id)initWithPosition: (CGPoint) location;

-(CGFloat)updateReactor;

@end
