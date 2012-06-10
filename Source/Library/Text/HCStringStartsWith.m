//
//  OCHamcrest - HCStringStartsWith.m
//  Copyright 2012 hamcrest.org. See LICENSE.txt
//
//  Created by: Jon Reid, http://qualitycoding.org/
//  https://github.com/hamcrest/OCHamcrest
//

#import "HCStringStartsWith.h"

#import "HCDescription.h"


@implementation HCStringStartsWith

+ (id)stringStartsWith:(NSString *)aSubstring
{
    return [[[self alloc] initWithSubstring:aSubstring] autorelease];
}

- (BOOL)matches:(id)item
{
    if (![item respondsToSelector:@selector(hasPrefix:)])
        return NO;
    
    return [item hasPrefix:substring];
}

- (NSString *)relationship
{
    return @"starting with";
}

@end


#pragma mark -

id<HCMatcher> HC_startsWith(NSString *aString)
{
    return [HCStringStartsWith stringStartsWith:aString];
}
