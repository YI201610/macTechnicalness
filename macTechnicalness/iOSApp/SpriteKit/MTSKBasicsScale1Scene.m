//
//  SKBasicsScale1Scene.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import "MTSKBasicsScale1Scene.h"
#import "CommonHeader.h"

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

- (void)dealloc
{
    _methodname_;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        
        /*
         @comment   タッチ座標を取得
         */
        CGPoint location = [touch locationInNode:self];
        
        /*
         @comment   グリーンの長方形スプライトを作成
         */
        SKSpriteNode* greenSprite = [SKSpriteNode node];
        greenSprite.size = CGSizeMake(100, 50);
        greenSprite.color = [UIColor greenColor];
        greenSprite.position = location;
        
        /*
         @comment   １秒かけて、３回転しながら、中央に移動するアクションを作成
         */
        SKAction *actionRotate = [SKAction rotateByAngle:M_PI*6 duration:1];
        SKAction *actionMove = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
                                       duration:1];
        SKAction *spinMove = [SKAction group:@[actionMove, actionRotate]];
        
        __weak typeof(self) weakSelf = self;
        
        /*
         @comment   終了時のアクションを作成
         */
        SKAction *endAction = [SKAction runBlock:^{
            
            /*
             @comment   パーティクルを読み込む
             */
            NSString *sparclePath = [[NSBundle mainBundle] pathForResource:@"Spark" ofType:@"sks"];
            SKEmitterNode *sparcle = [NSKeyedUnarchiver unarchiveObjectWithFile:sparclePath];
            sparcle.position = greenSprite.position;

            /*
             @comment   シーンにパーティクルを設定
             */
            [weakSelf addChild:sparcle];

            /*
             @comment   フェードアウトするアクションを作成
             */
            SKAction *fadeOut = [SKAction fadeOutWithDuration:0.75];
            SKAction *remove = [SKAction removeFromParent];
            SKAction *fadeAndRemove = [SKAction sequence:@[fadeOut, remove]];
            
            /*
             @comment   パーティクルと、スプライトに、fade-outアクションを適用
             */
            [sparcle runAction:fadeAndRemove];

            [greenSprite runAction:fadeAndRemove];
        }];

        /*
         @comment   複合アクションを作成
         */
        SKAction *sequence = [SKAction sequence:@[spinMove, endAction]];
        
        /*
         @comment   複合アクションを、スプライトに適用
         */
        [greenSprite runAction:sequence];

        /*
         @comment   スプライトを画面に追加
         */
        [self addChild:greenSprite];
    }
    
    
}

@end
