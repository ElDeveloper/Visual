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
@synthesize sourceTextField, filenameTextField, totalTextField, extensionTextField, gotoTextField;

- (void)dealloc{
    [theController release];
    [webView release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    // Insert code here to initialize your application
    [sourceTextField setStringValue:FULL_URL];
    [filenameTextField setStringValue:FILENAME];
    [totalTextField setStringValue:@"50"];
    [extensionTextField setStringValue:EXTESNION];

    theController=nil;
    
    [self reloadController:nil];
}

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
@end
