//
//  MyScene.m
//  GammaArchitect
//
//  Created by Holcombe on 3/25/14.
//  Copyright (c) 2014 Holcombe. All rights reserved.
//

#import "MyScene.h"
#import "NuclearReactor.h"
#import "GeigerCounter.h"

@interface MyScene ()

@property NSMutableArray *baseTiles;
@property NSMutableArray *reactors;
@property NSMutableArray *geigers;

@property CGFloat screenWidth;
@property CGFloat screenHeight;

// Balancing variables
@property CGFloat money;
@property CGFloat power;
@property CGFloat cost;
@property CGFloat powerToMoneyModifier;

// Prices of the objects
@property CGFloat nuclearReactorPrice;
@property CGFloat geigerCounterPrice;

// Bool to determine if menu on touch,
// it should create the menu or select
// from the menu.
@property BOOL menuVisible;
@property BOOL upgradeMenuVisible;
@property SKLabelNode *nuclearReactorMenu;
@property SKNode *nuclearReactorButton;

@property SKNode *menu;
@property SKNode *upgradeMenu;

@property SKNode *clickedReactor;


@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:1 blue:0.3 alpha:1.0];
        self.screenHeight =  [UIScreen mainScreen].bounds.size.height;
        self.screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        // Initialize balancing variables
        self.money = 100000;
        self.power = 0;
        self.cost = 0;
        self.powerToMoneyModifier = 0.75; // How much money do you get for the amount of power
        
        // Initialize the prices
        self.nuclearReactorPrice = 70000;
        self.geigerCounterPrice = 10000;
        
        
        //self.baseTiles = [[NSMutableArray alloc]init];
        self.reactors = [[NSMutableArray alloc]init];
        self.geigers = [[NSMutableArray alloc]init];
        
        // Set up UI
        SKSpriteNode *background = [[SKSpriteNode alloc]initWithImageNamed:@"backgroundTemp"];
        background.anchorPoint = CGPointMake(0, 0);
        background.position = CGPointMake(0, self.screenHeight - 362); // Add on a y of the screen height -
                                                                       // the image height
        [self addChild:background];
        
        SKSpriteNode *ui = [[SKSpriteNode alloc]initWithImageNamed:@"bottomUI"];
        ui.anchorPoint = CGPointMake(0, 0);
        ui.position = CGPointMake(-10, 0);
        [self addChild:ui];
        
        SKSpriteNode *score = [[SKSpriteNode alloc]initWithImageNamed:@"score"];
        score.anchorPoint = CGPointMake(0, 0);
        score.position = CGPointMake(185, 85);
        [self addChild:score];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKNode *node = [self nodeAtPoint:location];
        
        if (!self.menuVisible && !self.upgradeMenuVisible)
        {
            if ([node.name isEqualToString:@"reactor"])
            {
                self.clickedReactor = node;
                self.upgradeMenu =[self upgradeMenuNodeAt:location];
                [self addChild:self.upgradeMenu];
                self.upgradeMenuVisible = YES;
            }
            else
            {
                self.menu = [self reactorMenuNodeAt:location];
                [self addChild:self.menu];
                self.menuVisible = YES;
            }
        }
        else
        {
            if ([node.name isEqualToString:@"reactorButton"] &&
                self.money > self.nuclearReactorPrice) {
                NuclearReactor *reactor = [[NuclearReactor alloc]initWithPosition:location];
                reactor.reactor.name = @"reactor";
                [self.reactors addObject:reactor];
                [self addChild:reactor.reactor];
                [node removeFromParent];
                self.money -= self.nuclearReactorPrice;
                self.menuVisible = NO;
            }
            else if ([node.name isEqualToString:@"geigerButton"] &&
                self.money > self.geigerCounterPrice) {
                GeigerCounter *geiger = [[GeigerCounter alloc] initWithReactor:self.clickedReactor];
                geiger.geiger.name = @"geiger";
                [self.geigers addObject:geiger];
                [self addChild:geiger.geiger];
                [node removeFromParent];
                self.money -= self.geigerCounterPrice;
                self.upgradeMenuVisible = NO;
            }
            else
            {
                [self.menu removeFromParent];
                [self.upgradeMenu removeFromParent];
                self.menuVisible = NO;
                self.upgradeMenuVisible = NO;
            }
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    for (NuclearReactor *reactor in self.reactors) {
        self.power += [reactor updateReactor];
    }
    
    for (GeigerCounter *geiger in self.geigers) {
        if ([geiger updateGeiger])
        {
            // update display to show radiation levels.
            NSLog(@"Rad Levels: %f", self.power);
        }
    }
    
    self.money += self.power * self.powerToMoneyModifier;
    
    NSLog(@"Money: %f", self.money);
}

//Reactor button is dynamically added
- (SKSpriteNode *)reactorMenuNodeAt:(CGPoint)location
{
    SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed:@"standard-button-off.png"];
    node.position = location;
    node.name = @"reactorButton";//how the node is identified later
    node.zPosition = 1.0;
    return node;
}

// Upgrade menu dynamically added
- (SKNode *)upgradeMenuNodeAt:(CGPoint)location
{
    SKNode *menu = [[SKNode alloc]init];
    // Geiger counter purchase
    SKSpriteNode *geiger = [SKSpriteNode spriteNodeWithImageNamed:@"square-button-off.png"];
    geiger.position = location;
    geiger.name = @"geigerButton";//how the node is identified later
    geiger.zPosition = 1.0;
    
    
    [menu addChild:geiger];
    return menu;
}

@end
