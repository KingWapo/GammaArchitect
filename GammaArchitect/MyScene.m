//
//  MyScene.m
//  GammaArchitect
//
//  Created by Holcombe on 3/25/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import "MyScene.h"
#import "NuclearReactor.h"

@interface MyScene ()

@property NSMutableArray *baseTiles;
@property NSMutableArray *reactors;

@property CGFloat screenWidth;
@property CGFloat screenHeight;

// Balancing variables
@property CGFloat money;
@property CGFloat power;
@property CGFloat cost;
@property CGFloat powerToMoneyModifier;

// Bool to determine if menu on touch,
// it should create the menu or select
// from the menu.
@property BOOL menuVisible;
@property SKLabelNode *nuclearReactorMenu;
@property SKNode *nuclearReactorButton;


@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        self.screenHeight =  [UIScreen mainScreen].bounds.size.height;
        self.screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        // Initialize balancing variables
        self.money = 0;
        self.power = 0;
        self.cost = 0;
        self.powerToMoneyModifier = 0.75; // How much money do you get for the amount of power
        
        
        self.baseTiles = [[NSMutableArray alloc]init];
        self.reactors = [[NSMutableArray alloc]init];
        
        SKTexture *grassTexture = [SKTexture textureWithImageNamed:@"grassTile"];
        
        for (int row = 0; row * 64 < self.screenHeight; row++) {
            for (int col = 0; col * 64 < self.screenWidth; col++) {
                SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:grassTexture];
                sprite.position = CGPointMake(col * 64 + 32, row * 64 + 32);
                sprite.paused = YES;
                sprite.zPosition = -1.0;
                [self addChild:sprite];
                [self.baseTiles addObject:sprite];
            }
        }
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if (!self.menuVisible)
        {
            [self addChild:[self reactorNodeAt:location]];
            self.menuVisible = YES;
        }
        else
        {
            SKNode *node = [self nodeAtPoint:location];
            if ([node.name isEqualToString:@"reactorButton"]) {
                NuclearReactor *reactor = [[NuclearReactor alloc]initWithPosition:location];
                [self.reactors addObject:reactor];
                [self addChild:reactor.reactor];
                [node removeFromParent];
                self.menuVisible = NO;
            }
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

//Reactor button is dynamically added
- (SKSpriteNode *)reactorNodeAt:(CGPoint)location
{
    SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed:@"standard-button-off.png"];
    node.position = location;
    node.name = @"reactorButton";//how the node is identified later
    node.zPosition = 1.0;
    return node;
}

@end
