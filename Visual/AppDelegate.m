//
//  AppDelegate.m
//  Visual
//
//  Created by Yoshiki - Vázquez Baeza on 07/03/12.
//  Copyright (c) 2012 Polar Bears Nanotechnology Research ©. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize webView, theController;
@synthesize reloadButton, previousButton, nextButton;
@synthesize sourceTextField, filenameTextField, totalTextField, extensionTextField, gotoTextField;

#pragma mark - NSWindowDelegate methods
-(void)windowDidResize:(NSNotification *)notification{
    NSRect newSize=[_window frame];
    NSRect webViewRect=[webView frame];
    NSRect nextButtonRect=[nextButton frame];
    
    //Resize the webview to make it as big as the window, considering that it should
    //be -40 pixels wider and -35 pixels shorter than the window 
    [webView setFrame:NSMakeRect(webViewRect.origin.x, webViewRect.origin.y, newSize.size.width-40, newSize.size.height-35)];
}

- (void)dealloc{
    [sourceTextField release];
    [filenameTextField release];
    [totalTextField release];
    [extensionTextField release];
    [gotoTextField release];
    
    [theController release];
    [webView release];
    [super dealloc];
}

#pragma mark IBActions
- (IBAction)next:(id)sender{
    NSURLRequest*request=[NSURLRequest requestWithURL:[theController nextURL]];
    [[webView mainFrame] loadRequest:request];
}

-(IBAction)previous:(id)sender{
    NSURLRequest*request=[NSURLRequest requestWithURL:[theController previousURL]];
    [[webView mainFrame] loadRequest:request];
}

-(IBAction)gotoPage:(id)sender{
    int newIndex=[[gotoTextField stringValue] intValue];
    
    NSURLRequest*request=[NSURLRequest requestWithURL:[theController reloadURLAtIndex:newIndex]];
    [[webView mainFrame] loadRequest:request];
}

-(IBAction)reloadController:(id)sender{
    if ([[sourceTextField stringValue] isEqualToString:@""] || [[filenameTextField stringValue] isEqualToString:@""] || [[extensionTextField stringValue] isEqualToString:@""] || [[totalTextField stringValue] isEqualToString:@""]) {
        NSLog(@"ERROR**:Check the values");
        return;
    }
    
    
    //Release the last controller, you don't need it anymore
    if (theController != nil) {
        [theController release];
    }
    
    //Create a new object
    theController=[[WebController alloc] initWithContentStringURL:[sourceTextField stringValue] 
                                                         filename:[filenameTextField stringValue] 
                                                        extension:[extensionTextField stringValue] 
                                                   andTotalImages:[[totalTextField stringValue] intValue]];
    
    //Show the data
    NSURLRequest*request=[NSURLRequest requestWithURL:[theController currentURL]];
    [[webView mainFrame] loadRequest:request];
}

#pragma mark - NSApplicationDelegate methods
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    NSSize minimumSize=NSSizeFromString(@"1200x700");    
    // Insert code here to initialize your application
    [_window setDelegate:self];
    [_window setMinSize:minimumSize];
    
    [NSApp setDelegate:self];
    
    [sourceTextField setStringValue:FULL_URL];
    [filenameTextField setStringValue:FILENAME];
    [totalTextField setStringValue:@"50"];
    [extensionTextField setStringValue:EXTESNION];
    
    theController=nil;
    
    [self reloadController:nil];
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}

@end
