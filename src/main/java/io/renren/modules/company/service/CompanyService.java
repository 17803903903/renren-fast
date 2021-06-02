package io.renren.modules.company.service;

import io.renren.modules.company.dao.CompanyInfoDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @author zhaojin
 * @date 2021/3/8 16:33
 */
public interface CompanyService{

    void saveCompanyInfo(Map<String,Object> params);

    void updateCompanyInfo(Map<String,Object> params);

    void saveCompanyJob(Map<String,Object> params);

    void updateCompanyJob(Map<String,Object> params);

    List<Map<String,Object>> getAllJobInfo(Map<String,Object> params);

    Map<String,Object> getPersonalInfo(Map<String,Object> params);

    void updateIdNumber(Map<String,Object> params);

    void deleteById(Map<String,Object> params);

    List<Map<String,Object>> getPostUserInfo(Map<String,Object> params);
}
