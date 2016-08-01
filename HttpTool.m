//
//  HttpTool.m
//  HttpTool
//
//  Created by 王翔 on 16/7/16.
//  Copyright © 2016年 WangXiangMT. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool

+(NSURLSessionDataTask*)postHttpUrl:(NSString*)urlstr params:(NSDictionary*)params success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",nil];
    
    NSURLSessionDataTask *op = [manager POST:urlstr parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask *  task, id  responseObject) {
        
        if (success)
        {
            NSDictionary *dic = (NSDictionary *)responseObject;
            success(dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(error);
        }
    }];
    
    
    return op;
}

+(NSURLSessionDataTask*)getHttpUrl:(NSString*)urlstr params:(NSDictionary *)parama success:(HttpRequestSuccess)success failure:(HttpRequestFailure)failure
{
    if (parama)
    {
        parama = @{};
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/html", nil];
    
    manager.requestSerializer.timeoutInterval = 10;
    
    NSURLSessionDataTask *op = [manager GET:urlstr parameters:parama progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask *  task, id   responseObject) {
        if (success)
        {
            NSDictionary *dic= (NSDictionary*)responseObject;
            success(dic);
        }
        
    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
        if (error)
        {
            failure(error);
        }
        
    }];
    
    
    return op;
}


@end

