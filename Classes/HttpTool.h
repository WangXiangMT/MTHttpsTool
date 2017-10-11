//
//  HttpTool.h
//  HttpTool
//
//  Created by 王翔 on 16/7/16.
//  Copyright © 2016年 WangXiangMT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^HttpRequestSuccess)(id json);
typedef void(^HttpRequestFailure)(NSError *error);

@interface HttpTool : NSObject
+(NSURLSessionDataTask*)postHttpUrl:(NSString*)urlstr params:(NSDictionary*)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure;
+(NSURLSessionDataTask*)getHttpUrl:(NSString*)urlstr params:(NSDictionary *)parama success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure;
@end
