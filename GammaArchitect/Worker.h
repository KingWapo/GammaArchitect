//
//  Worker.h
//  GammaArchitect
//
//  Created by Holcombe on 4/13/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Worker : NSObject

@property SKSpriteNode *worker;

-(id)initWithPosition: (CGPoint) location;

-(void)updateWorker;

@end
