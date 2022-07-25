#import "WashComplexWebviewController.h"
#import <WebKit/WebKit.h>
#import <SafariServices/SafariServices.h>

@interface WashComplexWebviewController ()<WKUIDelegate>

@property (nonatomic,strong) WKWebView *webview;

@end

@implementation WashComplexWebviewController

static NSString * const WashComplexUrl = @"complexUrl";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0];
    // Do any additional setup after loading the view.
    
   NSSet* allDatas  =  [WKWebsiteDataStore allWebsiteDataTypes];
    NSMutableSet *types = [NSMutableSet set];
    for (NSString *type in allDatas) {
        if(![type isEqualToString:@"WKWebsiteDataTypeLocalStorage"]){
            [types addObject:type];
        }
    }
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [WKWebsiteDataStore.defaultDataStore removeDataOfTypes:types.copy modifiedSince:dateFrom completionHandler:^{
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.allowsInlineMediaPlayback = YES;
        
        self.webview = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
        [self.view addSubview:self.webview];
        self.webview.UIDelegate = self;

        NSString *finalUrl = [[NSUserDefaults standardUserDefaults] objectForKey:WashComplexUrl];
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:finalUrl]];
        [self.webview loadRequest:req];
    }];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _webview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    if (navigationAction.request.URL) {
        NSURL *url = navigationAction.request.URL;
        NSString *urlPath = url.absoluteString;
        if ([urlPath hasPrefix:@"https://"] || [urlPath hasPrefix:@"http://"]) {
            SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:urlPath]];
            [self presentViewController:safariVC animated:YES completion:nil];
        }else{
            [UIApplication.sharedApplication openURL:[NSURL URLWithString:urlPath] options:@{} completionHandler:nil];
        }
    }
    return nil;
}


@end
