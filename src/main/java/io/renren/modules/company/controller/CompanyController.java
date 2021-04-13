package io.renren.modules.company.controller;

import io.renren.common.utils.R;
import io.renren.modules.company.service.CompanyService;
import io.renren.modules.sys.controller.AbstractController;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author zhaojin
 * @date 2021/3/8 16:23
 */

@RestController
@RequestMapping("/company")
public class CompanyController extends AbstractController {

    @Autowired
    CompanyService companyService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Autowired
    SysUserService sysUserService;

    @PostMapping("/saveCompanyInfo")
    public R saveCompanyInfo(@RequestParam Map<String,Object> params){
        params.put("id",getUser().getUserId());
        if (companyService.getPersonalInfo(params)!= null){
            return R.error("数据库中已存在您的个人信息");
        }
        try {
            companyService.saveCompanyInfo(params);
        } catch (Exception e) {
            e.printStackTrace();
            return R.ok("操作失败");
        }
        return R.ok("操作成功");
    }

    @PostMapping("/saveCompanyJob")
    public R saveCompanyJob(@RequestParam Map<String,Object> params){
        params.put("id",getUser().getUserId());
        try {
            companyService.saveCompanyJob(params);
        } catch (Exception e) {
            e.printStackTrace();
            return R.ok("操作失败");
        }
        return R.ok("操作成功");
    }

    @PostMapping("/updateCompanyJob")
    public R updateCompanyJob(@RequestParam Map<String,Object> params){
        params.put("id",getUser().getUserId());
        try {
            companyService.updateCompanyJob(params);
        } catch (Exception e) {
            e.printStackTrace();
            return R.ok("操作失败");
        }
        return R.ok("操作成功");
    }

    @GetMapping("/getAllJobInfo")
    public R getJobInfo(@RequestParam Map<String,Object> params){
        params.put("id",getUser().getUserId());
        List<Map<String, Object>> allJobInfo = companyService.getAllJobInfo(params);
        Map<String,Object> map = new HashMap<>();
        map.put("jobInfo",allJobInfo);
        return R.ok(map);
    }

    @GetMapping("/getPersonalInfo")
    public R getPersonalInfo(){
        Map<String, Object> map = new HashMap<>();
        map.put("id",getUser().getUserId());
        if (companyService.getPersonalInfo(map)==null){
            return R.error("请先填写企业信息");
        }else {
            return R.ok(companyService.getPersonalInfo(map));
        }
    }

    @PostMapping("/certification")
    public R certification(@RequestParam Map<String,Object> params){
        SysUserEntity user = getUser();
        if (user.getCertification() == 1){
            return R.error("已认证");
        }else {
            if (Objects.equals(redisTemplate.opsForValue().get(params.get("phone")),params.get("code"))){
                try {
                    companyService.updateIdNumber(params);
                } catch (Exception e) {
                    e.printStackTrace();
                    return R.error("公司信息输入不正确");
                }
                user.setCertification(1);
                sysUserService.update(user);
            }else {
                return R.error("认证失败！验证码错误");
            }
        }
        return R.ok("操作成功");
    }

    @PostMapping("/deleteById")
    public R deleteById(@RequestParam Map<String,Object> params){
        companyService.deleteById(params);
        return R.ok("操作成功");
    }

    @GetMapping("/getPostUserInfo")
    public R getPostUserInfo(){
        Map<String, Object> map = new HashMap<>();
        map.put("userId",getUser().getUserId());
        List<Map<String, Object>> postUserInfo = companyService.getPostUserInfo(map);
        Map<String,Object> map1 = new HashMap<>();
        map1.put("postUserInfo",postUserInfo);
        return R.ok(map1);
    }
}
