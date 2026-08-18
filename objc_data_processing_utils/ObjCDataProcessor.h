#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjCDataProcessor : NSObject

- (instancetype)initWithData:(NSDictionary *)data;
- (NSDictionary *)process;
- (NSArray *)filter:(NSString *)key value:(id)value;
- (nullable id)transform:(void (^)(id obj))block;

@end

NS_ASSUME_NONNULL_END
