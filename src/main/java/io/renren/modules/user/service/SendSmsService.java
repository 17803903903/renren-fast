package io.renren.modules.user.service;

import java.util.Map;

public interface SendSmsService {
    public boolean send(String phoneNum, String templateCode, Map<String, Object> code);
}
