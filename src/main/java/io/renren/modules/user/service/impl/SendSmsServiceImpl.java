package io.renren.modules.user.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import io.renren.modules.user.service.SendSmsService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class SendSmsServiceImpl implements SendSmsService {
    @Override
    public boolean send(String phoneNum, String templateCode, Map<String, Object> code) {
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "AccessKey ID", "AccessKey Secret");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");

        //自定义的参数（手机号,签名,验证码,模板）
        request.putQueryParameter("PhoneNumbers", phoneNum);
        request.putQueryParameter("SignName", "南风吹梧桐");
        request.putQueryParameter("TemplateCode", templateCode);
        request.putQueryParameter("TemplateParam", JSONObject.toJSONString(code));

        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
            return response.getHttpResponse().isSuccess();
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return false;
    }
}
