#import "WashingtonWeiZhi.h"
#import <React/RCTUIManager.h>
#import "WashingtonWeiZhiHelper.h"

@implementation WashingtonWeiZhi

RCT_EXPORT_MODULE(LocationManager);


RCT_EXPORT_METHOD(getAddressNameWithcallback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[WashingtonWeiZhiHelper initializeManager].addressName]);
}

RCT_EXPORT_METHOD(checkOpenLocation:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[WashingtonWeiZhiHelper isOpenLocation],[WashingtonWeiZhiHelper getLocationStatus]]);
}

RCT_EXPORT_METHOD(checkFileExistsWithVideoPath:(NSString *)videoPath ImagePath:(NSString *)imagePath callback:(RCTResponseSenderBlock)callback)
{
  callback(@[[NSNull null],[WashingtonWeiZhiHelper checkFileExists:videoPath],[WashingtonWeiZhiHelper checkFileExists:imagePath]]);
}

@end
