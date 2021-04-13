package io.renren.modules.user.service.impl;

import io.renren.common.utils.DateUtils;
import io.renren.modules.user.dao.UserInfoDao;
import io.renren.modules.user.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author zhaojin
 * @date 2021/3/5 16:59
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    UserInfoDao userInfoDao;
    @Override
    public List<Map<String, Object>> getUserInfo() {
        List<Map<String, Object>> userInfo = userInfoDao.getUserInfo();
        return userInfo;
    }

    @Override
    public void updateUserInfo(Map<String,Object> params) {
        userInfoDao.updateUserInfo(params);
    }

    @Override
    public void saveUserInfo(Map<String, Object> params) {
        Object date = params.get("date");
        params.put("date",DateUtils.stringToDate((String)date,DateUtils.DATE_TIME_PATTERN));
        userInfoDao.saveUserInfo(params);
    }

    @Override
    public Map<String, Object> getPersonalInfo(Map<String, Object> params) {
        return userInfoDao.getPersonalInfo(params);
    }

    @Override
    public List<Map<String, Object>> getAllJobInfo(Map<String, Object> params) {
        return userInfoDao.getAllJobInfo(params);
    }

    @Override
    public void saveCompanyPost(Map<String, Object> params) {
        userInfoDao.saveCompanyPost(params);
    }

    @Override
    public void updateIdNumber(Map<String,Object> params) {
        userInfoDao.updateIdNumber(params);
    }
}
