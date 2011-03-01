//
//  GTRawObject.m
//  ObjectiveGitFramework
//
//  Created by Timothy Clem on 2/24/11.
//
//  The MIT License
//
//  Copyright (c) 2011 Tim Clem
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "GTRawObject.h"
#import "NSString+Git.h"

@implementation GTRawObject

@synthesize type;
@synthesize data;

+ (id)rawObjectWithType:(git_otype)theType data:(NSData *)theData {
	
	return [[[GTRawObject alloc] initWithType:theType data:theData] autorelease];
}

+ (id)rawObjectWithType:(git_otype)theType string:(NSString *)string {
	
	return [[[GTRawObject alloc] initWithType:theType string:string] autorelease];
}

- (id)initWithType:(git_otype)theType data:(NSData *)theData {
	
	if(self = [super init]) {
		self.type = theType;
		self.data = theData;
	}
	return self;
}

- (id)initWithType:(git_otype)theType string:(NSString *)string {
	
	if(self = [super init]) {
		self.type = theType;
		self.data = [string dataUsingEncoding:NSUTF8StringEncoding];
	}
	return self;
}

- (NSString *)dataAsUTF8String {
	
	if(!self.data) return nil;
	
	return [NSString stringWithUTF8String:[data bytes]];
}

@end
