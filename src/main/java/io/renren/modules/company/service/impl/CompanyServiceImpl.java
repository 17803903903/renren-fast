package io.renren.modules.company.service.impl;

import io.renren.modules.company.dao.CompanyInfoDao;
import io.renren.modules.company.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author zhaojin
 * @date 2021/3/8 16:35
 */
@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    CompanyInfoDao companyInfoDao;
    @Override
    public void saveCompanyInfo(Map<String, Object> params) {
        companyInfoDao.saveCompanyInfo(params);
    }

    @Override
    public void saveCompanyJob(Map<String, Object> params) {
        companyInfoDao.saveCompanyJob(params);
    }

    @Override
    public void updateCompanyJob(Map<String, Object> params) {
        companyInfoDao.updateCompanyJob(params);
    }

    @Override
    public List<Map<String, Object>> getAllJobInfo(Map<String, Object> params) {
        return companyInfoDao.getAllJobInfo(params);
    }

    @Override
    public Map<String, Object> getPersonalInfo(Map<String, Object> params) {
        return companyInfoDao.getPersonalInfo(params);
    }

    @Override
    public void updateIdNumber(Map<String,Object> params) {
        companyInfoDao.updateIdNumber(params);
    }

    @Override
    public void deleteById(Map<String, Object> params) {
        companyInfoDao.deleteById(params);
    }

    @Override
    public List<Map<String, Object>> getPostUserInfo(Map<String, Object> params) {
        return companyInfoDao.getPostUserInfo(params);
    }
}
