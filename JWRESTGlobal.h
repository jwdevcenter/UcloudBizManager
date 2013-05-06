//
//  JWRESTGlobal.h
//  
//
//  Created by Son Ju Wook on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


//  For reference, you can compare hashedValue and hashedValue result at http://hash.online-convert.com/sha1-generator    
//  To perform actual REST API call, you can use https://github.com/RestKit/RestKit or http://allseeing-i.com/ASIHTTPRequest/
//  RestKit's turorial : http://liebke.github.com/restkit-github-client-example/ http://mobile.tutsplus.com/tutorials/iphone/restkit_ios-sdk/ http://www.slideshare.net/tkalapun/restfull-with-restkit http://paradigmx.net/blog/2012/01/31/introducing-restkit/
//  But RestKit recently changed a lot, especially Object Mapping changed completely. So read this article https://github.com/RestKit/RestKit/wiki/Object-mapping for mapping. Even some property like rootKeyPath seems not to work anymore. To help mapping, you can use JSON Formatter at http://jsonformatter.curiousconcept.com/
//  RestKit's mailinglist : https://groups.google.com/group/restkit
//  ASIHTTPRequest is told that it has better network API, GCD support, better documentation but RestKit is better at JSON and XML....
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>

//This key is for ID : nkc03@nkc0319
#define KTuCloudBizAPIKey @"TV7K3ve-3wLvILLyJhvQnM_H2ZJ2p1uFo0kWmRyBfRABXazlQwmmO47AW9skbfN57Uk5kpnQJ-Dkg1LWxj-voA"
#define KTuCloudBizSecretKey @"wFQ5gGxKfFa0CtGEI_IerwfsTTBwBHW8_ECVpcP7NUha6xfTNKV9n0ds2bFmvdd2DSUahKOzfy6L9j6Y94PM9g"

@interface JWRESTGlobal : NSObject

/*  This method derived from https://github.com/mattgemmell/MGTwitterEngine/blob/master/NSData+Base64.h
    Check this page for background info http://stackoverflow.com/questions/392464/any-base64-library-on-iphone-sdk  
 */
+ (NSString *) base64EncodingWithLineLength:(NSData *)data :(unsigned int) lineLength; 

/*  HMAC-SHA1 with Shared secret key
    Note that HMAC-SHA1 is NOT same with SHA1
    SHA1 doesn't need secret key - it is asymmetric encryption
    But HMAC needs key
    This method derived from http://stackoverflow.com/questions/756492/objective-c-sample-code-for-hmac-sha1    */
+ (NSString *) hashedValue :(NSString *)key andData:(NSString *) data;

/*  Store HMAC-SHA1 hex result string to NSData
    Is NOT just encoding like UTF8, as [NSString initWithData:encoding:]  
    This method derived from http://stackoverflow.com/questions/7317860/converting-hex-nsstring-to-nsdata    */
+ (NSData *) hexStringToNSData :(NSString *)string;


@end
