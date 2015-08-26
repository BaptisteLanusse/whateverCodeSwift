// Generated by Apple Swift version 1.2 (swiftlang-602.0.53.1 clang-602.0.53)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
#if __has_feature(nullability)
#  define SWIFT_NULLABILITY(X) X
#else
# if !defined(__nonnull)
#  define __nonnull
# endif
# if !defined(__nullable)
#  define __nullable
# endif
# if !defined(__null_unspecified)
#  define __null_unspecified
# endif
#  define SWIFT_NULLABILITY(X)
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import QuartzCore;
@import CoreFoundation;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC8SBLoader11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
- (SWIFT_NULLABILITY(nonnull) instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSCoder;
@class UIBezierPath;

SWIFT_CLASS("_TtC8SBLoader8ArcLayer")
@interface ArcLayer : CAShapeLayer
@property (nonatomic, readonly) CFTimeInterval animationDuration;
- (SWIFT_NULLABILITY(null_unspecified) instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly) UIBezierPath * __nonnull arcPathPre;
@property (nonatomic, readonly) UIBezierPath * __nonnull arcPathStarting;
@property (nonatomic, readonly) UIBezierPath * __nonnull arcPathLow;
@property (nonatomic, readonly) UIBezierPath * __nonnull arcPathMid;
@property (nonatomic, readonly) UIBezierPath * __nonnull arcPathHigh;
@property (nonatomic, readonly) UIBezierPath * __nonnull arcPathComplete;
- (void)animate;
@end

@class OvalLayer;
@class TriangleLayer;
@class RectangleLayer;

SWIFT_CLASS("_TtC8SBLoader10HolderView")
@interface HolderView : UIView
@property (nonatomic, readonly) OvalLayer * __null_unspecified ovalLayer;
@property (nonatomic, readonly) TriangleLayer * __null_unspecified triangleLayer;
@property (nonatomic, readonly) RectangleLayer * __null_unspecified redRectangleLayer;
@property (nonatomic, readonly) RectangleLayer * __null_unspecified blueRectangleLayer;
@property (nonatomic, readonly) ArcLayer * __null_unspecified arcLayer;
@property (nonatomic) CGRect parentFrame;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (void)addOval;
- (void)wobbleOval;
- (void)drawAnimatedTriangle;
- (void)spinAndTransform;
- (void)drawRedAnimatedRectangle;
- (void)drawBlueAnimatedRectangle;
- (void)drawArc;
- (void)expandView;
- (void)addLabel;
@end


SWIFT_CLASS("_TtC8SBLoader9OvalLayer")
@interface OvalLayer : CAShapeLayer
@property (nonatomic, readonly) CFTimeInterval animationDuration;
- (SWIFT_NULLABILITY(null_unspecified) instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly) UIBezierPath * __nonnull ovalPathSmall;
@property (nonatomic, readonly) UIBezierPath * __nonnull ovalPathLarge;
@property (nonatomic, readonly) UIBezierPath * __nonnull ovalPathSquishVertical;
@property (nonatomic, readonly) UIBezierPath * __nonnull ovalPathSquishHorizontal;
- (void)expand;
- (void)wobble;
- (void)contract;
@end

@class UIColor;

SWIFT_CLASS("_TtC8SBLoader14RectangleLayer")
@interface RectangleLayer : CAShapeLayer
- (SWIFT_NULLABILITY(null_unspecified) instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly) UIBezierPath * __nonnull rectanglePathFull;
- (void)animateStrokeWithColor:(UIColor * __nonnull)color;
@end


SWIFT_CLASS("_TtC8SBLoader13TriangleLayer")
@interface TriangleLayer : CAShapeLayer
@property (nonatomic, readonly) CGFloat innerPadding;
- (SWIFT_NULLABILITY(null_unspecified) instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly) UIBezierPath * __nonnull trianglePathSmall;
@property (nonatomic, readonly) UIBezierPath * __nonnull trianglePathLeftExtension;
@property (nonatomic, readonly) UIBezierPath * __nonnull trianglePathRightExtension;
@property (nonatomic, readonly) UIBezierPath * __nonnull trianglePathTopExtension;
- (void)animate;
@end

@class UIButton;
@class NSBundle;

SWIFT_CLASS("_TtC8SBLoader14ViewController")
@interface ViewController : UIViewController
@property (nonatomic) HolderView * __nonnull holderView;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)addHolderView;
- (void)animateLabel;
- (void)addButton;
- (void)buttonPressed:(UIButton * __null_unspecified)sender;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (SWIFT_NULLABILITY(nonnull) instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop