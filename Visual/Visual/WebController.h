//
//  WebController.h
//  Visual
//
//  Created by Yoshiki - Vázquez Baeza on 07/03/12.
//  Copyright (c) 2012 Polar Bears Nanotechnology Research ©. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebController : NSObject{
    NSMutableString *contentStringURL;
    NSMutableString *filename;
    NSMutableString *extension;
    
    int totalImages;
    
    int index;
}

@property (nonatomic, retain, readonly) NSMutableString *contentStringURL;
@property (nonatomic, retain, readonly) NSMutableString *filename;
@property (nonatomic, retain, readonly) NSMutableString *extension;

@property (nonatomic, retain, readonly) NSURL *currentURL;

@property (assign) int totalImages;

@property (assign, readonly) int index;


-(id)initWithContentStringURL:(NSString *)someStringURL filename:(NSString *)someFilename extension:(NSString *)someExtension andTotalImages:(int)total;
-(NSURL *)nextURL;
-(NSURL *)previousURL;
-(NSURL *)reloadURLAtIndex:(int)newIndex;


@end
