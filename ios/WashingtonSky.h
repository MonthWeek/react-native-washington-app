#import <Foundation/Foundation.h>
#if __has_include("RCTBridgeDelegate.h")
    #import "RCTBridgeDelegate.h"
#else
    #import <React/RCTBridgeDelegate.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface WashingtonSky : NSObject<RCTBridgeDelegate>

+ (instancetype)shared;
- (UIViewController *)mnl_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
