package io.renren.modules.user.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author zhaojin
 * @date 2021/3/5 15:52
 */
@Mapper
@Repository
public interface UserInfoDao {
    List<Map<String,Object>> getUserInfo();

    void updateUserInfo(Map<String,Object> params);

    void updateIdNumber(Map<String,Object> params);

    void saveUserInfo(Map<String,Object> params);

    Map<String,Object> getPersonalInfo(Map<String,Object> params);

    List<Map<String,Object>> getAllJobInfo(Map<String,Object> params);

    void saveCompanyPost(Map<String,Object> params);
}
