//
//  SpriteKitTemplateScene.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/21.
//
//

#import "SpriteKitTemplateScene.h"
#import "CommonHeader.h"

@implementation SpriteKitTemplateScene

+ (instancetype)unarchiveWithParticleName:(NSString *)particleName
{
    /*
     @comment
     */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:@"SpriteKitTemplateScene"
                                                         ofType:@"sks"];
    
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
   
    SpriteKitTemplateScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];

    /*
     @comment
     */
    scene.particleNameString = particleName;

    return scene;
}

/*!
 @abstract  SKSceneが表示された直後に、システムが実行する。
 */
-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    _methodname_;
    
    if([_particleNameString length] > 0){
        /*
         @comment
         */
        NSString* emitterPathString = [[NSBundle mainBundle] pathForResource:_particleNameString ofType:@"sks"];
        SKEmitterNode* emitterNode = [NSKeyedUnarchiver unarchiveObjectWithFile:emitterPathString];
        
        CGFloat offsetY = CGRectGetMidY(self.frame);
        if(_positionTypeValue > 0){
            offsetY = CGRectGetMaxY(self.frame);
        }
        CGPoint emitterPoint = CGPointMake(CGRectGetMidX(self.frame), offsetY);
        emitterNode.position = emitterPoint;
        [self addChild:emitterNode];
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    _methodname_;
    
//    /*
//     @comment   タッチされた数だけ繰り返す
//     */
//    for (UITouch *touch in touches) {
//        
//        /*
//         @comment   ノード内におけるタッチ座標を取得
//         */
//        //CGPoint location = [touch locationInNode:self];
//    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
