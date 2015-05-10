//
//  MTSKBasicTransition1Scene.m
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/05/10.
//
//

#import "MTSKBasicTransition1Scene.h"
#import "CommonHeader.h"

@implementation MTSKBasicTransition1Scene

+ (instancetype)unarchiveScene
{
    /*
     @comment
     */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:@"Transition1"
                                                         ofType:@"sks"];
    
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    
    MTSKBasicTransition1Scene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    scene.scaleMode = SKSceneScaleModeAspectFit;

    return scene;
}

- (void)dealloc
{
    _methodname_;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
