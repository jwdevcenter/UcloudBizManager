//
//  NSString+URLEncoding.m
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)
// NOTE: See http://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters
- (NSString *)jwStringByAddingURLEncoding {
    CFStringRef legalURLCharactersToBeEscaped = CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`\n\r");
    CFStringRef encodedString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                        (CFStringRef)self,
                                                                        NULL, 
                                                                        legalURLCharactersToBeEscaped,
                                                                        kCFStringEncodingUTF8);
	if (encodedString) {
        return [(NSString *)encodedString autorelease];
    }
    
    // TODO: Log a warning?
    return @"";
}

@end
