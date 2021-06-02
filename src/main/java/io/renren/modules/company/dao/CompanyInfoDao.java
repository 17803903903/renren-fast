package io.renren.modules.company.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author zhaojin
 * @date 2021/3/8 16:26
 */
@Mapper
@Repository
public interface CompanyInfoDao {

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
