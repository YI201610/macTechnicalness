//
//  osxAL21SingleItem.h
//  osxAppLearning21
//
//  Created by Yuji Imamura on 2014/09/30.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface osxAL21SingleItem : NSCollectionViewItem

@property (weak) IBOutlet NSBox *box;
@property (weak) IBOutlet NSTextField *lblNameLabel;
@property (weak) IBOutlet NSTextField *lblContactInfoLabel;


@end
