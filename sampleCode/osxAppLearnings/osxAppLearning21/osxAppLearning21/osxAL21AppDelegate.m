//
//  AppDelegate.m
//  osxAppLearning21
//
//  Created by Yuji Imamura on 2014/09/23.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "osxAL21AppDelegate.h"
#import "CommonHeader.h"
#import "osxAL21SingleItem.h"


@interface osxAL21AppDelegate () {
    
    NSMutableArray* contentArray__;     //data source
    NSInteger prevItemIndexValue__;     //
    
}

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSCollectionView *collectionView;

@end

@implementation osxAL21AppDelegate

static NSString* gKeyPath = @"_collectionView.selectionIndexes";

- (instancetype)init
{
    self = [super init];
    if (self) {
        /*
         @comment
         */
        contentArray__ = [NSMutableArray new];
        
        /*
         @comment
         */
        [contentArray__ addObject:[self dictionaryWithName:@"user1" contactInfo:@"連絡先1"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user2" contactInfo:@"連絡先2"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user3" contactInfo:@"連絡先3"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user4" contactInfo:@"連絡先4"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user5" contactInfo:@"連絡先5"]];
        
        [contentArray__ addObject:[self dictionaryWithName:@"user11" contactInfo:@"連絡先1"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user12" contactInfo:@"連絡先2"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user13" contactInfo:@"連絡先3"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user14" contactInfo:@"連絡先4"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user15" contactInfo:@"連絡先5"]];
        
        [contentArray__ addObject:[self dictionaryWithName:@"user21" contactInfo:@"連絡先1"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user22" contactInfo:@"連絡先2"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user23" contactInfo:@"連絡先3"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user24" contactInfo:@"連絡先4"]];
        [contentArray__ addObject:[self dictionaryWithName:@"user25" contactInfo:@"連絡先5"]];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

/*!
 @abstract  main windowのawakeFromNib
 */
- (void)awakeFromNib
{
    _methodname_;
    
    /*
     @comment   collection viewのデータソースを指定する
     */
    _collectionView.content = contentArray__;
    
    /*
     @comment   collection view itemのprototypeを設定する
     */
    _collectionView.itemPrototype = [osxAL21SingleItem new];
    
    /*
     @comment   Key Value Observerを設定する
     */
    [self addObserver:self
           forKeyPath:gKeyPath   //監視するキーパス
              options:NSKeyValueObservingOptionNew
              context:NULL];
    
    /*
     @comment
     */
    prevItemIndexValue__ = -1;
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}


#pragma mark - KVO

/*!
 @abstract
 */
- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary *)change
                        context:(void *)context
{
    _methodname_;
    debugout(@"* keyPath: %@", keyPath);
    
    if([keyPath isEqualToString:gKeyPath]){
        debugout(@"* selectionIndexes: %@", self.collectionView.selectionIndexes);

        /*
         @comment
         */
        if(prevItemIndexValue__ != -1){
            
            /*
             @comment   前回選択された、collection view itemのアドレスを取得する
             */
            osxAL21SingleItem* prevItem = (osxAL21SingleItem*)[_collectionView itemAtIndex:prevItemIndexValue__];

            /*
             @comment   前回選択された、collection view itemの色をwhite colorに変更する
             */
            prevItem.box.fillColor = [NSColor whiteColor];
        }
        
        
        /*
         @comment
         */
        if([_collectionView.selectionIndexes count] > 0){
            NSInteger selectedItemIndex = _collectionView.selectionIndexes.firstIndex;
            osxAL21SingleItem* selectedItem = (osxAL21SingleItem*)[_collectionView itemAtIndex:selectedItemIndex];
            selectedItem.box.fillColor = [NSColor orangeColor];
            
            prevItemIndexValue__ = selectedItemIndex;
        }
    }
    
}


#pragma mark - Private

- (NSDictionary*)dictionaryWithName:(NSString*)nameString contactInfo:(NSString*)contactInfoString
{
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:nameString, @"Name",
                          contactInfoString, @"ContactInfo", nil];
    
    return dict;
}


#pragma mark - Public


/*!
 @abstract  アイテム追加ボタン
 */
- (IBAction)didSelectAddItemButton:(NSButton *)sender {
    _methodname_;
    
    /*
     @comment   データソースに、新しいレコードを、追加する。
     */
    [contentArray__ addObject:[self dictionaryWithName:@"ボタンで追加" contactInfo:@"ボタンで追加する情報"]];

    /*
     @comment   collection viewのコンテンツを更新する。
     */
    _collectionView.content = contentArray__;
}


/*!
 @abstract  アイテム削除ボタン
 */
- (IBAction)didSelectRemoveItemButton:(NSButton *)sender {
    _methodname_;
    
    /*
     @comment   選択されいてるcollection view itemのインデックスを取得する
     */
    NSInteger selectionIndex = _collectionView.selectionIndexes.firstIndex;
    [contentArray__ removeObjectAtIndex:selectionIndex];
    
    /*
     @comment   collection viewのデータソースを更新する。
     */
    _collectionView.content = contentArray__;

    /*
     @comment   選択されているIndex配列をクリアする。
     */
    _collectionView.selectionIndexes = nil;
    
    
    /*
     @comment
     */
    prevItemIndexValue__ = -1;
}



@end
