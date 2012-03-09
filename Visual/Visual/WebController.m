//
//  WebController.m
//  Visual
//
//  Created by Yoshiki - Vázquez Baeza on 07/03/12.
//  Copyright (c) 2012 Polar Bears Nanotechnology Research ©. All rights reserved.
//

#import "WebController.h"

@implementation WebController

@synthesize contentStringURL, filename, extension, currentURL; 
@synthesize index, totalImages;

-(id)initWithContentStringURL:(NSString *)someStringURL filename:(NSString *)someFilename extension:(NSString *)someExtension andTotalImages:(int)total{
    if ( self = [super init]) {
        contentStringURL=[[NSMutableString alloc] initWithString:someStringURL];
        filename=[[NSMutableString alloc] initWithString:someFilename];
        extension=[[NSMutableString alloc] initWithString:someExtension];
    
        index=1;
        totalImages=total;
    
        currentURL=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%d.%@",contentStringURL, filename, index, extension]];
    }
    return self;
}

-(void)dealloc{
    [contentStringURL release];
    [filename release];
    [extension release];
    
    [super dealloc];
}

-(NSURL *)reloadURLAtIndex:(int)newIndex{
    if (newIndex > totalImages || newIndex < 1) {
        return currentURL;
    }
    index=newIndex;
    currentURL=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%d.%@",contentStringURL, filename, index, extension]];
    
    return currentURL;
}


-(NSURL *)nextURL{
    if (index >= totalImages) {
        return currentURL;
    }
    index=index+1;
    currentURL=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%d.%@",contentStringURL, filename, index, extension]];
    
    return currentURL;
}

-(NSURL *)previousURL{
    if (index == 1) {
        return currentURL;
    }
    index=index-1;
    currentURL=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%d.%@",contentStringURL, filename, index, extension]];


    return currentURL;
}


@end
