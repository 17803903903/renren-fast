package io.renren.modules.user.service;

import java.util.List;
import java.util.Map;

/**
 * @author zhaojin
 * @date 2021/3/5 16:59
 */
public interface UserInfoService {
    List<Map<String,Object>> getUserInfo();

    void updateUserInfo(Map<String,Object> params);

    void updateIdNumber(Map<String,Object> params);

    void saveUserInfo(Map<String,Object> params);

    Map<String,Object> getPersonalInfo(Map<String,Object> params);

    List<Map<String,Object>> getAllJobInfo(Map<String,Object> params);

    void saveCompanyPost(Map<String,Object> params);
}
