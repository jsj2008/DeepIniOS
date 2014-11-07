//
//  resMod_GetShoppingMallKeyWords.m
//  boqiimall
//
//  Created by 波奇-xiaobo on 14-8-28.
//  Copyright (c) 2014年 Boqii.com. All rights reserved.
//

#import "resMod_GetShoppingMallKeyWords.h"
#import "NSDictionary+JudgeObj.h"
#import "NSDictionary+JSON.h"

@implementation resMod_GetShoppingMallKeyWords
@synthesize TypeId;
@synthesize keyWordsArray;

-(instancetype)initWithDic:(NSDictionary*)dic{
    if (self=[super init]) {
        self.keyWordsArray = [[NSMutableArray alloc] init];
        self.TypeId = [dic ConvertStringForKey:@"TypeId"];
        NSArray *arr = [dic objectForKey:@"KeyWords"];
        for (NSInteger index = 0; index < [arr count]; index++)
        {
            NSDictionary *dict = [arr objectAtIndex:index];
            NSString *word = [dict ConvertStringForKey:@"Title"];
            if (![self.keyWordsArray containsObject:word] && (word.length > 0))
            {
                [self.keyWordsArray addObject:word];
            }
            
        }
        
    }
    return self;
}

#if ! __has_feature(objc_arc)
- (void) dealloc{
    [self.keyWordsArray release];
    [self.TypeId release];
    
    [super dealloc];
}
#endif
@end



@implementation resMod_CallBackMall_SearchKeyWordsList
@synthesize ResponseStatus;
@synthesize ResponseMsg;
@synthesize ResponseData;

-(instancetype)initWithDic:(NSDictionary*)dic{
    if (self=[super init]) {
        self.ResponseStatus = [[dic ConvertStringForKey:@"ResponseStatus"] intValue];
        self.ResponseMsg = [dic ConvertStringForKey:@"ResponseMsg"];
        
        NSArray * arrResponseData = [dic ConvertArrayForKey:@"ResponseData"];
        self.ResponseData = [[NSMutableArray alloc] initWithCapacity:arrResponseData.count];
        for ( NSDictionary * item in arrResponseData ) {
             [self.ResponseData addObject:[[resMod_GetShoppingMallKeyWords alloc] initWithDic:item]];
        }
    }
    return self;
}


#if ! __has_feature(objc_arc)
- (void)dealloc{
    [ResponseMsg release];
    [ResponseData release];
    [super dealloc];
}
#endif
@end




