//
//  GeigerCounter.h
//  GammaArchitect
//
//  Created by Holcombe on 4/13/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GeigerCounter : NSObject

@property SKSpriteNode *geiger;

@property CGFloat price;

-(id)initWithPosition: (CGPoint) location;

-(id)initWithReactor: (SKNode *) reactor;

-(BOOL)updateGeiger;

@end
