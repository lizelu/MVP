//
//  NetRequestClass.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/6.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "NetRequestClass.h"

@implementation NetRequestClass
/**
 监测网络的可链接性

 @param strUrl URL地址
 @return 是否可达
 */
+(BOOL)netWorkReachabilityWithURLString:(NSString *) strUrl {
    __block BOOL netState = YES;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
            case AFNetworkReachabilityStatusUnknown:
                netState = NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            case AFNetworkReachabilityStatusReachableViaWWAN:
                netState = YES;
                break;
           
            default:
                break;
        }
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    return netState;
}

/***************************************
 在这做判断如果有dic里有errorCode
 调用errorBlock(dic)
 没有errorCode则调用block(dic
 ******************************/

/**
 GET请求方式

 @param requestURLString 请求的URL
 @param parameter 参数
 @param block 业务逻辑成功的block回调
 @param failureBlock 网络失败的block回调
 */
+(void)NetRequestGETWithRequestURL:(NSString *) requestURLString
                      WithParameter:(NSDictionary *) parameter
              WithReturnValeuBlock:(ReturnValueBlock) block
                  WithFailureBlock:(FailureBlock) failureBlock
{
    NSMutableDictionary *allParameter = [[NSMutableDictionary alloc] initWithDictionary:parameter];
    [allParameter setValue:ACCESSTOKEN forKey:TOKEN];
    [[AFHTTPSessionManager manager] GET:requestURLString parameters:allParameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DDLog(@"%@",error.description);
        failureBlock();
    }];
}

/**
 POST请求方式
 
 @param requestURLString 请求的URL
 @param parameter 参数
 @param block 业务逻辑成功的block回调
 @param failureBlock 网络失败的block回调
 */
+(void)NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                      WithParameter:(NSDictionary *) parameter
               WithReturnValeuBlock:(ReturnValueBlock) block
                   WithFailureBlock:(FailureBlock) failureBlock
{
    
    [[AFHTTPSessionManager manager] POST:requestURLString parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         failureBlock();
    }];
}


@end
