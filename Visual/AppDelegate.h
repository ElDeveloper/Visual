//
//  AppDelegate.h
//  Visual
//
//  Created by Yoshiki - Vázquez Baeza on 07/03/12.
//  Copyright (c) 2012 Polar Bears Nanotechnology Research ©. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "WebController.h"

#define FULL_URL @"http://antares.dci.uia.mx/TESIS/yoshiki/Detection/feces_s1_png10/"
#define FILENAME @"Cluster_"
#define EXTESNION @"eps"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSWindowDelegate>{
    IBOutlet WebView *webView;
    WebController *theController;
    
    IBOutlet NSTextField *sourceTextField;
    IBOutlet NSTextField *filenameTextField;
    IBOutlet NSTextField *totalTextField;
    IBOutlet NSTextField *extensionTextField;
    IBOutlet NSTextField *gotoTextField;
    
    IBOutlet NSButton *reloadButton;
    IBOutlet NSButton *previousButton;
    IBOutlet NSButton *nextButton;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet WebView *webView;
@property (nonatomic, retain) WebController *theController;

@property (nonatomic, retain) IBOutlet NSTextField *sourceTextField;
@property (nonatomic, retain) IBOutlet NSTextField *filenameTextField;
@property (nonatomic, retain) IBOutlet NSTextField *totalTextField;
@property (nonatomic, retain) IBOutlet NSTextField *extensionTextField;
@property (nonatomic, retain) IBOutlet NSTextField *gotoTextField;

@property (nonatomic, retain) IBOutlet NSButton *reloadButton;
@property (nonatomic, retain) IBOutlet NSButton *previousButton;
@property (nonatomic, retain) IBOutlet NSButton *nextButton;

-(IBAction)next:(id)sender;
-(IBAction)previous:(id)sender;
-(IBAction)gotoPage:(id)sender;
-(IBAction)reloadController:(id)sender;

@end
