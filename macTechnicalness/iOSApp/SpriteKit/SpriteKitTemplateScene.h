//
//  SpriteKitTemplateScene.h
//  macTechnicalness
//
//  Created by Yuji Imamura on 2015/04/21.
//
//

#import <SpriteKit/SpriteKit.h>

@interface SpriteKitTemplateScene : SKScene

/*!
 @abstract  パーティクルテンプレートファイルの名称
 */
@property (nonatomic, copy) NSString* particleNameString;

/*!
 @abstract  0: 中央, 1: Top
 */
@property NSInteger positionTypeValue;

/*!
 @abstract
 */
+ (instancetype)unarchiveWithParticleName:(NSString *)particleName;

@end
