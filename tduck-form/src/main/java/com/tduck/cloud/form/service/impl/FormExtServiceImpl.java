//package com.tduck.cloud.form.service.impl;
//
//import cn.hutool.core.collection.CollUtil;
//import cn.hutool.core.map.MapUtil;
//import cn.hutool.core.util.StrUtil;
//import com.baomidou.mybatisplus.core.toolkit.Wrappers;
//import com.tduck.cloud.common.util.JsonUtils;
//import com.tduck.cloud.common.util.RedisUtils;
//import com.tduck.cloud.form.entity.UserFormItemEntity;
//import com.tduck.cloud.form.entity.struct.GoodsSchemaStruct;
//import com.tduck.cloud.form.request.CreateGoodsPayRequest;
//import com.tduck.cloud.form.service.FormExtService;
//import com.tduck.cloud.form.service.UserFormItemService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//
//import java.math.BigDecimal;
//import java.util.HashMap;
//import java.util.List;
//import java.util.stream.Collectors;
//
//import static com.tduck.cloud.form.constant.FormRedisKeyConstants.FORM_GOODS_SELL_QUANTITY;
//
//@Service
//@RequiredArgsConstructor
//public class FormExtServiceImpl implements FormExtService {
//
//    private final UserFormItemService userFormItemService;
//
//
//    private final RedisUtils redisUtils;
//
//    /**
//     * 计算所选的商品总价
//     *
//     * @return
//     */
//    @Override
//    public CreateGoodsPayRequest calcGoodsTotalPrice(CreateGoodsPayRequest request) {
//        List<String> keyList = request.getGoodsList().stream().map(CreateGoodsPayRequest.Goods::getKey).collect(Collectors.toList());
//        if (keyList.size() == 0) {
//            return request;
//        }
//        List<UserFormItemEntity> list = userFormItemService.list(Wrappers.<UserFormItemEntity>lambdaQuery().in(UserFormItemEntity::getFormItemId, keyList));
//        // 每个商品的价格和数量
//        HashMap<String, GoodsSchemaStruct.Goods> goodsMap = MapUtil.newHashMap();
//        list.forEach(item -> {
//            GoodsSchemaStruct goodsSchemaStruct = JsonUtils.jsonToObj(JsonUtils.objToJson(item.getScheme()), GoodsSchemaStruct.class);
//            goodsSchemaStruct.getGoodsList().forEach(goods -> {
//                goodsMap.put(item.getFormItemId() + "" + goods.getId(), goods);
//            });
//        });
//        if (MapUtil.isNotEmpty(goodsMap)) {
//            GoodsSchemaStruct.Goods goods = goodsMap.get(CollUtil.getFirst(goodsMap.keySet()));
//            String goodsDesc = goods.getGoodsName();
//            if (goodsMap.size() > 1) {
//                goodsDesc += "等商品";
//            }
//            request.setGoodsDesc(goodsDesc);
//            request.setProductId(goods.getId());
//        }
//        // 计算价格
//        request.getGoodsList().forEach(goods -> {
//            goods.getValue().keySet().forEach(key -> {
//                BigDecimal price = goodsMap.get(goods.getKey() + key).getPrice();
//                Object o = goods.getValue().get(key);
//                if (o instanceof Integer) {
//                    Integer count = (Integer) o;
//                    // 检查库存
//                    checkGoodsInventory(request.getFormKey(), goods.getKey(), key, goodsMap.get(goods.getKey() + key).getInventory(), count);
//                    request.setTotalPrice(request.getTotalPrice().add(price.multiply(new BigDecimal(count))));
//                }
//            });
//        });
//        return request;
//    }
//
//
//    /**
//     * 检查商品库存是否足够
//     *
//     * @param formKey        表单唯一标识
//     * @param formItemId     表单字段标识
//     * @param goodsId        商品标识
//     * @param totalInventory 总库存
//     * @param count          购买数量
//     */
//    public void checkGoodsInventory(String formKey, String formItemId, String goodsId, Long totalInventory, Integer count) {
//        String key = StrUtil.format(FORM_GOODS_SELL_QUANTITY, formKey, formItemId);
//        Object o = redisUtils.hmGet(key, goodsId);
//        if (o instanceof Integer) {
//            // 卖出数量
//            Integer sellCount = (Integer) o;
//            if ((totalInventory - sellCount) < count) {
//                throw new RuntimeException("商品库存不足");
//            }
//        }
//    }
//
//
//}
