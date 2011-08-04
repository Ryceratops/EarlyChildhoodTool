//
//  FourLines.h
//  Prototype2
//
//  Created by Ryan George on 8/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define kField1Key	@"Field1"
#define kField2Key	@"Field2"
#define kField3Key	@"Field3"

#import <UIKit/UIKit.h>


@interface FourLines : NSObject <NSCoding, NSCopying>
{
	NSString *field1;
	NSString *field2;
	NSString *field3;
}

@property (nonatomic,retain) NSString *field1;
@property (nonatomic,retain) NSString *field2;
@property (nonatomic,retain) NSString *field3;

@end
