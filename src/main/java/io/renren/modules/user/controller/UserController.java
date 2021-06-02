package io.renren.modules.user.controller;

import io.renren.common.utils.Constant;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.sys.controller.AbstractController;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysUserService;
import io.renren.modules.user.service.SendSmsService;
import io.renren.modules.user.service.UserInfoService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * @author zhaojin
 * @date 2021/3/4 15:10
 */
@RestController
@RequestMapping("/user")
public class UserController extends AbstractController {

    @Autowired
    private SendSmsService sendSmsService;

    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    SysUserService sysUserService;

    @GetMapping("/code/{phone}")
    public R getCode(@PathVariable("phone") String phone){
        //调用发送方法(模拟真实业务redis)
        String code = redisTemplate.opsForValue().get(phone);
        if (!StringUtils.isEmpty(code)){
            return R.ok("验证码已发送，还没有过期");
        }
        //生成验证码并存储在redis中
        code = UUID.randomUUID().toString().substring(0, 4);
        HashMap<String,Object> param = new HashMap<>();
        param.put("code",code);

        boolean isSend = sendSmsService.send(phone, "SMS_204460556", param);
        if (isSend){
            redisTemplate.opsForValue().set(phone,code,5, TimeUnit.MINUTES);
            return R.ok("验证码发送成功");
        }else {
            return R.error("验证码发送失败！");
        }
    }

    @GetMapping("/getUserInfo")
    public R getUserInfo(){
        List<Map<String, Object>> userInfo = userInfoService.getUserInfo();
        Map<String, Object> map = new HashMap<>();
        map.put("userInfo",userInfo);
        return R.ok(map);
    }

    @PostMapping("/updateUserInfo")
    public R updateUserInfo(@RequestParam Map<String,Object> params){
        try {
            params.put("id",getUser().getUserId());
            SysUserEntity user = getUser();
            if (user.getCertification() == 1){
                userInfoService.updateUserInfo(params);
            }else {
                return R.error("请先认证");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return R.ok("操作失败");
        }
        return R.ok("操作成功");
    }

    @PostMapping("/saveUserInfo")
    public R saveUserInfo(@RequestParam Map<String,Object> params){
        params.put("id",getUser().getUserId());
        if (userInfoService.getPersonalInfo(params)!= null){
            return R.error("数据库中已存在您的个人信息");
        }
        SysUserEntity user = getUser();
        user.setMobile((String) params.get("phone"));
        user.setEmail(String.valueOf(params.get("email")));
        sysUserService.update(user);
        try {
            userInfoService.saveUserInfo(params);
        } catch (Exception e) {
            e.printStackTrace();
            return R.ok("操作失败");
        }
        return R.ok("操作成功");
    }

    @GetMapping("/getPersonalInfo")
    public R getPersonalInfo(){
        Map<String, Object> map = new HashMap<>();
        map.put("id",getUser().getUserId());
        if (userInfoService.getPersonalInfo(map)==null){
            return R.error("请先填写个人信息");
        }else {
            return R.ok(userInfoService.getPersonalInfo(map));
        }
    }

    @GetMapping("/getAllJobInfo")
    public R getJobInfo(@RequestParam Map<String,Object> params){
        List<Map<String, Object>> allJobInfo = userInfoService.getAllJobInfo(params);
        Map<String,Object> map = new HashMap<>();
        map.put("jobInfo",allJobInfo);
        return R.ok(map);
    }

    @PostMapping("/certification")
    public R certification(@RequestParam Map<String,Object> params){
        SysUserEntity user = getUser();
        if (user.getCertification() == 1){
            return R.error("已认证");
        }else {
            if (Objects.equals(redisTemplate.opsForValue().get(params.get("phone")),params.get("code"))){
                userInfoService.updateIdNumber(params);
                user.setCertification(1);
                sysUserService.update(user);
            }else {
                return R.error("认证失败！验证码错误");
            }
        }
        return R.ok("操作成功");
    }

    @PostMapping("/saveCompanyPost")
    public R saveCompanyPost(@RequestParam Map<String,Object> params){
        params.put("userId",getUser().getUserId());
        try {
            SysUserEntity user = getUser();
            if (user.getCertification() == 1){
                userInfoService.saveCompanyPost(params);
            }else {
                return R.error("请先认证");
            }

        }catch (Exception e){
            return R.error("投递失败");
        }
        return R.ok("投递成功");
    }
}
