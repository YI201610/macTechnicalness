//
//  SKBasicsScale1Scene.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import "MTSKBasicsScale1Scene.h"

@implementation MTSKBasicsScale1Scene

+ (UIBezierPath*)bezierPathWithFrame: (CGRect)frame
{
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 36, CGRectGetMinY(frame) + 4.5)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 45.7, CGRectGetMinY(frame) + 19.68)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 62.15, CGRectGetMinY(frame) + 24.88)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 51.69, CGRectGetMinY(frame) + 39.47)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 52.16, CGRectGetMinY(frame) + 57.87)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 36, CGRectGetMinY(frame) + 51.7)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.84, CGRectGetMinY(frame) + 57.87)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 20.31, CGRectGetMinY(frame) + 39.47)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 9.85, CGRectGetMinY(frame) + 24.88)];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.3, CGRectGetMinY(frame) + 19.68)];
    [starPath closePath];
    
    return starPath;
}

+ (instancetype)unarchiveScene
{
    /*
     @comment
     */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:@"BasicsScale1"
                                                         ofType:@"sks"];
    
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    
    MTSKBasicsScale1Scene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    /*
     @comment
     */
    scene.scaleMode = SKSceneScaleModeAspectFit;
    //[scene setBackgroundColor:[UIColor blueColor]];
    
    /*
     @comment   プログラムでSpriteKitLabelを追加
     */
    SKLabelNode* skLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    skLabel.text = @"Hello, world!";
    skLabel.fontSize = 30;
    skLabel.position = CGPointMake(CGRectGetMidX(scene.frame),
                                   CGRectGetMidY(scene.frame));
    [scene addChild:skLabel];
    
    
    /*
     @comment
     */
    UIBezierPath* starPath = [MTSKBasicsScale1Scene bezierPathWithFrame:CGRectMake(150, 150, 100, 100)];
   
    SKShapeNode* line = [SKShapeNode node];
    line.path = starPath.CGPath;
    line.strokeColor = [UIColor lightGrayColor];
    line.fillColor = [SKColor orangeColor];
    line.antialiased = YES;
    line.glowWidth = 2.0;
    
    [scene addChild:line];
    
    /*
     @comment
     */
    return scene;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
#if 0
    for (UITouch *touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode* greenSprite = [SKSpriteNode node];
        greenSprite.size = CGSizeMake(100, 50);
        greenSprite.color = [UIColor greenColor];
        greenSprite.position = location;
        
        // 1秒間で反時計回りに半回転するアクションを作成
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [greenSprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:greenSprite];
    }
#endif
    
    
}

@end
