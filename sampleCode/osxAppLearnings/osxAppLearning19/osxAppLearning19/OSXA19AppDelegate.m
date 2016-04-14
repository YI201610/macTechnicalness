//
//  AppDelegate.m
//  osxAppLearning19
//
//  Created by Yuji Imamura on 2014/08/24.
//  Copyright (c) 2014年 Yuji Imamura. All rights reserved.
//

#import "OSXA19AppDelegate.h"
#import "CommonHeader.h"

@interface OSXA19AppDelegate ()

/*!
 @abstract  Main Window
 */
@property (weak) IBOutlet NSWindow *window;

/*!
 @abstract  PopOverのテキストフィールド
 */
@property (weak) IBOutlet NSTextField *popoverTextField;

/*!
 @abstract  popoverオブジェクト　※view controllerは省略
 */
@property (weak) IBOutlet NSPopover *popoverObj;

@end

@implementation OSXA19AppDelegate
            
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

/*!
 @abstract terminate application when the red button selected.
 */
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    _methodname_;
    
    return YES;
}

- (void)dealloc
{
    _methodname_;
}

#pragma mark - OnButton method

/*!
 @abstract  サブウィンドウを表示する。
 */
- (IBAction)onButtonShowWindow2:(id)sender {
    _methodname_;
    
    //セカンドウィンドウオブジェクトを、xibから生成する。
    if(_secondWindowController == nil){
        _secondWindowController = [[OSXA19SecondWindowController alloc] initWithWindowNibName:@"OSXA19SecondWindowController"];
    }
    
    //セカンドウィンドウを表示する。
    [_secondWindowController showWindow:nil];
}

/*!
 @abstract
 */
- (IBAction)onButtonShowPopover:(NSButton *)sender {
    _methodname_;
    
    _popoverTextField.stringValue = @"こんにちは、ぽっぷおーばー。";
    
    [_popoverObj showRelativeToRect:sender.bounds   //senderのboudsを渡す
                             ofView:sender          //popoverの位置の元
                      preferredEdge:NSMaxXEdge];    //指定したオブジェクトを基準としたpopoverの表示位置
}


#pragma mark - NSPopoverDelegate


/*!
 * The popover invokes this method on its delegate whenever it is about to close to give the delegate a chance to veto the close.
 * If the delegate does not implement this method, \c -popoverShouldClose: will also be invoked on the popover to allow the popover to veto the close.
 * \return Return YES if the popover should close, NO otherwise.
 */
- (BOOL)popoverShouldClose:(NSPopover *)popover
{
    _methodname_;
    
    return YES;
}

/*!
 * Return \c YES to allow the popover to detach from its positioning view. Return \c NO if it should not. If this method is not implemented, the default behavior is \c NO.
 * If this method returns YES, and \c -detachableWindowForPopover: is not implemented or returns nil, a detachable window will be created with the popover’s \c contentViewController.
 * This implicit detached window will have the same appearance as the popover. If the \c contentViewController has a title, it will be bound to and displayed as the title of the detached window. Upon detaching, the popover will not send a PopoverWill/DidClose notification or delegate call with reason \c NSPopoverCloseReasonDetachToWindow. Instead, when the detached window is going to be closed, PopoverShould/Will/DidClose delegate calls and notifications will be sent with the reason \c NSPopoverCloseReasonStandard.
 * \param popover The popover that may be detached
 * \return YES if the popover should detach, whether to a custom window or the implicitly detached window. NO if not.
 */
//- (BOOL)popoverShouldDetach:(NSPopover *)popover NS_AVAILABLE_MAC(10_10);
//{
//    _methodname_;
//}

/*!
 * Return a custom window to which the popover should be detached. This should be used when the content of the detached window is wanted to be different from the content of the popover. If the same content should be used in the detached window, only \c -popoverShouldDetach: needs to be implemented.
 
 * If implementing this method, you should not remove the popover's content view as part of your implementation of this method. The popover and the detachable window may be shown at the same time and therefore cannot share a content view (or a content view controller).  If the popover and the detachable window should have the same content, you should define the content in a separate nib file and use a view controller to instantiate separate copies of the content for the popover and the detachable window.  The popover will animate to appear as though it morphs into the detachable window (unless the animates property is set to NO.  The exact animation used is not guaranteed).  Subclasses of NSPopover may also implement this method, in which case the subclass method will be invoked only if the delegate does not implement the method.
 * If \c -popoverShouldDetach: is not overridden or returns NO, this method will not be called and the popover will not be detachable.
 * \param popover The popover that is being detached
 * \return The custom window to detach to.
 */
//- (NSWindow *)detachableWindowForPopover:(NSPopover *)popover
//{
//    _methodname_;
//    
//    return self.window;
//}

/*!
 * Invoked on the delegate when the NSPopoverWillShowNotification notification is sent.  This method will also be invoked on the popover.
 */
- (void)popoverWillShow:(NSNotification *)notification
{
    _methodname_;
}

/*!
 * Invoked on the delegate when the NSPopoverDidShowNotification notification is sent.  This method will also be invoked on the popover.
 */
- (void)popoverDidShow:(NSNotification *)notification
{
    _methodname_;
}

/*!
 * Invoked on the delegate when the NSPopoverWillCloseNotification notification is sent.  This method will also be invoked on the popover.
 */
- (void)popoverWillClose:(NSNotification *)notification
{
    _methodname_;
}

/*!
 * Invoked on the delegate when the NSPopoverDidCloseNotification notification is sent.  This method will also be invoked on the popover.
 */
- (void)popoverDidClose:(NSNotification *)notification
{
    _methodname_;
}

@end
