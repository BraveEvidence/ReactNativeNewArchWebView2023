#import "RTNMyWebView.h"

#import <react/renderer/components/RTNMyWebViewSpecs/ComponentDescriptors.h>
#import <react/renderer/components/RTNMyWebViewSpecs/EventEmitters.h>
#import <react/renderer/components/RTNMyWebViewSpecs/Props.h>
#import <react/renderer/components/RTNMyWebViewSpecs/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RTNMyWebView () <RCTRTNMyWebViewViewProtocol>
@end

@implementation RTNMyWebView {
  WKWebView *_webView;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RTNMyWebViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RTNMyWebViewProps>();
    _props = defaultProps;

    

    _webView = [[WKWebView alloc] init];

    self.contentView = _webView;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<RTNMyWebViewProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<RTNMyWebViewProps const>(props);

  if (oldViewProps.url != newViewProps.url) {
      NSString *url = [[NSString alloc] initWithUTF8String: newViewProps.url.c_str()];
      
      NSURL *nsurl=[NSURL URLWithString:url];
      NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
      [_webView loadRequest:nsrequest];
    }

  [super updateProps:props oldProps:oldProps];
}

@end

Class<RCTComponentViewProtocol> RTNMyWebViewCls(void)
{
  return RTNMyWebView.class;
}
