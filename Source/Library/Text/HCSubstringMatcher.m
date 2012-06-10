//
//  OCHamcrest - HCSubstringMatcher.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  https://github.com/hamcrest/OCHamcrest
//

#import "HCSubstringMatcher.h"

#import "HCDescription.h"
#import "HCRequireNonNilObject.h"


@interface HCSubstringMatcher (SubclassResponsibility)
- (NSString *)relationship;
@end


@implementation HCSubstringMatcher

- (id)initWithSubstring:(NSString *)aString
{
    HCRequireNonNilObject(aString);
    
    self = [super init];
    if (self)
        substring = [aString copy];
    return self;
}

- (void)dealloc
{
    [substring release];
    [super dealloc];
}

- (void)describeTo:(id<HCDescription>)description
{
    [[[[description appendText:@"a string "]
                    appendText:[self relationship]]
                    appendText:@" "]
                    appendDescriptionOf:substring];
}

@end
