//
//  OCHamcrest - HCIsEqualIgnoringCase.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  https://github.com/hamcrest/OCHamcrest
//

#import "HCIsEqualIgnoringCase.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"


@implementation HCIsEqualIgnoringCase

+ (id)isEqualIgnoringCase:(NSString *)aString
{
    return [[[self alloc] initWithString:aString] autorelease];
}

- (id)initWithString:(NSString *)aString
{
    HCRequireNonNilObject(aString);
    
    self = [super init];
    if (self)
        string = [aString copy];
    return self;
}

- (void)dealloc
{
    [string release];
    [super dealloc];
}

- (BOOL)matches:(id)item
{
    if (![item isKindOfClass:[NSString class]])
        return NO;
    
    return [string caseInsensitiveCompare:item] == NSOrderedSame;
}

- (void)describeTo:(id<HCDescription>)description
{
    [[description appendDescriptionOf:string]
                  appendText:@" ignoring case"];
}

@end


#pragma mark -

id<HCMatcher> HC_equalToIgnoringCase(NSString *aString)
{
    return [HCIsEqualIgnoringCase isEqualIgnoringCase:aString];
}
