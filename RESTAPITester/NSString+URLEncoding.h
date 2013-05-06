//
//  NSString+URLEncoding.h
//  RESTAPITester
//
//  Created by Son Ju Wook on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncoding)
/*
 UTF-8을 통해 URLEncoding을 하기 위한 함수. 특수문자를 이그케이프 처리해준다.
 NSURL.h에 정의된 stringByAddingPercentEscapesUsingEncoding (인코딩은 NSASCIIStringEncoding)함수는 제대로 이스케입 문자 변환을 못한다. 
 그래서 RestKit의 NSString+RKAdditions.h 에 정의된 - (NSString *)stringByAddingURLEncoding 함수를 참조해서 가지고 왔다.
 보통 RestKit을 활용하는 경우는 RestKit이 자체적으로 쿼리 값들에 URLEncoding을 수행하므로 이 함수는 필요없다.
 참고로 ARC와 맞지 않아서 별도 파일로 분리시켰다.
 ARC와 관련된 이슈들은 http://madebymany.com/blog/url-encoding-an-nsstring-on-ios 의 커멘트를 참조
 */
- (NSString *)jwStringByAddingURLEncoding;
@end
