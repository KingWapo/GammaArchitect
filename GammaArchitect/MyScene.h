//
//  MyScene.h
//  GammaArchitect
//

//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MyScene : SKScene

@property CGFloat reactorToPowerUpdate;

- (SKSpriteNode *)reactorMenuNodeAt: (CGPoint)location;
- (SKNode *)upgradeMenuNodeAt: (CGPoint)location;

-(void) updateNeedle;

@end
