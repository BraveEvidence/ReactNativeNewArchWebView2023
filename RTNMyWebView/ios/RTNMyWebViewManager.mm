#import <React/RCTLog.h>
#import <React/RCTUIManager.h>
#import <React/RCTViewManager.h>

@interface RTNMyWebViewManager : RCTViewManager
@end

@implementation RTNMyWebViewManager

RCT_EXPORT_MODULE(RTNCenteredText)
RCT_EXPORT_VIEW_PROPERTY(url, NSString)

@end